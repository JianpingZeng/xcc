package backend.codegen;

import backend.codegen.MachineOperand.MachineOperandType;
import backend.codegen.MachineOperand.UseType;
import backend.target.TargetInstrInfo;
import backend.value.GlobalValue;
import backend.value.Value;

import java.util.ArrayList;

import static backend.codegen.MachineOperand.MachineOperandType.*;

/**
 * Representation of each machine instruction.
 *
 * <p>MachineOpCode must be an enum, defined separately for each target.
 * E.g., It is defined in .
 * </p>
 * <p>There are 2 kinds of operands:
 * <ol>
 * <li>Explicit operands of the machine instruction in vector operands[].
 *  And the more important is that the format of MI is compatible with AT&T
 *  assembly, where dest operand is in the leftmost as follows:
 *  op dest, op0, op1;
 *  op dest op0.
 * </li>
 * <li>"Implicit operands" are values implicitly used or defined by the
 * machine instruction, such as arguments to a CALL, return value of
 * a CALL (if any), and return value of a RETURN.</li>
 * </ol>
 * </p>
 * @author Xlous.zeng
 * @version 0.1
 */
public class MachineInstr
{
	private int              opCode;              // the opcode
	private int         opCodeFlags;         // flags modifying instrn behavior

	/**
	 * |<-----Explicit operands--------->|-----Implicit operands------->|
	 */
	private ArrayList<MachineOperand> operands; // the operands
	private int numImplicitRefs;             // number of implicit operands

	private MachineBasicBlock parent;

	/**
	 * Return true if it's illegal to add a new operand.
	 * @return
	 */
	private boolean operandsComplete()
	{
		int numOperands = TargetInstrInfo.TargetInstrDescriptors[opCode].numOperands;
		if (numOperands>=0 && numOperands <= getNumOperands())
			return true;
		return false;
	}

	public MachineInstr(int opCode, int numOperands)
	{
		this.opCode = opCode;
		opCodeFlags = 0;
		operands = new ArrayList<>(numOperands);
		numImplicitRefs = 0;
	}

	public MachineInstr(MachineBasicBlock mbb, int opCode, int numOperands)
	{
		this(opCode, numOperands);
		assert mbb != null:"Can not use inserting operation with null basic block";
		mbb.addLast(this);
	}

	public int getOpCode(){return opCode;}
	public int getOpCodeFlags(){return opCodeFlags;}
	public int getNumOperands() {return operands.size() - numImplicitRefs;}
	public int getNumImplicitRefs(){return numImplicitRefs;}

	public MachineOperand getOperand(int index)
	{
		assert index>=0 && index < getNumOperands();
		return operands.get(index);
	}

	public void removeOperand(int index)
	{
		assert index>=0 && index < getNumOperands();
		operands.remove(index);
	}

	public MachineOperand getImplicitOp(int index)
	{
		assert index>=0&&index< numImplicitRefs:
			"implicit ref out of range!";
		return operands.get(index + getNumOperands());
	}

	/**
	 * Access to explicit or implicit operands of the instruction.
	 * This returns the i'th entry in the operand list.
	 * It corresponds to the i'th explicit operand or (i-N)'th implicit
	 * operand, where N indicates the number of all explicit operands.
	 * @param i
	 * @return
	 */
	public MachineOperand getExplOrImplOperand(int i)
	{
		assert i>=0&&i<operands.size();
		return i<getNumOperands() ? getOperand(i)
				: getImplicitOp(i-getNumOperands());
	}

	public Value getImplicitRef(int i)
	{
		return getImplicitOp(i).getVRegValue();
	}

	public void addImplicitRef(Value val, boolean isDef, boolean isDefAndUse)
	{
		numImplicitRefs++;
		addRegOperand(val, isDef, isDefAndUse);
	}

	/**
	 * Add a MO_VirtualRegister operand to the end of the operands list.
	 * @param val
	 * @param isDef
	 * @param isDefAndUse
	 */
	public void addRegOperand(Value val, boolean isDef, boolean isDefAndUse)
	{
		assert !operandsComplete():"Attempting to add an operand to a "
				+ "machine instr is already done";
		MachineOperand mo = new MachineOperand(val, MO_VirtualRegister,
				!isDef ? UseType.Use : (isDefAndUse ?
						UseType.UseAndDef : UseType.Def));
		mo.setParentMI(this);
		operands.add(mo);
	}

	public void addRegOperand(Value val, UseType utype, boolean isPCRelative)
	{
		assert !operandsComplete():"Attempting to add an operand to a "
				+ "machine instr is already done";
		MachineOperand mo = new MachineOperand(val, MO_VirtualRegister,
				utype, isPCRelative);
		mo.setParentMI(this);
		operands.add(mo);
	}

	public void addCCRegOperand(Value val, UseType utype)
	{
		assert !operandsComplete():"Attempting to add an operand to a "
				+ "machine instr is already done";
		MachineOperand mo = new MachineOperand(val, MO_CCRegister,
				utype, false);
		mo.setParentMI(this);
		operands.add(mo);
	}

	/**
	 * Add a symbolic virtual register reference.
	 * @param reg
	 * @param isDef
	 */
	public void addRegOperand(int reg, boolean isDef)
	{
		assert !operandsComplete():"Attempting to add an operand to a "
				+ "machine instr is already done";
		MachineOperand mo = new MachineOperand(reg, MO_VirtualRegister,
				isDef?UseType.Def:UseType.Use);
		mo.setParentMI(this);
		operands.add(mo);
	}

	/**
	 * Add a symbolic virtual register reference.
	 * @param reg
	 * @param utype
	 */
	public void addRegOperand(int reg, UseType utype)
	{
		assert !operandsComplete():"Attempting to add an operand to a "
				+ "machine instr is already done";
		MachineOperand mo = new MachineOperand(reg, MO_VirtualRegister, utype);
		mo.setParentMI(this);
		operands.add(mo);
	}

	public void addPCDispOperand(Value val)
	{
		assert !operandsComplete():"Attempting to add an operand to a "
				+ "machine instr is already done";
		MachineOperand mo = new MachineOperand(val, MO_PCRelativeDisp, UseType.Use);
		mo.setParentMI(this);
		operands.add(mo);
	}

	/**
	 * Add a physical register operand into operands list.
	 * @param reg
	 * @param isDef
	 */
	public void addMachineRegOperand(int reg, boolean isDef)
	{
		assert !operandsComplete():"Attempting to add an operand to a "
				+ "machine instr is already done";
		MachineOperand mo = new MachineOperand(reg, MO_MachineRegister,
				isDef?UseType.Def:UseType.Use);
		mo.setParentMI(this);
		operands.add(mo);
	}

	/**
	 * Add a physical register operand into operands list.
	 * @param reg
	 * @param utype
	 */
	public void addMachineRegOperand(int reg, UseType utype)
	{
		assert !operandsComplete():"Attempting to add an operand to a "
				+ "machine instr is already done";
		MachineOperand mo = new MachineOperand(reg, MO_MachineRegister,utype);
		mo.setParentMI(this);
		operands.add(mo);
	}

	/**
	 * Add a zero extending immmediate operand.
	 * @param intValue
	 */
	public void addZeroExtImmOperand(long intValue)
	{
		assert !operandsComplete():"Attempting to add an operand to a "
				+ "machine instr is already done";
		MachineOperand mo = new MachineOperand(intValue, MO_UnextendedImmed);
		mo.setParentMI(this);
		operands.add(mo);
	}

	/**
	 * Add a signed extending immmediate operand.
	 * @param intValue
	 */
	public void addSignExtImmOperand(long intValue)
	{
		assert !operandsComplete():"Attempting to add an operand to a "
				+ "machine instr is already done";
		MachineOperand mo = new MachineOperand(intValue, MO_SignExtendedImmed);
		mo.setParentMI(this);
		operands.add(mo);
	}

	/**
	 * Add a machine basic block operand into instruction.
	 * @param mbb
	 */
	public void addMachineBasicBlockOperand(MachineBasicBlock mbb)
	{
		assert !operandsComplete():"Attempting to add an operand to a "
				+ "machine instr is already done";
		MachineOperand mo = new MachineOperand(mbb);
		mo.setParentMI(this);
		operands.add(mo);
	}

	/**
	 * Add an abstract stack frame index operand into instruction.
	 * @param idx
	 */
	public void addFrameIndexOperand(int idx)
	{
		assert !operandsComplete():"Attempting to add an operand to a "
				+ "machine instr is already done";
		MachineOperand mo = new MachineOperand(idx, MO_FrameIndex);
		mo.setParentMI(this);
		operands.add(mo);
	}

	/**
	 * Add a constant pool index operand into instruction.
	 * @param i
	 */
	public void addConstantPoolIndexOperand(int i)
	{
		assert !operandsComplete():"Attempting to add an operand to a "
				+ "machine instr is already done";
		MachineOperand mo = new MachineOperand(i, MO_ConstantPoolIndex);
		mo.setParentMI(this);
		operands.add(mo);
	}

	/**
	 * Add a global address operand into this instruction, like the instr "call _foo".
	 * @param v
	 * @param isPCRelative
	 */
	public void addGlobalAddressOperand(GlobalValue v, boolean isPCRelative)
	{
		assert !operandsComplete():"Attempting to add an operand to a "
				+ "machine instr is already done";
		MachineOperand mo = new MachineOperand(v, MO_GlobalAddress, UseType.Use, isPCRelative);
		mo.setParentMI(this);
		operands.add(mo);
	}

	public void addExternalSymbolOperand(String symbolName, boolean isPCRelative)
	{
		assert !operandsComplete():"Attempting to add an operand to a "
				+ "machine instr is already done";
		MachineOperand mo = new MachineOperand(symbolName, isPCRelative);
		mo.setParentMI(this);
		operands.add(mo);
	}

	public void setMachineOperandReg(int i, int regNum)
	{
		assert i < getNumOperands();
		MachineOperand op = operands.get(i);
		op.setOpType(MO_MachineRegister);
		op.setValue(null);
		op.setReg(regNum);
	}

	public void setMachineOperandConst(int i, MachineOperandType type, long val)
	{
		assert  i < getNumOperands();
		MachineOperand op = operands.get(i);
		op.setOpType(type);
		op.setImmedVal(val);
		op.setValue(null);
		op.setReg(-1);
	}

	public void setMachineOperandVal(int i, MachineOperandType opTy, Value v)
	{
		assert i < getNumOperands();
		MachineOperand op = getOperand(i);
		op.setValue(v);
		op.setReg(-1);
		op.setOpType(opTy);
	}

	public MachineBasicBlock getParent()
	{
		return parent;
	}

	public void setParent(MachineBasicBlock mbb) {parent = mbb;}
}