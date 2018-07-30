package backend.codegen;

import tools.Util;
import tools.FormattedOutputStream;
import backend.target.TargetRegisterInfo;
import backend.value.BasicBlock;
import gnu.trove.list.array.TIntArrayList;

import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Objects;

/**
 * @author Jianping Zeng
 * @version 0.1
 */
public class MachineBasicBlock
{
	private LinkedList<MachineInstr> insts;
	private final BasicBlock bb;
	private TIntArrayList liveIns;

	/**
	 * Indicates the number of this machine block in the machine function.
	 */
	private int number;

	private ArrayList<MachineBasicBlock> predecessors;
	private ArrayList<MachineBasicBlock> successors;

	private MachineFunction parent;
    private int alignment;

    public MachineBasicBlock(final BasicBlock bb)
	{
		insts = new LinkedList<>();
		this.bb = bb;
		number = -1;
		predecessors = new ArrayList<>();
		successors = new ArrayList<>();
		liveIns = new TIntArrayList();
	}

	public BasicBlock getBasicBlock() { return bb; }

	public int size() {return insts.size();}

	public boolean isEmpty() {return insts.isEmpty();}

	public LinkedList<MachineInstr> getInsts() {return insts;}

	public void addLast(MachineInstr instr)
	{
		insts.addLast(instr);
		addNodeToList(instr);
	}

	public MachineInstr getInstAt(int index)
	{
		return insts.get(index);
	}

	private void addNodeToList(MachineInstr instr)
	{
		Util.assertion(instr.getParent() == null, "machine instruction already have parent!");
		instr.setParent(this);

		// Add the instruction's register operands to their corresponding
		// use/def lists.
		instr.addRegOperandsToUseLists(parent.getMachineRegisterInfo());
	}

	public void insert(int itr, MachineInstr instr)
	{
	    Util.assertion( itr >= 0 && itr <= size());
	    if (itr == size())
	        insts.add(instr);
	    else
	        insts.add(itr, instr);
		addNodeToList(instr);
	}

	public void insert(MachineInstr itr, MachineInstr instr)
    {
        int idx = insts.indexOf(itr);
        Util.assertion( idx >= 0 && idx < size());
        insert(idx, instr);
    }

	public void erase(int idx)
	{
		if (idx >= 0 && idx < size())
			insts.remove(idx);
	}

	public void erase(int start, int end)
	{
		for (int i = start; i < end; i++)
			insts.remove(i);
	}

	public void replace(int idx, MachineInstr newInstr)
	{
		Util.assertion(idx>= 0 && idx < size(), "idx out of range!");
		insts.remove(idx);
		insts.add(idx, newInstr);
	}

	public MachineInstr front() {return insts.getFirst();}

	public MachineInstr back() {return insts.getLast();}

	public ArrayList<MachineBasicBlock> getPredecessors()
	{
		return predecessors;
	}

	public ArrayList<MachineBasicBlock> getSuccessors()
	{
		return successors;
	}

	public void addSuccessor(MachineBasicBlock succ)
	{
		Util.assertion(succ != null, "Can not add a null succ into succ list");
		successors.add(succ);
		succ.addPredecessor(this);
	}

	public void removeSuccessor(MachineBasicBlock succ)
	{
		Util.assertion(successors.contains(succ),  "The succ to be removed not contained in succ list");

		successors.remove(succ);
		succ.removePredecessor(this);
	}

	public void removeSuccessor(int idx)
	{
		Util.assertion( idx>= 0 && idx < getNumSuccessors());
		suxAt(idx).removePredecessor(this);
		successors.remove(idx);
	}

	public void addPredecessor(MachineBasicBlock pred)
	{
		Util.assertion(pred!= null, "Can not add a null pred");
		predecessors.add(pred);
	}

	public void removePredecessor(MachineBasicBlock pred)
	{
		Util.assertion(predecessors.contains(pred),  "The pred to be removed not contained in pred list");

		predecessors.remove(pred);
	}

	public void removePredecessor(int idx)
	{
		Util.assertion( idx>= 0 && idx < getNumPredecessors());
		predecessors.remove(idx);
	}

	public boolean isSuccessor(MachineBasicBlock mbb)
	{
		return successors.contains(mbb);
	}

	public void replaceSuccessor(MachineBasicBlock oldOne, MachineBasicBlock newOne)
	{
		if (!successors.contains(oldOne))
			return;
		int idx = successors.indexOf(oldOne);
		successors.set(idx, newOne);
	}

	public boolean predIsEmpty() {return predecessors.isEmpty();}

	public boolean succIsEmpty() {return successors.isEmpty();}

	public int getNumPredecessors() {return predecessors.size(); }

	public int getNumSuccessors() {return successors.size(); }

	public MachineBasicBlock predAt(int idx)
	{
		Util.assertion( idx >= 0 && idx < getNumPredecessors());
		return predecessors.get(idx);
	}

	public MachineBasicBlock suxAt(int idx)
	{
		Util.assertion( idx>= 0 && idx < getNumSuccessors());
		return successors.get(idx);
	}

	/**
	 * Obtains the number of this machine block.
	 * @return
	 */
	public int getNumber()
	{
		return number;
	}

	public void setNumber(int number)
	{
		this.number = number;
	}

	public void eraseFromParent()
	{
		Util.assertion( getParent() != null);
		getParent().erase(this);
	}

	public MachineFunction getParent()
	{
		return parent;
	}

	public void setParent(MachineFunction parent)
	{
		this.parent = parent;
	}

	public Iterator<MachineBasicBlock> predIterator()
	{
		return predecessors.iterator();
	}

	public Iterator<MachineBasicBlock> succIterator()
	{
		return successors.iterator();
	}

	public int getFirstTerminator()
	{
	    int i = 0;
	    int size = size();
	    while (i < size && !getInstAt(i).getDesc().isTerminator()) ++i;
		return i;
	}

	/**
	 * Remove the specified MachineInstr and remove the index to the position where
	 * it located.
	 * @param miToDelete
	 * @return
	 */
	public int remove(MachineInstr miToDelete)
	{
		int index = insts.indexOf(miToDelete);
		insts.remove(miToDelete);
		miToDelete.setParent(null);
		return index;
	}

	public void remove(int indexToDel)
	{
		Util.assertion( indexToDel>=0&& indexToDel < size());
		insts.remove(indexToDel);
	}

	public boolean isLayoutSuccessor(MachineBasicBlock mbb)
	{
		if (parent != null && mbb.getParent() != null && parent == mbb.getParent())
		{
			ArrayList<MachineBasicBlock> mbbs = parent.getBasicBlocks();
			for (int i = 0, e = mbbs.size(); i < e; i++)
			{
				if (mbbs.get(i) == this)
				{
					if (i == e -1) return false;
					return mbbs.get(i+1) == mbb;
				}
			}
		}
		return false;
	}

	public void removeInstrAt(int indexToDel)
	{
		Util.assertion( indexToDel >= 0 && indexToDel < size());
		insts.remove(indexToDel);
	}

	public void addLiveIn(int reg)
	{
		liveIns.add(reg);
	}

	public TIntArrayList getLiveIns()
	{
		return liveIns;
	}

	public MachineInstr getLastInst()
    {
    	Util.assertion( !insts.isEmpty());
        return insts.getLast();
    }

    public MachineInstr getFirstInst()
    {
        return insts.getFirst();
    }

	/**
	 * Return true if this basic block has
	 * exactly one predecessor and the control transfer mechanism between
	 * the predecessor and this block is a fall-through.
	 * @return
	 */
	public boolean isOnlyReachableByFallThrough()
	{
	    if (predIsEmpty())
	        return false;

	    // If there is not exactly one predecessor, it can not be a fall through.
	    if (getNumPredecessors() != 1)
	        return false;

	    // The predecessor has to be immediately before this block.
	    MachineBasicBlock pred = predAt(0);
	    if (!pred.isLayoutSuccessor(this))
	        return false;

	    // If the block is completely empty, then it definitely does fall through.
        if (pred.isEmpty())
            return true;

        // Otherwise, check the last instruction.
        MachineInstr lastInst = pred.getLastInst();
        return !lastInst.getDesc().isBarrier();
	}

    public int getAlignment()
    {
        return alignment;
    }

    public void setAlignment(int align)
    {
        alignment = align;
    }

	public void dump()
	{
		print(System.err);
	}

	public void print(PrintStream os)
	{
		print(os, new PrefixPrinter());
	}

	public void print(PrintStream os, PrefixPrinter prefix)
	{
	    FormattedOutputStream out = new FormattedOutputStream(os);
        print(out, prefix);
	}

	public void print(FormattedOutputStream os, PrefixPrinter prefix)
	{
		MachineFunction mf = getParent();
		if (mf == null)
		{
			os.printf("Can't print out MachineBasicBlock because parent MachineFunction is null\n");;
			return;
		}

		BasicBlock bb = getBasicBlock();
		os.println();
		if (bb != null)
			os.printf("%s: ", bb.getName());
		os.printf("0x%x, LLVM BB @0x%x, ID#%d",hashCode(),
				bb == null?0:bb.hashCode(), getNumber());
		if (alignment != 0)
			os.printf(", Alignment %d",alignment);
		os.printf(":%n");

		if (!liveIns.isEmpty())
		{
			os.printf("Live Ins:");
			for (int i = 0, e = liveIns.size(); i < e; i++)
				outputReg(os, liveIns.get(i));

			os.println();
		}

		// Print the preds of this block according to the CFGs.
		if (predecessors != null && !predecessors.isEmpty())
		{
			os.printf("\tPredecessors according to CFG:");
			for (MachineBasicBlock pred : predecessors)
				os.printf(" 0x%x (#%d)", pred.hashCode(), pred.getNumber());
			os.println();
		}

		// Print each machine instruction.
		for (MachineInstr mi : insts)
		{
			prefix.print(os, mi).printf("\t");
			mi.print(os, getParent().getTarget());
		}

		// Print the sucessors of this block according to CFG
		if (!succIsEmpty())
		{
			os.printf("\tSuccessors according to CFG:");
			Iterator<MachineBasicBlock> itr = succIterator();
			while (itr.hasNext())
			{
				MachineBasicBlock succ = itr.next();
				os.printf(" 0x%x (#%d)", succ.hashCode(), succ.getNumber());
			}
			os.println();
		}
	}
    private static void outputReg(FormattedOutputStream os, int reg)
    {
        outputReg(os, reg, null);
    }

    private static void outputReg(FormattedOutputStream os, int reg, TargetRegisterInfo tri)
    {
        if (reg == 0 || TargetRegisterInfo.isPhysicalRegister(reg))
        {
            if (tri!= null)
                os.printf(" %%s", tri.getName(reg));
            else
                os.printf(" %%reg(%d)", reg);
        }
        else
        {
            os.printf(" %%reg%d", reg);
        }
    }

	public String getName()
	{
		BasicBlock bb = getBasicBlock();
		if (bb != null)
			return bb.getName();

		return "(null)";
	}

	public void transferSuccessor(MachineBasicBlock fromMBB)
	{
		if (Objects.equals(this, fromMBB))
			return;

		fromMBB.getSuccessors().forEach(this::addSuccessor);
		if (!fromMBB.getSuccessors().isEmpty())
			fromMBB.getSuccessors().clear();
	}
}
