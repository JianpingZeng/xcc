package jlang.type;

import jlang.sema.ASTContext;

/**
 * C99 6.7.5.3 - FunctionProto Declarators.
 *
 * @author xlous.zeng
 * @version 0.1
 */
public abstract class FunctionType extends Type
{
    /**
     * ReturnStmt jlang.type.
     */
    private QualType returnType;
    /***
     * Indicates this function is no return.
     */
    private boolean noReturn;

    public FunctionType(int typeClass, QualType returnType, QualType canonical)
    {
        this(typeClass, returnType, canonical, false);
    }

    /**
     * Constructor with one parameter which represents the kind of jlang.type
     * for reason of comparison convenient.
     * @param returnType indicates what jlang.type would be returned.
     */
    public FunctionType(int typeClass, QualType returnType, QualType canonical, boolean noReturn)
    {
        super(typeClass);
        this.returnType = returnType;
        this.noReturn = noReturn;
    }

    public QualType getResultType()
    {
        return returnType;
    }

    public boolean getNoReturnAttr()
    {
        return noReturn;
    }

    public QualType getCallReturnType(ASTContext ctx)
    {
        return ctx.getLValueExprType(getResultType());
    }
}
