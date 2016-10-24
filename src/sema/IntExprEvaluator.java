package sema;
/*
 * Xlous C language Compiler
 * Copyright (c) 2015-2016, Xlous
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

import ast.Tree.*;
import utils.OutParamWrapper;

/**
 * This class represents a implementation of evaluating whether the value of constant
 * expression is an integer. Otherwise, issue error messages if failed.
 *
 * @author Xlous.zeng
 * @version 0.1
 */
public final class IntExprEvaluator extends ExprEvaluatorBase<Boolean>
{
    private OutParamWrapper<APValue> result;

    public IntExprEvaluator(OutParamWrapper<APValue> result)
    {

    }

    @Override
    protected Boolean success(APValue v, Expr e)
    {
        return false;
    }

    @Override
    protected Boolean error(Expr expr)
    {
        return false;
    }

    @Override
    protected Boolean visit(Expr expr)
    {
        return false;
    }
}
