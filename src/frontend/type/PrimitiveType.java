package frontend.type;
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

/**
 * This class represents the primitive frontend.type of C language.
 * @author Xlous.zeng
 * @version 0.1
 */
public abstract class PrimitiveType extends Type
{
    protected String name;
    /**
     * Constructor with one parameter which represents the kind of frontend.type
     * for reason of comparison convenient.
     *
     * @param tag
     */
    public PrimitiveType(int tag, String name)
    {
        super(tag);
        this.name = name;
    }
    @Override
    public boolean isSignedType()
    {
        return tag>= Char && tag<= LongInteger;
    }
}