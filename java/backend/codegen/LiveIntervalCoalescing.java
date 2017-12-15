/*
 * Extremely C language Compiler
 * Copyright (c) 2015-2017, Xlous Zeng.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
 * or implied.  See the License for the specific language governing
 * permissions and limitations under the License.
 */

package backend.codegen;

import backend.analysis.LiveVariables;
import backend.analysis.MachineLoop;
import backend.pass.AnalysisUsage;
import backend.support.IntStatistic;
import backend.target.TargetInstrInfo;
import backend.target.TargetMachine;
import backend.target.TargetRegisterClass;
import backend.target.TargetRegisterInfo;
import tools.OutParamWrapper;
import tools.Pair;
import tools.Util;

import java.util.ArrayList;

import static backend.codegen.LiveIntervalAnalysis.getDefIndex;
import static backend.target.TargetRegisterInfo.isPhysicalRegister;
import static backend.target.TargetRegisterInfo.isVirtualRegister;

/**
 * This file defines a class takes responsibility for performing register coalescing
 * on live interval to eliminate redundant move instruction.
 * @author Xlous.zeng
 * @version 0.1
 */
public final class LiveIntervalCoalescing extends MachineFunctionPass
{
    public static IntStatistic numJoins =
            new IntStatistic("liveIntervals", "Number of intervals joins performed");

    private MachineFunction mf;
    private TargetMachine tm;
    private LiveIntervalAnalysis li;
    private TargetRegisterInfo tri;
    private MachineRegisterInfo mri;
    private LiveVariables lv;

    @Override
    public void getAnalysisUsage(AnalysisUsage au)
    {
        assert au != null;
        au.addPreserved(MachineLoop.class);
        au.addPreserved(LiveIntervalAnalysis.class);
        au.addPreserved(LiveVariables.class);
        au.addPreserved(PhiElimination.class);
        au.addPreserved(TwoAddrInstructionPass.class);
        super.getAnalysisUsage(au);
    }

    @Override
    public boolean runOnMachineFunction(MachineFunction mf)
    {
        this.mf = mf;
        tm = mf.getTarget();
        li = (LiveIntervalAnalysis) getAnalysisToUpDate(LiveIntervalAnalysis.class);
        tri = tm.getRegisterInfo();
        mri = mf.getMachineRegisterInfo();
        lv = (LiveVariables) getAnalysisToUpDate(LiveVariables.class);
        joinIntervals();
        return false;
    }

    @Override
    public String getPassName()
    {
        return "Live Interval Coalescing Pass";
    }

    private void joinIntervals()
    {
        if (Util.DEBUG)
            System.err.printf("************ Joining Intervals *************\n");

        MachineLoop loopInfo = (MachineLoop) getAnalysisToUpDate(MachineLoop.class);
        if (loopInfo != null)
        {
            if (loopInfo.isNoTopLevelLoop())
            {
                // If there are no loops in the function, join intervals in function
                // order.
                for (MachineBasicBlock mbb : mf.getBasicBlocks())
                    joinIntervalsInMachineBB(mbb);
            }
            else
            {
                // Otherwise, join intervals in inner loops before other intervals.
                // Unfortunately we can't just iterate over loop hierarchy here because
                // there may be more MBB's than BB's.  Collect MBB's for sorting.
                ArrayList<Pair<Integer, MachineBasicBlock>> mbbs = new ArrayList<>();
                mf.getBasicBlocks().forEach(mbb -> {
                    mbbs.add(Pair.get(loopInfo.getLoopDepth(mbb),
                            mbb));
                });

                // Sort mbb by loop depth.
                mbbs.sort((lhs, rhs) -> {
                    if (lhs.first > rhs.first)
                        return -1;
                    if (lhs.first.equals(rhs.first) && lhs.second.getNumber() < rhs.second.getNumber())
                        return -1;
                    return 1;
                });

                // Finally, joi intervals in loop nest order.
                for (Pair<Integer, MachineBasicBlock> pair : mbbs)
                {
                    joinIntervalsInMachineBB(pair.second);
                }
            }
        }

        if (Util.DEBUG)
        {
            System.err.printf("**** Register mapping ***\n");
            for (int key : li.r2rMap.keys())
            {
                System.err.printf(" reg %d -> reg %d\n", key, li.r2rMap.get(key));
            }
        }
    }

    private void joinIntervalsInMachineBB(MachineBasicBlock mbb)
    {
        if (Util.DEBUG)
            System.err.printf("%s:\n", mbb.getBasicBlock().getName());
        TargetInstrInfo tii = tm.getInstrInfo();

        for (MachineInstr mi : mbb.getInsts())
        {
            if (Util.DEBUG)
            {
                System.err.printf("%d\t", li.getInstructionIndex(mi));
                mi.print(System.err, tm);
            }

            // we only join virtual registers with allocatable
            // physical registers since we do not have liveness information
            // on not allocatable physical registers
            OutParamWrapper<Integer> srcReg = new OutParamWrapper<>(0);
            OutParamWrapper<Integer> dstReg = new OutParamWrapper<>(0);
            if (tii.isMoveInstr(mi, srcReg, dstReg, null, null)
                    && (isVirtualRegister(srcReg.get())
                    || lv.getAllocatablePhyRegs().get(srcReg.get()))
                    && (isVirtualRegister(dstReg.get())
                    || lv.getAllocatablePhyRegs().get(dstReg.get())))
            {
                // Get representaive register.
                int regA = li.rep(srcReg.get());
                int regB = li.rep(dstReg.get());

                if (regA == regB)
                    continue;

                // If there are both physical register, we can not join them.
                if (isPhysicalRegister(regA) && isPhysicalRegister(regB))
                {
                    continue;
                }

                // If they are not of the same register class, we cannot join them.
                if (differingRegisterClasses(regA, regB))
                {
                    continue;
                }

                LiveInterval intervalA = li.getInterval(regA);
                LiveInterval intervalB = li.getInterval(regB);
                assert intervalA.register == regA && intervalB.register == regB
                        :"Regiser diagMapping is horribly borken!";

                if (Util.DEBUG)
                {
                    System.err.printf("Inspecting ");
                    intervalA.print(System.err, tri);
                    System.err.print(" and ");
                    intervalB.print(System.err, tri);
                    System.err.print(": ");
                }

                // If two intervals contain a single value and are joined by a copy, it
                // does not matter if the intervals overlap, they can always be joined.
                boolean triviallyJoinable = intervalA.containsOneValue() &&
                        intervalB.containsOneValue();

                int midDefIdx = getDefIndex(li.getInstructionIndex(mi));
                if (triviallyJoinable || intervalB.joinable(intervalA, midDefIdx)
                        && !overlapsAliases(intervalA, intervalB))
                {
                    intervalB.join(intervalA, midDefIdx);

                    if (!isPhysicalRegister(regA))
                    {
                        li.r2rMap.remove(regA);
                        li.r2rMap.put(regA, regB);
                    }
                    else
                    {
                        li.r2rMap.put(regB, regA);
                        intervalB.register = regA;
                        intervalA.swap(intervalB);
                        li.reg2LiveInterval.remove(regB);
                    }
                    numJoins.inc();
                }
                else
                {
                    if (Util.DEBUG)
                        System.err.println("Interference!");
                }
            }
        }
    }


    /**
     *
     * @param src
     * @param dest
     * @return
     */
    private boolean overlapsAliases(LiveInterval src, LiveInterval dest)
    {
        if (!isPhysicalRegister(src.register))
        {
            if (!isPhysicalRegister(dest.register))
                return false;       // Virtual register never aliased.
            LiveInterval temp = src;
            src = dest;
            dest = temp;
        }

        assert isPhysicalRegister(src.register)
                : "First interval describe a physical register";

        for (int alias : tri.getAliasSet(src.register))
        {
            LiveInterval aliasLI = li.getInterval(alias);
            if (aliasLI == null)
                continue;
            if (dest.overlaps(aliasLI))
                return true;
        }
        return false;
    }

    /**
     * Return true if the two specified registers belong to different register
     * classes.  The registers may be either phys or virt regs.
     * @param regA
     * @param regB
     * @return
     */
    private boolean differingRegisterClasses(int regA, int regB)
    {
        TargetRegisterClass rc = null;
        if (isPhysicalRegister(regA))
        {
            assert isVirtualRegister(regB):"Can't consider two physical register";
            rc = mri.getRegClass(regB);
            return !rc.contains(regA);
        }

        // Compare against the rc for the second reg.
        rc = mri.getRegClass(regA);
        if (isVirtualRegister(regB))
            return !rc.equals(mri.getRegClass(regB));
        else
            return !rc.contains(regB);
    }
}