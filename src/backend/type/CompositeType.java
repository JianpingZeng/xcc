package backend.type;
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

import backend.value.Value;

/**
 * Common super class of ArrayType, StructType, and PointerType.
 * @author Xlous.zeng
 * @version 0.1
 */
public abstract class CompositeType extends Type
{
    protected CompositeType(int primitiveID)
    {
        super("", primitiveID);
    }

    public abstract Type getTypeAtIndex(Value v);

    public abstract boolean indexValid(final Value v);

    // getIndexType - Return the type required of indices for this composite.
    // For structures, this is ubyte, for arrays, this is uint.
    public abstract Type getIndexType();
}