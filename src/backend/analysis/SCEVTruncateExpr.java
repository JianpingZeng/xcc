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
import backend.value.ConstantExpr;
import tools.Pair;

import java.io.PrintStream;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * @author Xlous.zeng
 * @version 0.1
 */
public final class SCEVTruncateExpr extends SCEV
{
    private static HashMap<Pair<SCEV, Type>, SCEVTruncateExpr>
            scevTruncateExprHashMap = new HashMap<>();

    private SCEV op;
    private Type ty;

    private SCEVTruncateExpr(SCEV op, Type type)
    {
        super(SCEVType.scTruncate);
        this.op = op;
        ty = type;
    }

    public static SCEV get(SCEV op, Type type)
    {
        if (op instanceof SCEVConstant)
        {
            SCEVConstant sc = (SCEVConstant)op;
            return SCEVUnknown.get(ConstantExpr.getTrunc(sc.getValue(), type));
        }

        if (op instanceof SCEVAddRecExpr)
        {
            SCEVAddRecExpr addRec = (SCEVAddRecExpr)op;
            ArrayList<SCEV> newOps = new ArrayList<>();
            for (SCEV opr : addRec.getOperands())
            {
                if (opr instanceof SCEVConstant)
                    newOps.add(get(opr, type));
                else
                    break;
            }

            if (newOps.size() == addRec.getNumOperands())
                return SCEVAddRecExpr.get(newOps, addRec.getLoop());
        }

        Pair<SCEV, Type> key = Pair.get(op, type);
        if (!scevTruncateExprHashMap.containsKey(key))
        {
            SCEVTruncateExpr res = new SCEVTruncateExpr(op, type);
            scevTruncateExprHashMap.put(key, res);
            return res;
        }

        return scevTruncateExprHashMap.get(key);
    }

    public SCEV getOperand()
    {
        return op;
    }

    @Override
    public boolean isLoopInvariant(Loop loop)
    {
        return op.isLoopInvariant(loop);
    }

    @Override
    public boolean hasComputableLoopEvolution(Loop loop)
    {
        return op.hasComputableLoopEvolution(loop);
    }

    @Override
    public SCEV replaceSymbolicValuesWithConcrete(SCEV sym, SCEV concrete)
    {
        SCEV res = op.replaceSymbolicValuesWithConcrete(sym, concrete);
        if (res.equals(op))
            return this;
        return get(res, ty);
    }

    @Override
    public Type getType()
    {
        return ty;
    }

    @Override
    public void print(PrintStream os)
    {

    }
}