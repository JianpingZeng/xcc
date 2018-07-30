package jlang.type;

import tools.Util;
import jlang.ast.Tree.Expr;
import jlang.support.PrintingPolicy;
import jlang.support.SourceLocation;
import jlang.support.SourceRange;
import tools.APInt;
import tools.FoldingSetNode;
import tools.FoldingSetNodeID;

/**
 * ConstantArrayType - C99 6.7.5.2 - Array Declarators.
 *
 * @author Jianping Zeng
 * @version 0.1
 */
public abstract class ArrayType extends Type implements FoldingSetNode
{
    /**
     * Capture whether this is a normal array (e.g. int X[10]),
     * an array with a static size (e.g. int X[static 4]), or an
     * array with a star size (e.g. int X[*]).
     * <b>Note that:</b> 'static' is only allowed on function parameters.
     */
    public enum ArraySizeModifier
    {
        Normal, Static, Star
    }

    /**
     * The type of element which Array holds.
     */
    private QualType elemType;

    private ArraySizeModifier sizeModifier;

    /**
     * Capture qualifiers in declarations like:
     * 'int X[static restrict 4]'. For function parameters only.
     */
    private int indexTypeQuals;

    /**
     * Constructor with one parameter which represents the kind of jlang.type
     * for reason of comparison convenient.
     */
    public ArrayType(
            int tc,
            QualType elemTy,
            QualType can,
            ArraySizeModifier sm,
            int tq)
    {
        super(tc, can);
        elemType = elemTy;
        sizeModifier = sm;
        indexTypeQuals = tq;
    }

    public QualType getElementType()
    {
        return elemType;
    }

    public ArraySizeModifier getSizeModifier()
    {
        return sizeModifier;
    }

    public int getIndexTypeQuals()
    {
        return indexTypeQuals;
    }

    /**
     * This class represents the canonical version of C arrays with a specified
     * constant getTypeSize or not.  For example, the canonical jlang.type for 'int A[4 + 4*100]'
     * is a ConstantArrayType where the element jlang.type is 'int' and the getTypeSize is
     * 404, or or 'int A[]' has an IncompleteArrayType where the element jlang.type is
     * 'int' and the getTypeSize is unspecified.
     */
    public static class ConstantArrayType extends jlang.type.ArrayType implements FoldingSetNode
    {
        private APInt size;

        /**
         * Constructor with one parameter which represents the kind of jlang.type
         * for reason of comparison convenient.
         *
         * @param elemTy
         */
        public ConstantArrayType(
                QualType elemTy,
                QualType can,
                APInt length,
                ArraySizeModifier asm,
                int tq)
        {
            super(ConstantArray, elemTy, can, asm, tq);
            //Util.assertion(getSize.ult(0),  "The getSize for array must greater than zero!");
            size = length;
        }

        public APInt getSize()
        {
            return size;
        }

        @Override
        public String getAsStringInternal(String inner, PrintingPolicy policy)
        {
            inner += '[';
            inner += getSize().getZExtValue();
            inner += ']';
            return getElementType().getAsStringInternal(inner, policy);
        }

        @Override
        public void profile(FoldingSetNodeID id)
        {
            id.addInteger(getElementType().hashCode());
            id.addInteger(getSize().getZExtValue());
            id.addInteger(getSizeModifier().ordinal());
            id.addInteger(getIndexTypeQuals());
        }

        @Override
        public int hashCode()
        {
            FoldingSetNodeID id = new FoldingSetNodeID();
            profile(id);
            return id.computeHash();
        }

        @Override
        public boolean equals(Object obj)
        {
            if (obj == null)
                return false;
            if (this == obj)
                return true;
            if (getClass() != obj.getClass())
                return false;

            ConstantArrayType ft = (ConstantArrayType)obj;
            return ft.hashCode() == hashCode();
        }

        public static void profile(FoldingSetNodeID id,
                QualType eltTy,
                APInt arySize,
                ArraySizeModifier asm,
                int eltTypeQuals)
        {
            id.addInteger(eltTy.hashCode());
            id.addInteger(arySize.getZExtValue());
            id.addInteger(asm.ordinal());
            id.addInteger(eltTypeQuals);
        }
    }

    /**
     * This class represents C arrays with a
     * constant size specified by means of an integer constant expression.
     * For example 'int A[sizeof(int)]' has ConstantArrayWithExprType where
     * the element type is 'int' and the size expression is 'sizeof(int)'.
     */
    public static class ConstantArrayWithExprType extends ConstantArrayType
    {
        private Expr sizeExpr;
        private SourceRange brackets;

        public ConstantArrayWithExprType(
                QualType elemTy,
                QualType can,
                APInt length,
                Expr numElts,
                ArraySizeModifier asm,
                int tq,
                SourceRange brackets)
        {
            super(elemTy, can, length, asm, tq);
            sizeExpr = numElts;
            this.brackets = brackets;
        }

        public Expr getSizeExpr()
        {
            return sizeExpr;
        }

        public SourceRange getBracketsRange()
        {
            return brackets;
        }

        public SourceLocation getLBracketLoc()
        {
            return brackets.getBegin();
        }

        public SourceLocation getRBracketLoc()
        {
            return brackets.getEnd();
        }

        @Override
        public String getAsStringInternal(String inner, PrintingPolicy policy)
        {
            return super.getAsStringInternal(inner, policy);
        }

        @Override
        public void profile(FoldingSetNodeID id)
        {
            id.addInteger(getElementType().hashCode());
            id.addInteger(getSize().getZExtValue());
            id.addInteger(sizeExpr.hashCode());
            id.addInteger(getSizeModifier().hashCode());
            id.addInteger(getIndexTypeQuals());
            //Util.assertion(false, "Cannot unique ConstantArrayWithExprTypes");
        }
    }

    /**
     * This class represents C arrays with a
     * constant size that was not specified by an integer constant expression,
     * but inferred by static semantics.
     * For example 'int A[] = { 0, 1, 2 }' has ConstantArrayWithoutExprType.
     * These types are non-canonical: the corresponding canonical type,
     * having the size specified in an APInt object, is a ConstantArrayType.
     */
    public static class ConstantArrayWithoutExprType extends ConstantArrayType
    {
        public ConstantArrayWithoutExprType(
                QualType elemTy,
                QualType can,
                APInt length,
                ArraySizeModifier asm,
                int tq)
        {
            super(elemTy, can, length, asm, tq);
        }

        @Override
        public String getAsStringInternal(String inner, PrintingPolicy policy)
        {
            if (policy.constantArraySizeAsWritten)
            {
                inner += "[]";
                return getElementType().getAsStringInternal(inner, policy);
            }
            return super.getAsStringInternal(inner, policy);
        }

        @Override
        public void profile(FoldingSetNodeID id)
        {
            id.addInteger(getElementType().hashCode());
            id.addInteger(getSize().getZExtValue());
            id.addInteger(getSizeModifier().hashCode());
            id.addInteger(getIndexTypeQuals());
            //Util.assertion(false, "Cannot unique ConstantArrayWithoutExprTypes");
        }
    }

    /**
     * This class represents C arrays with a specified getTypeSize
     * which is not an integer-constant-expression.  For example, 'int s[x+foo()]'.
     * Since the getTypeSize expression is an arbitrary expression, we store it as such.
     *
     * Note: VariableArrayType's aren't uniqued (since the expressions aren't) and
     * should not be: two lexically equivalent variable array types could mean
     * different things, for example, these variables do not have the same jlang.type
     * dynamically:
     *
     * <pre>
     * void foo(int x) {
     *   int Y[x];
     *   ++x;
     *   int Z[x];
     * }
     </pre>
     */
    public static class VariableArrayType extends jlang.type.ArrayType
    {
        /**
         * An assignment expression, which are only permitted within function block.
         */
        private Expr sizeExpr;
        /**
         * The left and right array brackets.
         */
        private SourceRange brackets;
        /**
         * Constructor with one parameter which represents the kind of jlang.type
         * for reason of comparison convenient.
         *
         * @param elemTy
         */
        public VariableArrayType(
                QualType elemTy,
                QualType can,
                Expr sizeExpr,
                ArraySizeModifier asm,
                int tq,
                SourceRange brackets)
        {
            super(VariableArray, elemTy, can, asm, tq);
            this.sizeExpr = sizeExpr;
            this.brackets = brackets;
        }

        public Expr getSizeExpr()
        {
            return sizeExpr;
        }

        public int getIndexTypeCVRQualifiers()
        {
            return sizeExpr.getType().getCVRQualifiers();
        }

        public SourceRange getBrackets()
        {
            return brackets;
        }

        static String appendTypeQualList(String str, int typeQuals)
        {
            boolean nonePrinted = true;
            if ((typeQuals & QualType.CONST_QUALIFIER) != 0)
            {
                str += "const";
                nonePrinted = false;
            }
            if ((typeQuals & QualType.VOLATILE_QUALIFIER) != 0)
            {
                str += nonePrinted + "volatile";
                nonePrinted = false;
            }
            if ((typeQuals & QualType.RESTRICT_QUALIFIER) != 0)
            {
                str +=  nonePrinted + "restrict";
                nonePrinted = false;
            }
            return str;
        }

        @Override
        public String getAsStringInternal(String inner, PrintingPolicy policy)
        {
            inner += '[';

            if (getIndexTypeQuals() != 0)
            {
                inner = appendTypeQualList(inner, getIndexTypeQuals());
            }

            if (getSizeModifier() == ArraySizeModifier.Static)
                inner += "static";
            else if (getSizeModifier() == ArraySizeModifier.Star)
                inner += "*";

            if (sizeExpr!= null)
            {
                inner += sizeExpr.toString();
            }
            inner += ']';
            return getElementType().getAsStringInternal(inner, policy);
        }

        @Override
        public void profile(FoldingSetNodeID id)
        {
            id.addInteger(getElementType().hashCode());
            id.addInteger(sizeExpr.hashCode());
            id.addInteger(getSizeModifier().hashCode());
            id.addInteger(getIndexTypeQuals());
            //Util.assertion(false, "Cannot unique VaraibleArrayTypes.");
        }
    }

    /**
     * This class represents a C array with an uncomplete getNumOfSubLoop.
     * For example 'int A[]' has an {@code IncompleteArrayType} where the element
     * jlang.type is 'int' and the getNumOfSubLoop of unspecifed.
     */
    public static class IncompleteArrayType extends jlang.type.ArrayType
    {
        /**
         * Constructor with one parameter which represents the kind of jlang.type
         * for reason of comparison convenient.
         *
         * @param elementType
         */
        public IncompleteArrayType(QualType elementType, QualType can, ArraySizeModifier asm, int tq)
        {
            super(IncompleteArray, elementType, can, asm, tq);
        }

        @Override
        public String getAsStringInternal(String inner, PrintingPolicy policy)
        {
            inner += "[]";
            return getElementType().getAsStringInternal(inner, policy);
        }

        @Override
        public void profile(FoldingSetNodeID id)
        {
            id.addInteger(getElementType().hashCode());
            id.addInteger(getSizeModifier().ordinal());
            id.addInteger(getIndexTypeQuals());
        }

        @Override
        public int hashCode()
        {
            FoldingSetNodeID id = new FoldingSetNodeID();
            profile(id);
            return id.computeHash();
        }

        @Override
        public boolean equals(Object obj)
        {
            if (obj == null)
                return false;
            if (this == obj)
                return true;
            if (getClass() != obj.getClass())
                return false;
            IncompleteArrayType ca = (IncompleteArrayType)obj;
            return ca.hashCode() == hashCode();
        }
    }
}
