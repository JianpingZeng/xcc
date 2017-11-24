package backend.codegen;

import backend.support.FormattedOutputStream;

/**
 * A specialized PseudoSourceValue for holding FixedStack values, which must
 * include a frame index.
 * @author Xlous.zeng
 * @version 0.1
 */
public class FixedStackPseudoSourceValue extends PseudoSourceValue
{
    private int frameIndex;
    public FixedStackPseudoSourceValue(int fi)
    {
        frameIndex = fi;
    }

    @Override
    public boolean isConstant(MachineFrameInfo mfi)
    {
        return mfi != null && mfi.isImmutableObjectIndex(frameIndex);
    }

    @Override public void print(FormattedOutputStream os)
    {
        os.printf("FixedStack%d", frameIndex);
    }
}