package backend.pass;

import backend.value.Module;

/**
 * his class is used to provide information that does not need to be run.
 * @author Jianping Zeng
 * @version 0.1
 */
public interface ImmutablePass extends ModulePass
{
	default boolean run(Module m) {return false;}

	default void initializePass(){}

	default boolean runOnModule(Module m) {return false;}

	@Override
	default ImmutablePass getAsImmutablePass()
	{
		return this;
	}
}
