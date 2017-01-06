package backend.target.x86;

import backend.hir.Module;
import backend.pass.PassManager;
import backend.target.TargetFrameInfo;
import backend.target.TargetInstrInfo;
import backend.target.TargetMachine;
import backend.target.TargetRegisterInfo;

import java.io.FileOutputStream;

import static backend.codegen.LocalRegAllocator.createLocalRegAllocator;
import static backend.codegen.RegAllocSimple.createSimpleRegAllocator;
import static backend.transform.CFGSimplifyPass.createCFGSimplifyPass;
import static backend.transform.LowerSwitch.createLowerSwitchPass;
import static backend.target.TargetFrameInfo.StackDirection.StackGrowDown;
import static backend.target.x86.FloatPointStackitifierPass.createX86FloatingPointStackitifierPass;
import static backend.target.x86.PEI.createX86PrologEpilogEmitter;
import static backend.target.x86.X86PeepholeOptimizer.createX86PeepholeOptimizer;
import static backend.target.x86.X86SimpleInstSel.createX86SimpleInstructionSelector;

/**
 * @author Xlous.zeng
 * @version 0.1
 */
public class X86TargetMachine extends TargetMachine
{
	/**
	 * All x86 instruction information can be accessed by this.
	 */
	private X86InstrInfo instrInfo;
	/**
	 * A stack frame info class used for organizing data layout of frame when
	 * function calling.
	 */
	private TargetFrameInfo frameInfo;

	public X86TargetMachine(Module module)
	{
		super("X86", true, 4, 4, 4, 4, 4, 4, 2, 1);
		frameInfo = new TargetFrameInfo(StackGrowDown, 8, 4);
		instrInfo = new X86InstrInfo();
	}

	@Override
	public TargetInstrInfo getInstrInfo(){return instrInfo;}

	@Override
	public TargetRegisterInfo getRegInfo() {return instrInfo.getRegisterInfo();}

	@Override
	public TargetFrameInfo getFrameInfo() {return frameInfo;}

	/**
	 * Add passes to the specified pass manager to get assembly language code
	 * emitted.  Typically this will involve several steps of code generation.
	 * This method should return true if assembly emission is not supported.
	 * <p>
	 * Note that: this method would be overriden by concrete subclass for
	 * different backend.target, like IA32, Sparc.
	 *
	 * @param pm
	 * @param fast
	 * @param asmOutStream
	 * @param genFileType
	 * @param optLevel
	 * @return
	 */
	@Override
	public boolean addPassesToEmitFile(PassManager pm,
			boolean fast, FileOutputStream asmOutStream,
			CodeGenFileType genFileType, CodeGenOpt optLevel)
	{
		// lowers switch instr into chained branch instr.
		pm.add(createLowerSwitchPass());

		// FIXME: The code generator does not properly handle functions with
		// unreachable basic blocks.
		pm.add(createCFGSimplifyPass());

		pm.add(createX86SimpleInstructionSelector(this));

		// TODO: A SSA destruction pass is needed to transform SSA-based MC out of SSA.

		// Perform register allocation to convert to a concrete x86 representation
		if (fast)
			pm.add(createSimpleRegAllocator());
		else
			pm.add(createLocalRegAllocator());
		// converts virtual register in X86 FP inst into floating point stack slot.
		pm.add(createX86FloatingPointStackitifierPass());

		// Insert prolog/epilog code.  Eliminate abstract frame index references.
		pm.add(createX86PrologEpilogEmitter());

		pm.add(createX86PeepholeOptimizer());

		pm.add(X86ATTAsmPrinter.createX86AsmCodeEmitter(asmOutStream, this));
		return false;
	}
}
