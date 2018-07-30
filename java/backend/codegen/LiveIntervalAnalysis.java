package backend.codegen;
/*
 * Extremely C language Compiler
 * Copyright (c) 2015-2018, Jianping Zeng.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
 * or implied.  See the License for the specific language governing
 * permissions and limitations under the License.
 */

import backend.analysis.LiveVariables;
import backend.analysis.MachineDomTree;
import backend.analysis.MachineLoop;
import backend.pass.AnalysisUsage;
import backend.support.DepthFirstOrder;
import backend.support.IntStatistic;
import backend.support.MachineFunctionPass;
import backend.target.TargetInstrInfo;
import backend.target.TargetMachine;
import backend.target.TargetRegisterClass;
import backend.target.TargetRegisterInfo;
import backend.value.Module;
import gnu.trove.map.hash.TObjectIntHashMap;
import tools.BitMap;
import tools.OutRef;
import tools.Util;

import java.io.PrintStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

import static backend.support.BackendCmdOptions.UseDFSOnNumberMI;
import static backend.support.DepthFirstOrder.dfTraversal;
import static backend.target.TargetRegisterInfo.isPhysicalRegister;
import static backend.target.TargetRegisterInfo.isVirtualRegister;

/**
 * @author Jianping Zeng
 * @version 0.1
 */
public class LiveIntervalAnalysis extends MachineFunctionPass
{
    public static IntStatistic numIntervals =
            new IntStatistic("liveIntervals", "Number of original intervals");

    public static IntStatistic numFolded =
            new IntStatistic("liveIntervals", "Number of loads/stores folded into instructions");

    public interface InstrSlots
    {
        int LOAD = 0;
        int USE = 1;
        int DEF = 2;
        int STORE = 3;
        int NUM = 4;
    }

    /**
     * A mapping from instruction number to itself.
     */
    private MachineInstr[] idx2MI;

    /**
     * A mapping from MachineInstr to its number.
     */
    public HashMap<MachineInstr, Integer> mi2Idx;

    public TreeMap<Integer, LiveInterval> reg2LiveInterval;
    private HashMap<LiveInterval, Integer> liveInterval2Reg;

    private LiveVariables lv;
    private MachineFunction mf;
    private TargetMachine tm;
    private TargetRegisterInfo tri;
    private BitMap allocatableRegs;
    private TargetInstrInfo tii;
    private MachineRegisterInfo mri;
    private ArrayList<MachineBasicBlock> numberOrder;

    private TreeMap<Integer, MachineBasicBlock> idx2MBBs;
    private TObjectIntHashMap<MachineBasicBlock> mbb2Idx;

    @Override
    public void getAnalysisUsage(AnalysisUsage au)
    {
        au.setPreservesCFG();
        // TODO 2017/11/16 current can not add AA supporting au.addRequired(AliasAnalysis.class);
        // TODO 2017/11/16 au.addPreserved(AliasAnalysis.class);
        au.addPreserved(LiveVariables.class);
        // Compute dead set and kill set for each machine instr.
        au.addRequired(LiveVariables.class);

        // Obtains the loop information used for assigning a spilling weight to
        // each live interval. The more nested, the more weight.
        au.addPreserved(MachineDomTree.class);
        au.addRequired(MachineDomTree.class);
        au.addPreserved(MachineLoop.class);
        au.addRequired(MachineLoop.class);
        // Eliminate phi node.
        au.addPreserved(PhiElimination.class);
        au.addRequired(PhiElimination.class);

        // Converts the RISC-like MachineInstr to two addr instruction in some
        // target, for example, X86.
        au.addRequired(TwoAddrInstructionPass.class);
        super.getAnalysisUsage(au);
    }

    @Override
    public String getPassName()
    {
        return "Computes Live Intervals for each virtual register";
    }

    public void putIndex2MI(int idx, MachineInstr mi)
    {
        idx2MI[idx >> Util.log2(InstrSlots.NUM)] = mi;
    }

    private MachineInstr getMIByIdx(int idx)
    {
        return idx2MI[idx >> Util.log2(InstrSlots.NUM)];
    }

    @Override
    public boolean runOnMachineFunction(MachineFunction mf)
    {
        if (Util.DEBUG)
        {
            System.err.println("*********** Live Interval Analysis **********");
            System.err.printf("***********Function: %s\n", mf.getFunction().getName());
        }

        this.mf = mf;
        lv = (LiveVariables) getAnalysisToUpDate(LiveVariables.class);
        tm = mf.getTarget();
        tri = tm.getRegisterInfo();
        tii = tm.getInstrInfo();
        allocatableRegs = tri.getAllocatableSet(mf);
        mri = mf.getMachineRegisterInfo();
        mi2Idx = new HashMap<>();
        reg2LiveInterval = new TreeMap<>();
        liveInterval2Reg = new HashMap<>();
        idx2MBBs = new TreeMap<>();
        mbb2Idx = new TObjectIntHashMap<>();

        MachineLoop ml = (MachineLoop) getAnalysisToUpDate(MachineLoop.class);

        // Step#1: Handle live-in regs of mf.
        // Step#2: Numbering each MachineInstr in each MachineBasicBlock.

        int idx = 0;
        numberOrder = UseDFSOnNumberMI.value?
                DepthFirstOrder.dfs(mf.getEntryBlock()) :dfTraversal(mf.getEntryBlock());
        int numOfMI = 0;
        for (MachineBasicBlock mbb : numberOrder)
        {
            numOfMI += mbb.size();
        }
        idx2MI = new MachineInstr[numOfMI];

        // Step#3: Walk through each MachineInstr to compute live interval.
        for (MachineBasicBlock mbb : numberOrder)
        {
            idx2MBBs.put(idx, mbb);
            mbb2Idx.put(mbb, idx/InstrSlots.NUM);

            for (int i = 0, e = mbb.size(); i != e; i++)
            {
                MachineInstr mi = mbb.getInstAt(i);
                Util.assertion(!(mi2Idx.containsKey(mi)), "Duplicate mi2Idx entry");
                mi2Idx.put(mi, idx);
                putIndex2MI(idx, mi);
                idx += InstrSlots.NUM;
            }
        }

        if (Util.DEBUG)
        {
            for (MachineBasicBlock mbb : mf.getBasicBlocks())
            {
                for (MachineInstr mi : mbb.getInsts())
                {
                    System.err.printf("%d:", mi2Idx.get(mi));
                    mi.print(System.err, tm);
                }
            }
        }
        // Step#4: Compute live interval.
        computeLiveIntervals();

        numIntervals.add(getNumIntervals());
        if (Util.DEBUG)
        {
            System.err.printf("*********** Intervals *************\n");
            for (LiveInterval interval : reg2LiveInterval.values())
            {
                interval.print(System.err, tri);
            }
        }

        if (Util.DEBUG)
        {
            System.err.printf("************ Intervals *************\n");
            for (LiveInterval interval : reg2LiveInterval.values())
            {
                interval.print(System.err, tri);
            }
            System.err.printf("************ MachineInstrs *************\n");
            for (MachineBasicBlock mbb : mf.getBasicBlocks())
            {
                System.err.println(mbb.getBasicBlock().getName() + ":");
                for (int i = 0, e = mbb.size(); i < e; i++)
                {
                    MachineInstr mi = mbb.getInstAt(i);
                    System.err.printf("%d\t", getInstructionIndex(mi));
                    mi.print(System.err, tm);
                }
            }
        }
        return true;
    }

    public int getNumIntervals()
    {
        return reg2LiveInterval.size();
    }

    public TreeMap<Integer, LiveInterval> getReg2LiveInterval()
    {
        return reg2LiveInterval;
    }

    private LiveInterval createLiveInterval(int reg)
    {
        float weight = isPhysicalRegister(reg) ? Float.MAX_VALUE : 0;
        return new LiveInterval(reg, weight);
    }

    /**
     * Obtains the live interval corresponding to the reg. Creating a new one if
     * there is no live interval as yet.
     * @param reg
     * @return
     */
    private LiveInterval getOrCreateInterval(int reg)
    {
        if(reg2LiveInterval.containsKey(reg))
            return reg2LiveInterval.get(reg);

        LiveInterval newInterval = createLiveInterval(reg);
        reg2LiveInterval.put(reg, newInterval);
        liveInterval2Reg.put(newInterval, reg);
        return newInterval;
    }

    public LiveInterval getInterval(int reg)
    {
        return reg2LiveInterval.getOrDefault(reg, null);
    }

    public String getRegisterName(int register)
    {
        if (isPhysicalRegister(register))
            return tri.getName(register);
        else
            return "%reg" + register;
    }

    public int getInstructionIndex(MachineInstr mi)
    {
        Util.assertion( mi2Idx.containsKey(mi));
        return mi2Idx.get(mi);
    }

    private static int getBaseIndex(int index)
    {
        return (index / InstrSlots.NUM) * InstrSlots.NUM;
        //return index - index % InstrSlots.NUM;
    }

    public static int getDefIndex(int index)
    {
        return getBaseIndex(index) + InstrSlots.DEF;
    }

    private static int getUseIndex(int index)
    {
        return getBaseIndex(index) + InstrSlots.USE;
    }

    private static int getLoadIndex(int index)
    {
        return getBaseIndex(index) + InstrSlots.LOAD;
    }

    private static int getStoreIndex(int index)
    {
        return getBaseIndex(index) + InstrSlots.STORE;
    }

    /**
     *
     * @param mbb
     * @param index
     * @param li
     */
    private void handleVirtualRegisterDef(
            MachineBasicBlock mbb,
            int index,
            LiveInterval li)
    {
        if (Util.DEBUG)
            System.err.printf("\t\tregister: %s\n", getRegisterName(li.register));

        LiveVariables.VarInfo vi = lv.getVarInfo(li.register);

        // Virtual registers may be defined multiple times (due to phi
        // elimination and 2-addr elimination).  Much of what we do only has to be
        // done once for the vreg.  We use an empty interval to detect the first
        // time we see a vreg.
        if (li.isEmpty())
        {
            int defIdx = getDefIndex(getInstructionIndex(mbb.getInstAt(index)));

            // If the only use instruction is lives in block as same as mbb.
            if (vi.kills.size() == 1 && vi.kills.get(0).getParent().equals(mbb))
            {
                int killIdx;
                // Check if the def mi is same as use mi or not
                if (!vi.kills.get(0).equals(mbb.getInstAt(index)))
                {
                    // the kill till to use slot
                    killIdx = getUseIndex(getInstructionIndex(vi.kills.get(0))) + 1;
                }
                else
                {
                    // the kill idx gets store slot
                    killIdx = defIdx + 1;
                }

                // If the kill happens after the definition, we have an intra-block
                // live range.
                if (killIdx > defIdx)
                {
                    Util.assertion(vi.aliveBlocks.isEmpty(), "Shouldn't be alive across any block");
                    LiveRange range = new LiveRange(defIdx, killIdx, li.getNextValue());
                    li.addRange(range);
                    return;
                }
            }

            // The other case we handle is when a virtual register lives to the end
            // of the defining block, potentially live across some blocks, then is
            // live into some number of blocks, but gets killed.  Start by adding a
            // range that goes from this definition to the end of the defining block.
            int lastIdx = getInstructionIndex(mbb.getInsts().getLast()) + InstrSlots.NUM;
            LiveRange liveThrough = new LiveRange(defIdx, lastIdx, li.getNextValue());
            li.addRange(liveThrough);

            for (int i = 0, e = vi.aliveBlocks.size(); i != e; i++)
            {
                // The index to block where the def reg is alive to out.
                // add [getInstructionIndex(getFirst(parent)), getInstructionIndex(getLast(parent)) + 4)
                // LiveRange to the LiveInterval.
                int bbIdx = vi.aliveBlocks.get(i);
                MachineBasicBlock block = mf.getMBBAt(bbIdx);
                if (block != null && !block.isEmpty())
                {
                    int begin = getInstructionIndex(block.getInsts().getFirst());
                    int end = getInstructionIndex(block.getInsts().getLast()) + InstrSlots.NUM;
                    li.addRange(new LiveRange(begin, end, li.getNextValue()));
                }
            }

            // Finally, this virtual register is live from the start of any killing
            // block to the 'use' slot of the killing instruction.
            for (MachineInstr killMI : vi.kills)
            {
                int begin = getInstructionIndex(killMI.getParent().getInsts().getFirst());
                int end = getUseIndex(getInstructionIndex(killMI)) + 1;
                li.addRange(new LiveRange(begin, end, li.getNextValue()));
            }
        }
        else
        {
            // It is the second time we have seen it. This caused by two-address
            // instruction pass or phi elimination pass.

            // If it is the result of 2-addr instruction elimination, the first
            // operand must be register and it is def-use.
            MachineInstr mi = mbb.getInstAt(index);
            //MachineOperand mo = mi.getOperand(0);

            /*if (mo.isRegister()
                && mo.getReg() == li.register
                && mo.isDef()
                && mo.isUse())
                */
            if (mi.isRegTiedToUseOperand(0, null))
            {
                int defIndex = getDefIndex(getInstructionIndex(vi.defInst));
                int redefIndex = getDefIndex(getInstructionIndex(mi));

                // remove other live range that intersects with the [defIndex, redefIndex).
                li.removeRange(defIndex, redefIndex);

                LiveRange lr = new LiveRange(defIndex, redefIndex, li.getNextValue());
                li.addRange(lr);

                // If this redefinition is dead, we need to add a dummy unit live
                // range covering the def slot.
                if (mi.registerDefIsDead(li.register, tri))
                    li.addRange(new LiveRange(redefIndex, redefIndex + 1, li.getNextValue()));
            }
            else
            {
                // Reaching here, it must be caused by phi elimination.
                if (li.containsOneValue())
                {
                    // true.BB:
                    //    %a1 = 0
                    //    br end
                    // false.BB:
                    //    %a2 = 1
                    //    br end
                    // end:
                    //    %res = phi[%a1, %a2]   // The solely use.
                    //    ret %res.
                    //
                    // After phi elimination.
                    // true.BB:
                    //    %a1 = 0
                    //    %res = %a1
                    //    br end
                    // false.BB:
                    //    %a2 = 1
                    //    %res = %a2
                    //    br end
                    // end:
                    //    ret %res.
                    Util.assertion(vi.kills.size() == 1, "PHI elimination vreg should have one kill, the PHI itself");

                    MachineInstr killer = vi.kills.get(0);
                    int start = getInstructionIndex(killer.getParent().getInsts().getFirst());
                    int end = getUseIndex(getInstructionIndex(killer)) + 1;

                    li.removeRange(start, end);

                    li.addRange(new LiveRange(start, end, li.getNextValue()));
                }

                // In the case of PHI elimination, each variable definition is only
                // live until the end of the block.  We've already take care of the
                // rest of the live range.
                int defIndex = getDefIndex(getInstructionIndex(mi));
                LiveRange r = new LiveRange(defIndex,
                        getInstructionIndex(mbb.getLastInst()) + InstrSlots.NUM,
                        li.getNextValue());
                li.addRange(r);
            }
        }
    }

    private void handleRegisterDef(MachineBasicBlock mbb, int index, int reg)
    {
        if (TargetRegisterInfo.isVirtualRegister(reg))
        {
            handleVirtualRegisterDef(mbb, index, getOrCreateInterval(reg));
        }
        else if (allocatableRegs.get(reg))
        {
            // If the reg is physical, checking on if it is allocable or not.
            OutRef<Integer> srcReg = new OutRef<>();
            OutRef<Integer> destReg = new OutRef<>();
            if (!tii.isMoveInstr(mbb.getInstAt(index), srcReg, destReg, null, null))
            {
                srcReg.set(0);
                destReg.set(0);
            }

            handlePhysicalRegisterDef(mbb, index,
                    getOrCreateInterval(reg),
                    srcReg.get(), destReg.get(),
                    false);
            for (int subReg : tri.getSubRegisters(reg))
            {
                // Def of a register also defines its sub-registers.
                if (!mbb.getInstAt(index).modifiedRegister(subReg, tri))
                {
                    // If MI also modifies the sub-register explicitly, avoid processing it
                    // more than once. Do not pass in TRI here so it checks for exact match.
                    handlePhysicalRegisterDef(mbb, index,
                            getOrCreateInterval(subReg),
                            srcReg.get(), destReg.get(), false);
                }
            }
        }
    }

    private MachineInstr getInstructionFromIndex(int idx)
    {
        return getMIByIdx(idx);
    }

    private void handlePhysicalRegisterDef(
            MachineBasicBlock mbb,
            int index,
            LiveInterval interval,
            int srcReg,
            int destReg,
            boolean isLiveIn)
    {
        MachineInstr mi = mbb.getInstAt(index);
       int baseIndex = getInstructionIndex(mi);
       int start = getDefIndex(baseIndex);
       int end = start;

        exit:
        {
            // If it is not used after definition, it is considered dead at
            // the instruction defining it. Hence its interval is:
            // [defSlot(def), defSlot(def)+1)
            if (mi.registerDefIsDead(interval.register, tri))
            {
                end = getDefIndex(start) + 1;
                break exit;
            }

            // If it is not dead on definition, it must be killed by a
            // subsequent instruction. Hence its interval is:
            // [defSlot(def), useSlot(kill)+1)
            while (++index != mbb.size())
            {
                baseIndex += InstrSlots.NUM;
                if (mbb.getInstAt(index).killsRegister(interval.register))
                {
                    end = getUseIndex(baseIndex) + 1;
                    break exit;
                }
            }

            Util.assertion(isLiveIn, "phyreg was not killed in defining block!");
            end = getDefIndex(start) + 1;
        }

        Util.assertion(start < end, "did not find end of intervals");

        // Finally, if this is defining a new range for the physical register, and if
        // that physreg is just a copy from a vreg, and if THAT vreg was a copy from
        // the physreg, then the new fragment has the same value as the one copied
        // into the vreg.
        if (interval.register == destReg
                && !interval.isEmpty()
                && isVirtualRegister(srcReg))
        {
            // Get the live interval for the vreg, see if it is defined by a copy.
            LiveInterval srcInterval = getOrCreateInterval(srcReg);

            if (srcInterval.containsOneValue())
            {
                Util.assertion(!srcInterval.isEmpty(), "Can't contain a value and be empty");

                int startIdx = srcInterval.getRange(0).start;
                MachineInstr srcDefMI = getInstructionFromIndex(startIdx);

                OutRef<Integer> vregSrcSrc = new OutRef<>();
                OutRef<Integer> vregSrcDest = new OutRef<>();
                if (tii.isMoveInstr(srcDefMI, vregSrcSrc, vregSrcDest, null, null)
                        && srcReg == vregSrcDest.get()
                        && destReg == vregSrcSrc.get())
                {
                    LiveRange range = interval.getLiveRangeContaining(startIdx-1);
                    if (range != null)
                    {
                        LiveRange lr = new LiveRange(startIdx, end, range.valId);
                        interval.addRange(lr);
                        return;
                    }
                }
            }
        }

        LiveRange lr = new LiveRange(start, end, interval.getNextValue());
        interval.addRange(lr);
    }

    private void computeLiveIntervals()
    {
        // Process each def operand for each machine instr, including implicitly
        // definition and explicitly definition.
        // Just walk instruction from start to end since advantage caused by
        // MachineInstr's SSA property, definition dominates all uses.
        // So avoiding iterative dataflow analysis to compute local liveIn and
        // liveOuts.
        for (MachineBasicBlock mbb : numberOrder)
        {
            for (int i = 0, e = mbb.size(); i != e; i++)
            {
                MachineInstr mi = mbb.getInstAt(i);

                // Process defs (includes explicitly and implicitly defs).
                for (int j = 0, sz = mi.getNumOperands(); j < sz; ++j)
                {
                    MachineOperand mo = mi.getOperand(j);
                    if (mo.isRegister() && mo.getReg() != 0 && mo.isDef())
                        handleRegisterDef(mbb, i, mo.getReg());
                }
            }
        }
    }
    public ArrayList<LiveInterval> addIntervalsForSpills(
            LiveInterval interval,
            VirtRegMap vrm,
            int slot)
    {
        ArrayList<LiveInterval> added = new ArrayList<>();

        Util.assertion(interval.weight < Float.MAX_VALUE,
                "attempt to spill already spilled interval");

        if (Util.DEBUG)
        {
            System.err.printf("\t\t\tadding interals for spills for interval: ");
            interval.print(System.err, tri);
            System.err.println();
        }

        TargetRegisterClass rc = mri.getRegClass(interval.register);

        for (LiveRange lr : interval.ranges)
        {
            int index = getBaseIndex(lr.start);
            int end = getBaseIndex(lr.end -1 ) + InstrSlots.NUM;

            for (; index != end; index += InstrSlots.NUM)
            {
                // Skip deleted instructions.
                while (index != end && getInstructionFromIndex(index) == null)
                {
                    index += InstrSlots.NUM;
                }

                if (index == end)
                    break;

                MachineInstr mi = getInstructionFromIndex(index);

                boolean forOperand = false;
                do
                {
                    for (int i = 0, e = mi.getNumOperands(); i != e; i++)
                    {
                        MachineOperand mo = mi.getOperand(i);
                        if (mo.isRegister() && mo.getReg() == interval.register)
                        {
                            MachineInstr fmi = tii.foldMemoryOperand(mf, mi, i, slot);
                            if (fmi != null)
                            {
                                lv.instructionChanged(mi, fmi);
                                vrm.virtFolded(interval.register, mi, fmi);
                                mi2Idx.remove(mi);
                                putIndex2MI(index/InstrSlots.NUM, fmi);
                                mi2Idx.put(fmi, index);
                                MachineBasicBlock mbb = mi.getParent();
                                mbb.insert(mbb.remove(mi), fmi);
                                numFolded.inc();
                                forOperand = true;
                            }
                            else
                            {
                                // This is tricky. We need to add information in
                                // the interval about the spill code so we have to
                                // use our extra load/store slots.
                                //
                                // If we have a use we are going to have a load so
                                // we start the interval from the load slot
                                // onwards. Otherwise we start from the def slot.
                                int start = (mo.isUse() ? getLoadIndex(index) : getDefIndex(index));

                                // If we have a def we are going to have a store
                                // right after it so we end the interval after the
                                // use of the next instruction. Otherwise we end
                                // after the use of this instruction.
                                int stop = 1 + (mo.isDef() ? getStoreIndex(index) : getUseIndex(index));

                                int nReg = mri.createVirtualRegister(rc);
                                mi.setMachineOperandReg(i, nReg);
                                vrm.assignVirt2StackSlot(nReg, slot);
                                LiveInterval ni = getOrCreateInterval(nReg);
                                Util.assertion( ni.isEmpty());

                                ni.weight = Float.MAX_VALUE;
                                LiveRange r = new LiveRange(start, end, ni.getNextValue());
                                ni.addRange(r);
                                added.add(ni);

                                // Update viriable.
                                lv.addVirtualRegisterKilled(nReg, mi);
                            }
                        }
                    }
                }while (forOperand);
            }
        }

        return added;
    }

    public boolean findLiveinMBBs(
            int start,
            int end,
            ArrayList<MachineBasicBlock> liveMBBs)
    {
        boolean resVal = false;
        for (Map.Entry<Integer, MachineBasicBlock> pair : idx2MBBs.entrySet())
        {
            if (pair.getKey() < start)
                continue;
            if (pair.getKey() >= end)
                break;
            liveMBBs.add(pair.getValue());
            resVal = true;
        }
        return resVal;
    }

    public void print(PrintStream os, Module m)
    {
        os.printf("****************intervals*****************\n");
        for (LiveInterval interval : reg2LiveInterval.values())
        {
            interval.print(os, tri);
            os.println();
        }

        os.printf("****************machineinstrs**************\n");
        for (MachineBasicBlock mbb : mf.getBasicBlocks())
        {
            os.printf(mbb.getBasicBlock().getName());
            for (MachineInstr mi : mbb.getInsts())
            {
                os.printf("%d\t", getInstructionIndex(mi));
                mi.print(os, null);
            }
        }
    }
}
