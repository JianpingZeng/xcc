package utils.tablegen;
/*
 * Xlous C language Compiler
 * Copyright (c) 2015-2017, Xlous Zeng.
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

import backend.codegen.MVT;
import gnu.trove.list.array.TIntArrayList;

import static utils.tablegen.CodeGenDAGPatterns.*;

/**
 * @author Xlous.zeng
 * @version 0.1
 */
public interface EEVT
{
    int isFP = MVT.LAST_VALUETYPE;
    int isInt = isFP + 1;
    int isVec = isInt + 1;
    int isUnknown = isVec + 1;

    static boolean isExtIntegerInVTs(TIntArrayList evts)
    {
        assert !evts.isEmpty():"Cannot check for integer in empty ExtVT list!";
        return evts.get(0) == isInt || !(filterEVTs(evts, isInteger)).isEmpty();
    }

    static boolean isExtFloatingPointInVTs(TIntArrayList evts)
    {
        assert !evts.isEmpty():"Cannot check for integer in empty ExtVT list!";
        return evts.get(0) == isFP || !(filterEVTs(evts, isFloatingPoint)).isEmpty();
    }

    static boolean isExtVectorVTs(TIntArrayList evts)
    {
        assert !evts.isEmpty():"Cannot check for integer in empty ExtVT list!";
        return evts.get(0) == isVec || !(filterEVTs(evts, isVector)).isEmpty();
    }
}