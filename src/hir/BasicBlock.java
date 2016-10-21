package hir;


import hir.Instruction.*;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;
import lir.LIRBlock;
import lir.LIRList;
import lir.ci.LIRKind;
import opt.Loop;
import asm.Label;

/**
 * Represents a basic block in the quad intermediate representation. Basic
 * blocks are single-entry regions, but not necessarily single-exit regions. Due
 * to the fact that control flow may exit a basic block early due to runtime
 * exception.
 * <p>
 * Each basic block isDeclScope a serial of quads, a list of predecessors, a list
 * of successors. It also has an id id that is unique within its control
 * flow graph.
 * <p>
 * Note that you should never create directly a basic block using the
 * constructor of {@link BasicBlock}, you should create it via a
 * {@link ControlFlowGraph} so that id id is unique.
 * <p>
 * @author Xlous.zeng
 * @version 1.0
 * @see Instruction
 */
public final class BasicBlock extends Value implements Iterable<Instruction>
{
	public static final BasicBlock USELESS_BLOCK =
			new BasicBlock(-1, null, null, "useless", null);

	/**
	 * Unique id id for this basic block.
	 */
	private int idNumber;

	/**
	 * The numbering when performing linear scanning.
	 */
	public int linearScanNumber = -1;

	/**
	 * A list of quads.
	 */
	private final LinkedList<Instruction> instructions;

	/**
	 * A set of predecessors.
	 */
	private final LinkedList<BasicBlock> predecessors;

	/**
	 * A  of successors.
	 */
	private final LinkedList<BasicBlock> successors;

	private ControlFlowGraph cfg;

	/**
	 * The name of this block.
	 */
	public String bbName;

	private int blockFlags;

	public int loopIndex = -1;

	public int loopDepth;

	/**
	 * A block containing Generated machine instruction corresponding to
	 * Module instruction for specified targetAbstractLayer.
	 */
	private LIRBlock LIRBlock;
	
	/**
	 * A field of loop containing this basic block.
	 */
	private Loop outLoop;
	
	/**
	 * Obtains a loop containing this basic block.
	 * @return
	 */
	public Loop getOuterLoop()
	{
		return this.outLoop;
	}
	/**
	 * Update the loop containing this basic block with a new loop.
	 * @param loop
	 */
	public void setOutLoop(Loop loop)
	{
		this.outLoop = loop;
	}

	public boolean isCriticalEdgeSplit()
	{
		return (blockFlags | BlockFlag.CriticalEdgeSplit.mask) != 0;
	}

	public Label label()
	{
		return LIRBlock.label;
	}

	public void setFirstLIRInstructionId(int firstLIRInstructionID)
	{
		LIRBlock.firstLIRInstructionID = firstLIRInstructionID;
	}

	public void setLastLIRInstructionId(int lastLIRInstructionID)
	{
		LIRBlock.lastLIRInstructionID = lastLIRInstructionID;
	}

	public int firstLIRInstructionId()
	{
		return LIRBlock.firstLIRInstructionID;
	}
	public int lastLIRInstructionId()
	{
		return LIRBlock.lastLIRInstructionID;
	}

	public boolean isPredecessor(BasicBlock block)
	{
		return successors.contains(block);
	}

	public enum BlockFlag
	{
		LinearScanLoopHeader,
		LinearScanLoopEnd,
		BackwardBrachTarget,
		CriticalEdgeSplit;

		public final int mask = 1 << ordinal();
	}

	/**
	 * A private constructor for entry node
	 */
	private BasicBlock(
			int id, 
			LinkedList<BasicBlock> pres,
			String bbName, 
			ControlFlowGraph cfg)
	{
		this(id, pres, null, bbName, cfg);
	}

	private BasicBlock(
			int id, 
			LinkedList<BasicBlock> pres,
			LinkedList<BasicBlock> succs,
			String bbName, 
			ControlFlowGraph cfg)
	{
		super(LIRKind.Void);

		this.idNumber = id;
		this.instructions = new LinkedList<>();
		this.predecessors = pres;
		this.successors = succs;
		this.bbName = bbName;
		this.cfg = cfg;
		// add the numbers of block in CFG
		cfg.stats.blockCount++;
	}

	/**
	 * Creates new entry node. Only to be called by ControlFlowGraph.
	 */
	public static BasicBlock createStartNode(int id, String name, ControlFlowGraph cfg)
	{
		return new BasicBlock(id, null, name, cfg);
	}

	/**
	 * Creates a new basic node for exit block without numbers of predecessors.
	 */
	public static BasicBlock createEndNode(int id, String bbName, ControlFlowGraph cfg)
	{
		return new BasicBlock(id, new LinkedList<>(), null, bbName, cfg);
	}

	/**
	 * Create new internal basic block. Only to be called by ControlFlowGraph.
	 */
	public static BasicBlock createBasicBlock(int id, String bbName, ControlFlowGraph cfg)
	{
		return new BasicBlock(id, new LinkedList<>(), new LinkedList<>(), bbName, cfg);
	}

	/**
	 * Returns true if this is the entry basic block.
	 *
	 * @return true if this is the entry basic block.
	 */
	public boolean isEntry()
	{
		return predecessors == null;
	}

	/**
	 * Returns true if this is the exit basic block.
	 *
	 * @return true if this is the exit basic block.
	 */
	public boolean isExit()
	{
		return successors == null;
	}

	/**
	 * Returns iterator over Instructions in this basic block in forward order.
	 *
	 * @return Returns iterator over Instructions in this basic block in forward order.
	 */
	public ListIterator<Instruction> iterator()
	{
		if (instructions == null)
			return Collections.<Instruction>emptyList().listIterator();
		else
			return instructions.listIterator();
	}

	/**
	 * Returns iterator over Quads in this basic block in forward order.
	 *
	 * @return Returns iterator over Quads in this basic block in forward order.
	 */
	public BackwardIterator<Instruction> backwardIterator()
	{
		if (instructions == null)
			return new BackwardIterator<Instruction>(
					Collections.<Instruction>emptyList().listIterator());
		else
			return new BackwardIterator<Instruction>(
					instructions.listIterator());
	}

	/**
	 * Visit all of the quads in this basic block in forward order with the
	 * given quad visitor.
	 *
	 * @param qv InstructionVisitor to visit the quads with.
	 * @see InstructionVisitor
	 */
	public void visitInstructions(InstructionVisitor qv)
	{
		for (Instruction q : instructions)
		{
			q.accept(qv);
		}
	}

	/**
	 * Visit all of the quads in this basic block in backward order with the
	 * given quad visitor.
	 *
	 * @param qv InstructionVisitor to visit the quads with.
	 * @see InstructionVisitor
	 */
	public void backwardVisitQuads(InstructionVisitor qv)
	{
		for (Iterator<Instruction> i = backwardIterator(); i.hasNext(); )
		{
			Instruction q = i.next();
			q.accept(qv);
		}
	}

	/**
	 * Gets the index into instructions list. ReturnInst -1 if instruction no isDeclScope
	 * specified inst. Otherwise, return the index of first occurrence.
	 * @param inst
	 * @return
	 */
	public int indexOf(Instruction inst)
	{
		if (inst == null) return -1;
		return instructions.indexOf(inst);
	}
	/**
	 * Returns the id of quads in this basic block.
	 *
	 * @return the id of quads in this basic block.
	 */
	public int size()
	{
		if (instructions == null)
			return 0; // entry or exit block
		return instructions.size();
	}

	/**
	 * Determines Wether the instructions list of this basic block is empty or not.
	 * @return return true if this instructions list is empty or null.
	 */
	public boolean isEmpty()
	{
		if (instructions == null)
			return true;
		return instructions.isEmpty();
	}

	public Instruction getInst(int i)
	{
		return instructions.get(i);
	}

	public boolean removeInst(Instruction q)
	{
		return instructions.remove(q);
	}

	public void clear()
	{
		instructions.clear();
	}

	/**
	 * Add a quad to this basic block at the given location. Cannot add quads to
	 * the entry or exit basic blocks.
	 *
	 * @param index the index to add the quad
	 * @param inst the instuction to be added into insts list.
	 */
	public void insertAt(Instruction inst, int index)
	{
		assert (inst != null) : "Cannot add null instruction to block";
		assert (index >= 0 && index < instructions.size()):
				"The index into insertion of gieven inst is bound out.";

		instructions.add(index, inst);
	}

	/**
	 * Append a quad to the end of this basic block. Cannot add quads to the
	 * entry or exit basic blocks.
	 *
	 * @param inst quad to add
	 */
	public void appendInst(Instruction inst)
	{
		assert (inst != null) : "Cannot add null instructions to block";
		if (instructions.isEmpty() || !(instructions.getLast() instanceof BranchInst))
		{
			instructions.add(inst);
			return;
		}
		else 
		{
			assert !(inst instanceof BranchInst) :
				"Can not insert more than one branch in basic block";
			insertAt(inst, instructions.size() - 1);
			return;
		}
	}

	/**
	 * Add a predecessor basic block to this basic block. Cannot add
	 * predecessors to the entry basic block.
	 *
	 * @param b basic block to add as a predecessor
	 */
	public boolean addPred(BasicBlock b)
	{
		assert (b != null) : "Cannot add null block into predecessor list";
		if (predecessors.contains(b))
			return false;
		return predecessors.add(b);
	}

	/**
	 * Add a successor basic block to this basic block. Cannot add successors to
	 * the exit basic block.
	 *
	 * @param b basic block to add as a successor
	 */
	public boolean addSucc(BasicBlock b)
	{
		assert (b != null) : "Cannot add null block into successor list";
		if (successors.contains(b))
			return false;
		return successors.add(b);
	}

	public int getNumOfSuccs()
	{
		return successors == null ? 0 : successors.size();
	}

	public int getNumOfPreds()
	{
		return predecessors == null ? 0 : predecessors.size();
	}

	/**
	 * Returns a list of the successors of this basic block.
	 *
	 * @return a list of the successors of this basic block.
	 */
	public List<BasicBlock> getSuccs()
	{
		return successors == null ?
				Collections.emptyList() :
				successors;
	}

	/**
	 * Returns an list of the predecessors of this basic block.
	 *
	 * @return an iterator of the predecessors of this basic block.
	 */
	public List<BasicBlock> getPreds()
	{
		return predecessors == null ?
				Collections.emptyList() :
				predecessors;
	}

	/**
	 * Gets the succesor at the specified position.
	 * @param index
	 * @return
	 */
	public BasicBlock succAt(int index)
	{
		assert index >= 0 && index < successors.size() :
				"The index into successor is beyond range";

		return successors.get(index);
	}
	/**
	 * Gets the predecessor at the specified position.
	 * @param index
	 * @return
	 */
	public BasicBlock predAt(int index)
	{
		assert index >= 0 && index < predecessors.size() :
				"The index into predecessors is beyond range";

		return predecessors.get(index);
	}

	public int getID()
	{
		return this.idNumber;
	}

	public ControlFlowGraph getCFG() {return cfg;}

	public void setCFG(ControlFlowGraph cfg) {this.cfg = cfg;}

	public Instruction firstInst()
	{
		return instructions.get(0);
	}

	public Instruction lastInst()
	{
		if (instructions.isEmpty())
			return null;
		return instructions.get(instructions.size() - 1);
	}
	
	public void insertAfter(Instruction inst, Instruction after)
	{
		assert instructions.contains(inst);
		assert !(after instanceof BranchInst);
		
		int idx = instructions.indexOf(after);
		if (idx < 0) return;
		if (idx == instructions.size())
		{	
			instructions.add(inst);
			return;
		}
		
		instructions.add(idx + 1, inst);
	}
	
	public void insertBefore(Instruction inst, Instruction before)
	{
		assert instructions.contains(inst);
		assert !(before instanceof BranchInst);
			
		int idx = instructions.indexOf(before);
		if (idx < 0) return;		
		instructions.add(idx, inst);
	}

	/**
	 * Inserts a instruction into the position after the first inst of instructions
	 * list.
	 * @param inst
	 */
	public void insertAfterFirst(Instruction inst)
	{
		assert inst != null;

		if (instructions.isEmpty())
			instructions.addFirst(inst);
		else
		{
			Instruction first = instructions.getFirst();
			instructions.add(instructions.indexOf(first)+1, inst);
		}
	}

	public int lastIndexOf(Instruction inst)
	{
		return instructions.lastIndexOf(inst);
	}

	/**
	 * Removes this removed block and unlink it with attached successors list.
	 * @param removed   The basic block to be remvoed.
	 * @return
	 */
	public boolean removeSuccssor(BasicBlock removed)
	{
		if (successors.contains(removed))
		{
			return successors.remove(removed);
		}
		return false;
	}

	/**
	 * Removes this removed block and unlink it with attached predecessors list.
	 * @param removed   The basic block to be remvoed.
	 * @return
	 */
	public boolean removePredeccessor(BasicBlock removed)
	{
		if (predecessors != null && predecessors.contains(removed))
			return predecessors.remove(removed);
		return false;
	}

	/**
	 * Erases itself from control flow graph.
	 */
	public void eraseFromParent()
	{
		if (predecessors != null)
			for (BasicBlock pred : predecessors)
				pred.removeSuccssor(this);

		if (successors != null)
			for (BasicBlock succ : successors)
				succ.removePredeccessor(this);
	}
	/**
	 * Returns the terminator instruction if the block is well formed or
	 * return null if block is not well formed.
	 * @return
	 */
	public BranchInst getTerminator()
	{
		Instruction inst = instructions.getLast();
		if (inst instanceof BranchInst)
		{
			return (BranchInst)inst;
		}
		else 
			return null;
	}
	
	public void setBlockFlags(BlockFlag flag)
	{
		blockFlags |= flag.mask;
	}

	public void clearBlockFlags(BlockFlag flag)
	{
		blockFlags &= ~flag.mask;
	}

	public boolean checkBlockFlags(BlockFlag flag)
	{
		return (blockFlags & flag.mask) != 0;
	}

	public void setLIRBlock(LIRBlock block)
	{
		assert block != null;
		this.LIRBlock = block;
	}

	public LIRBlock getLIRBlock()
	{
		if (LIRBlock == null)
			LIRBlock = new LIRBlock(this);

		return LIRBlock;
	}

	public void setLIR(LIRList lir)
	{
		getLIRBlock().setLIR(lir);
	}
}