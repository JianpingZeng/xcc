package backend.value;

import tools.Util;
import backend.type.Type;

import java.util.ArrayList;

/**
 * @author Xlous.zeng
 * @version 0.1
 */
public abstract class User extends Value
{
    /**
     * Mainly for register allocation.
     */
    public int id;

    /**
     * This array with element of jlang.type Value represents all operands.
     */
    protected ArrayList<Use> operandList;

	public User(Type ty, int valueKind)
	{
		super(ty, valueKind);
        id = -1;
        operandList = new ArrayList<>();
	}

	protected void reserve(int numOperands)
    {
        Util.assertion( numOperands>0);
        operandList = new ArrayList<>();
        for (; numOperands > 0; --numOperands)
            operandList.add(null);
    }

    /**
     * Obtains a reference to the operand at index position.
     * @param index the position indexed to TargetData element.
     * @return the index-th operand.
     */
	public Value operand(int index)
    {
        Util.assertion( (index >= 0 && index < getNumOfOperands()));
        return operandList.get(index).getValue();
    }

    public void setOperand(int index, Value val, User user)
    {
        setOperand(index, new Use(val, user));
    }

    /**
     * set element at specified position with {@code use}
     * @param index
     * @param use
     */
    public void setOperand(int index, Use use)
    {
        Util.assertion( use != null);
        if (operandList == null)
            operandList = new ArrayList<>();
        if (index >= getNumOfOperands())
        {
            for (int i = getNumOfOperands()-1; i < index; i++)
                operandList.add(null);
        }
        operandList.set(index, use);
    }

    public void setOperand(int index, Value opVal)
    {
        Util.assertion( index >= 0 && index < getNumOfOperands());
        operandList.get(index).setValue(opVal);
    }

    public Use getOperand(int index)
    {
        Util.assertion( (index >= 0 && index < getNumOfOperands()));
        return operandList.get(index);
    }

    /**
     * obtains the number of reservedOperands of this instruction.
     * @return
     */
    public int getNumOfOperands()
    {
        return operandList.size();
    }

    /**
     * This method is in charge of dropping all objects that this user refers to.
     */
    public void dropAllReferences()
    {
        usesList.clear();
    }

    /**
     * Replace all references to the {@code from} with reference to the {@code to}.
     * @param from
     * @param to
     */
    public void replaceUsesOfWith(Value from, Value to)
    {
        if (from == to)return;

        Util.assertion(!(this instanceof Constant) || (this instanceof GlobalValue), "Cannot call User.replaceUsesOfWith() on a constant");


        for (int i = 0, e = getNumOfOperands(); i < e; i++)
        {
            if (operand(i) == from)
            {
                setOperand(i, to, this);
            }
        }
    }
}
