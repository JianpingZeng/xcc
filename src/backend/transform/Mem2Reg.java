package backend.transform;
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

import backend.analysis.DomTreeInfo;
import backend.hir.BasicBlock;
import backend.pass.AnalysisUsage;
import backend.pass.FunctionPass;
import backend.pass.RegisterPass;
import backend.value.Function;
import backend.value.Instruction;
import backend.value.Instruction.AllocaInst;

import java.util.ArrayList;

/**
 * This pass is a simple pass wrapper around the PromoteMemToReg function call
 * exposed by the Utils library.
 * @author Xlous.zeng
 * @version 0.1
 */
public final class Mem2Reg implements FunctionPass
{
    public static RegisterPass promotePass =
            new RegisterPass("Promote memory to Register", Mem2Reg.class);
    /**
     * Statistics the number of allocas instruction to be promoted.
     */
    public static int numPromoted;

    /**
     * Provides a entry point to create an instance of this pass.
     * @return
     */
    public static Mem2Reg createPromoteMemoryToRegisterPass()
    {
        return new Mem2Reg();
    }

    @Override
    public String getPassName()
    {
        return "Promote memory to register pass";
    }

    @Override
    public void getAnalysisUsage(AnalysisUsage au)
    {
        au.addRequired(DomTreeInfo.class);
        au.addRequired(DominatorFrontier.class);

        au.addPreserved(UnifyFunctionExitNodes.class);
        au.addPreserved(LowerSwitch.class);
    }

    @Override
    public boolean runOnFunction(Function f)
    {
        boolean changed = false;
        ArrayList<AllocaInst> allocas = new ArrayList<>();

        DomTreeInfo dt = getAnalysisToUpDate(DomTreeInfo.class);
        DominatorFrontier df = getAnalysisToUpDate(DominatorFrontier.class);
        BasicBlock entryBB = f.getEntryBlock();

        while (true)
        {
            for (Instruction inst : entryBB)
            {
                if (inst instanceof AllocaInst)
                    if (PromoteMemToReg.isAllocaPromotable((AllocaInst)inst))
                        allocas.add((AllocaInst)inst);
            }

            if (allocas.isEmpty()) break;

            PromoteMemToReg.promoteMemToReg(allocas, dt, df);
            numPromoted += allocas.size();
            changed = true;
        }
        return changed;
    }
}
