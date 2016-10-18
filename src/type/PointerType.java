package type;

/**
 * @author xlous.zeng
 * @version 0.1
 */
public final class PointerType extends Type
{
    /**
     * The number of bits required to represent the type in memory.
     */
    private long size;
    /**
     * The basic type of this pointer type.
     */
    private QualType pointeeType;

    public PointerType(Type pointee)
    {
        this(32, new QualType(pointee));
    }

    public PointerType(QualType pointee)
    {
        this(32, pointee);
    }

    public PointerType(long size, QualType baseType)
    {
        super(POINTER);
        this.size = size;
        this.pointeeType = baseType;
    }

    @Override public long getTypeSize()
    {
        return size;
    }

    public Type baseType()
    {
        return pointeeType;
    }

    @Override public boolean isSignedType()
    {
        return false;
    }

    @Override public boolean isCallable()
    {
        return pointeeType.isFunctionType();
    }

    public boolean equals(Object other)
    {
        if (this == other)
            return true;
        if (!(other instanceof PointerType))
            return false;

        return pointeeType.equals(((PointerType) other).pointeeType);
    }

    public int hashCode()
    {
        return (int) (size << 5 + pointeeType.hashCode());
    }

    public boolean isSameType(Type other)
    {
        if (this == other)
            return true;

        return other.isPointerType() &&
                isSameType(((PointerType) other).pointeeType);
    }

    @Override public boolean isCompatible(Type other)
    {
        if (!other.isPointerType())
            return false;
        if (pointeeType.isVoidType())
        {
            return true;
        }
        if (other.baseType().isVoidType())
        {
            return true;
        }
        return pointeeType.isCompatible(other.baseType());
    }

    public boolean isCastableTo(Type other)
    {
        return other.isIntegerType() || other.isPointerType();
    }

    public String toString()
    {
        return pointeeType.toString() + "*";
    }

    public QualType getPointeeType()
    {
        return pointeeType;
    }
}
