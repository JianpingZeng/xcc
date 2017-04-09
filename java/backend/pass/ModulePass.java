package backend.pass;

import backend.hir.Module;
import tools.Pair;

import java.util.ArrayList;

/**
 * @author Xlous.zeng
 * @version 0.1
 */
public interface ModulePass extends Pass
{
	/**
	 * This method should be overridden by concrete subclasses to perform
	 * user-defined operation.
	 * @param m
	 * @return
	 */
	boolean runOnModule(Module m);

	@Override
	default boolean run(Module m)
	{
		return runOnModule(m);
	}
}