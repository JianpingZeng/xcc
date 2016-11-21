package backend.pass;

import backend.value.Function;

/**
 * @author Xlous.zeng
 * @version 0.1
 */
public class FunctionPassManager extends PassManagerBase
{
	/**
	 * Execute all of the passes scheduled for execution.  Keep
	 * track of whether any of the passes modifies the function, and if
	 * so, return true.
	 * @param f
	 * @return
	 */
	public boolean run(Function f)
	{
		return false;
	}
}