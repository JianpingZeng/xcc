package backend.analysis;
/*
 * Xlous C language Compiler
 * Copyright (c) 2015-2017, Xlous
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
 * or implied.  See the License for the specific language governing
 * permissions and limitations under the License.
 */

import backend.type.Type;

import java.io.PrintStream;

/**
 * @author Xlous.zeng
 * @version 0.1
 */
public final class SCEVCouldNotCompute extends SCEV
{
    public SCEVCouldNotCompute()
    {
        super(SCEVType.scCouldNotCompute);
    }

    @Override
    public boolean isLoopInvariant(Loop loop)
    {
        assert false : "Attempt to use a SCEVCouldNotCompute object!";
        return false;
    }

    @Override
    public boolean hasComputableLoopEvolution(Loop loop)
    {
        assert false : "Attempt to use a SCEVCouldNotCompute object!";
        return false;
    }

    @Override
    public SCEV replaceSymbolicValuesWithConcrete(SCEV sym, SCEV concrete)
    {
        return this;
    }

    @Override
    public Type getType()
    {
        assert false : "Attempt to use a SCEVCouldNotCompute object!";
        return null;
    }

    @Override
    public void print(PrintStream os)
    {
        os.print("****CouldNotCompute****");
    }
}