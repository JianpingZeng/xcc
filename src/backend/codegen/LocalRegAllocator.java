package backend.codegen;

import backend.target.TargetInstrInfo;
import backend.target.TargetInstrInfo.MCInstrDescriptor;
import backend.target.TargetMachine;
import backend.target.TargetRegisterInfo;
import backend.target.TargetRegisterInfo.TargetRegisterClass;
import tools.BitMap;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

/**
 * This pass performs a pass of performing local register allocation on Machine
 * Basic Block.
 * @author Xlous.zeng
 * @version 0.1
 */
public class LocalRegAllocator extends MachineFunctionPass
{
	private MachineFunction mf;
	private TargetMachine tm;
	private TargetRegisterInfo regInfo;
	private TargetInstrInfo instrInfo;

	/**
	 * Maps SSA virtual register to its frame index into the stack where
	 * there values are spilled.
	 */
	private HashMap<Integer, Integer> stackSlotForVirReg;

	/**
	 * Mapping virtual register to physical register.
	 */
	HashMap<Integer, Integer> virToPhyRegMap;

	/**
	 * Mapping physical register to virtual register assigned to it..
	 */
	HashMap<Integer, Integer> phyRegUsed;

	/**
	 * Statics data for performance evaluation.
	 */
	private int numSpilled;
	private int numReloaded;

	public LocalRegAllocator()
	{
		virToPhyRegMap = new HashMap<>();
		phyRegUsed = new HashMap<>();
	}

	private int getStackSlotForVirReg(int virReg, TargetRegisterInfo.TargetRegisterClass rc)
	{
		// Find the location virReg would belong.
		if (stackSlotForVirReg.containsKey(virReg))
		{
			return stackSlotForVirReg.get(virReg);
		}

		// allocate a new stack object on stack frame of curent mf.
		int frameIdx = mf.getFrameInfo().createStackObject(rc);
		stackSlotForVirReg.put(virReg, frameIdx);
		return frameIdx;
	}

	/**
	 * This method updates some auxiliary data structure so that we know
	 * phyReg is in the properly container for virReg. The phyReg must be
	 * not used for anything else.
	 * @param virReg
	 * @param phyReg
	 */
	private void assignVirToPhyReg(int virReg, int phyReg)
	{
		assert !phyRegUsed.containsKey(phyReg):"phyreg is already assigned!";

		phyRegUsed.put(phyReg, virReg);
		virToPhyRegMap.put(virReg, phyReg);
		phyRegsUseOrder.addLast(phyReg);
	}

	private int getReg(MachineBasicBlock mbb, int insertPos, int virReg)
	{
		TargetRegisterClass rc = mf.getSsaRegMap().getRegClass(virReg);
		// first check to see if we have a free register.
		int phyReg = getFreeReg(rc);

		if (phyReg == 0)
		{
			assert !phyRegsUseOrder.isEmpty():"No allocatable registers";

			for (int i = 0; phyReg == 0; i++)
			{
				assert i != phyRegsUseOrder.size()
						: "Cann't find a register of the appropriate class";

				int r = phyRegsUseOrder.get(i);

				assert phyRegUsed.containsKey(r)
						: "PhyReg in phyRegsUseOrder, but is not allocated";
				if (phyRegUsed.get(r) != 0)
				{
					if (regInfo.getRegClass(r) == rc)
					{
						phyReg = r;
						break;
					}
					else
					{
						boolean subRegFound = false;
						for (int subReg : regInfo.get(r).subRegs)
							if (regInfo.getRegClass(subReg) == rc)
							{
								phyReg = subReg;
								subRegFound = true;
								break;
							}
						if (!subRegFound)
						{
							for (int superReg : regInfo.get(r).superRegs)
								if (regInfo.getRegClass(superReg) == rc)
								{
									phyReg = superReg;
									break;
								}
						}
					}
				}
			}

			assert phyReg != 0:"Physical register not be assisgned";

			spillPhyReg(mbb, insertPos, phyReg, false);
		}

		// now that we know which register we need to assign to this.
		assignVirToPhyReg(virReg, phyReg);
		return phyReg;
	}

	/**
	 * Returns true if the specified physical reg is not used and its alias register
	 * set also are not used.
	 * @param phyReg
	 * @return
	 */
	private boolean isPhyRegAvailable(int phyReg)
	{
		if (phyRegUsed.containsKey(phyReg)) return false;

		for (int subReg : regInfo.get(phyReg).subRegs)
			if (phyRegUsed.containsKey(subReg))
				return false;

		for (int superReg : regInfo.get(phyReg).superRegs)
			if (phyRegUsed.containsKey(superReg))
				return false;

		return true;
	}

	private int getFreeReg(TargetRegisterClass rc)
	{
		int size = rc.getNumRegs();
		for (int i = 0; i< size; i++)
		{
			int phyReg = rc.getRegister(i);
			if (isPhyRegAvailable(phyReg))
			{
				assert phyReg!=0:"Can not use register!";
				return phyReg;
			}
		}
		return 0;
	}

	private BitMap virRegModified = new BitMap();

	private void markVirRegModified(int virReg, boolean isModified)
	{
		assert virReg >= TargetRegisterInfo.FirstVirtualRegister;
		virReg -= TargetRegisterInfo.FirstVirtualRegister;
		virRegModified.set(virReg, isModified);
	}

	private int reloadVirReg(MachineBasicBlock mbb, int insertPos, int virReg)
	{
		// the virtual register already resides in a physical reg.
		if (virToPhyRegMap.containsKey(virReg))
		{
			int phyReg = virToPhyRegMap.get(virReg);
			markPhyRegRecentlyUsed(phyReg);
			return phyReg;
		}

		int phyReg = getReg(mbb, insertPos, virReg);

		TargetRegisterInfo.TargetRegisterClass rc = mf.getSsaRegMap().getRegClass(virReg);
		int frameIdx = getStackSlotForVirReg(virReg, rc);

		// note that this reg is just reloaded.
		markVirRegModified(virReg, false);

		regInfo.loadRegFromStackSlot(mbb, insertPos, phyReg, frameIdx, rc);

		// add the count for reloaded.
		++numReloaded;
		return phyReg;
	}

	/**
	 * This method spills the specified physical register into the
	 * virtual register slot associated with it.  If {@code onlyVirReg} is set to true,
	 * then the request is ignored if the physical register does not contain a
	 * virtual register.
	 * @param mbb
	 * @param insertPos
	 * @param phyReg
	 * @param onlyVirReg
	 */
	private void spillPhyReg(MachineBasicBlock mbb, int insertPos, int phyReg, boolean onlyVirReg)
	{
		if (phyRegUsed.containsKey(phyReg))
		{
			if(phyRegUsed.get(phyReg) != 0 || !onlyVirReg)
				spillVirReg(mbb, insertPos, phyRegUsed.get(phyReg), phyReg);
		}
		else
		{
			for (int subReg : regInfo.get(phyReg).subRegs)
			{
				Integer virReg = phyRegUsed.get(subReg);
				if (virReg != null && virReg != 0 || !onlyVirReg)
					spillVirReg(mbb, insertPos, phyReg, virReg);
			}

			for (int superReg : regInfo.get(phyReg).superRegs)
			{
				Integer virReg = phyRegUsed.get(superReg);
				if (virReg != null && virReg != 0 || !onlyVirReg)
					spillVirReg(mbb, insertPos, phyReg, virReg);
			}
		}
	}

	private void spillVirReg(MachineBasicBlock mbb, int insertPos,
			int virReg, int phyReg)
	{
		TargetRegisterInfo.TargetRegisterClass rc = mf.getSsaRegMap().getRegClass(virReg);
		int frameIdx = getStackSlotForVirReg(virReg, rc);
		regInfo.storeRegToStackSlot(mbb, insertPos, phyReg, frameIdx, rc);

		// add count for spilled.
		++numSpilled;
	}

	private LinkedList<Integer> phyRegsUseOrder = new LinkedList<>();

	/**
	 * Returns true if they are equal or if the {@code reg1} is in the
	 * alias register set of {@code reg2}.
	 * @param reg1
	 * @param reg2
	 * @return
	 */
	private boolean areRegEqual(int reg1, int reg2)
	{
		if (reg1 == reg2) return true;

		for(int subReg : regInfo.get(reg2).subRegs)
			if (reg1 == subReg)
				return true;

		return false;
	}

	private void markPhyRegRecentlyUsed(int reg)
	{
		assert !phyRegsUseOrder.isEmpty():"No register used!";

		// the reg is most recently used.
		if (phyRegsUseOrder.getLast() == reg)
			return;

		for (int i = phyRegsUseOrder.size() - 1; i>=0; i--)
		{
			if (areRegEqual(reg, phyRegsUseOrder.get(i)))
			{
				int regMatch = phyRegsUseOrder.get(i);
				phyRegsUseOrder.remove(i);
				// add it to the end of the list which indicates reg is most
				// recently used.
				phyRegsUseOrder.addLast(reg);
				if (regMatch == reg)
					return;  // found a exact match, return early.
			}
		}
	}

	private void removePhyReg(int phyReg)
	{
		phyRegUsed.remove(phyReg);

		assert phyRegsUseOrder.contains(phyReg)
				: "Remove a phyReg, but it is not in phyRegUseOrder list";
		phyRegsUseOrder.remove(Integer.valueOf(phyReg));
	}

	/**
	 * Make sure the specified physical register is available for
	 * use.  If there is currently a value in it, it is either moved out of the way
	 * or spilled to memory.
	 * @param mbb
	 * @param insertPos
	 * @param phyReg
	 */
	private void liberatePhyReg(MachineBasicBlock mbb, int insertPos, int phyReg)
	{
		spillPhyReg(mbb, insertPos, phyReg, false);
	}

	private void allocateBasicBlock(MachineBasicBlock mbb)
	{
		for (int i = 0, size = mbb.size(); i < size; i++)
		{
			MachineInstr mi = mbb.getInstAt(i);

			int opcode = mi.getOpCode();
			MCInstrDescriptor desc = tm.getInstrInfo().get(opcode);

			// loop over all implicit used register, to mark it as recently used,
			// so they don't get reallocated.
			for (int useReg : desc.implicitUses)
				markPhyRegRecentlyUsed(useReg);

			// loop over all operands, assign physical register for it.
			for (int j = 0, e = mi.getNumOperands(); j < e; j++)
			{
				if (mi.getOperand(j).opIsUse() && mi.getOperand(j).isVirtualRegister())
				{
					int virtReg = mi.getOperand(j).getAllocatedRegNum();
					int phyReg = reloadVirReg(mbb, i, virtReg);
					mi.setMachineOperand(j, phyReg);
				}
			}

			// loop over all operands which is defined physical register, and
			// spill it into stack frame.
			for (int j = 0, e = mi.getNumOperands(); j < e; j++)
			{
				MachineOperand op = mi.getOperand(j);
				if ((op.opIsDefOnly() || op.opIsDefAndUse())
						&& op.isPhysicalRegister())
				{
					int reg = op.getAllocatedRegNum();
					spillPhyReg(mbb, i, reg, true);
					phyRegUsed.put(reg, 0);
					phyRegsUseOrder.addLast(reg);
				}
			}

			// loop over all implicit defs, spilling them as well.
			if (desc.implicitDefs != null)
			{
				for (int impDefReg : desc.implicitDefs)
				{
					spillPhyReg(mbb, i, impDefReg, false);
					phyRegUsed.put(impDefReg, 0);
					phyRegsUseOrder.addLast(impDefReg);
				}
			}

			// loop over all operands, assign physical register for it.
			for (int j = mi.getNumOperands() - 1; j >= 0; j--)
			{
				MachineOperand op = mi.getOperand(j);
				if ((op.opIsDefOnly() || op.opIsDefAndUse())
						&& op.isVirtualRegister())
				{
					int destVirReg = mi.getOperand(j).getAllocatedRegNum();
					int destPhyReg = 0;

					if (virToPhyRegMap.containsKey(destVirReg))
					{
						int phyReg = virToPhyRegMap.get(destVirReg);
						virToPhyRegMap.remove(destVirReg);
						removePhyReg(phyReg);
					}

					if (tm.getInstrInfo().isTwoAddrInstr(opcode) && j == 0)
					{
						assert  mi.getOperand(1).isRegister()
								&& mi.getOperand(1).getAllocatedRegNum() != 0
								&& mi.getOperand(1).opIsUse()
								:"Two address instruction invalid!";

						destPhyReg = mi.getOperand(j).getAllocatedRegNum();

						liberatePhyReg(mbb, i, destPhyReg);
						assignVirToPhyReg(destVirReg, destPhyReg);
					}
					else
					{
						destPhyReg = getReg(mbb, i, destVirReg);
					}
					markVirRegModified(destVirReg, true);
					mi.setMachineOperand(j, destPhyReg);
				}
			}
		}

		// find a position of the first non-terminator instruction where
		// some instrs will were inserts after when needed.
		int itr = mbb.size();
		while(itr!=0 && instrInfo.isTerminatorInstr(mbb.getInstAt(itr-1).getOpCode()))
			--itr;

		// Spill all physical register holding virtual register.
		if (!phyRegUsed.isEmpty())
		{
			for (Map.Entry<Integer, Integer> pair : phyRegUsed.entrySet())
			{
				int phyReg = pair.getKey();
				int virReg = pair.getValue();
				if (virReg != 0)
					spillVirReg(mbb, itr, virReg, phyReg);
				else
					removePhyReg(phyReg);
			}
		}

		assert virToPhyRegMap.isEmpty():"Virtual register still in phys reg?";

		// Clear any physical register which appear live at the end of the basic
		// block, but which do not hold any virtual registers.  e.g., the stack
		// pointer.
		phyRegsUseOrder.clear();
	}

	/**
	 * This method must be overridded by concrete subclass for performing
	 * desired machine code transformation or analysis.
	 *
	 * @param mf
	 * @return
	 */
	@Override
	public boolean runOnMachineFunction(MachineFunction mf)
	{
		this.mf = mf;
		tm = mf.getTargetMachine();
		regInfo = tm.getRegInfo();
		instrInfo = tm.getInstrInfo();

		for (MachineBasicBlock mbb : mf.getBasicBlocks())
			allocateBasicBlock(mbb);

		stackSlotForVirReg.clear();
		virRegModified.clear();
		return true;
	}

	@Override
	public String getPassName()
	{
		return "Local register allocator";
	}

	public static LocalRegAllocator createLocalRegAllocator()
	{
		return new LocalRegAllocator();
	}
}

