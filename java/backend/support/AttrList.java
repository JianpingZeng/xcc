package backend.support;
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

import java.util.ArrayList;
import java.util.List;

/**
 * @author Xlous.zeng
 * @version 0.1
 */
public final class AttrList
{
    private ArrayList<AttributeWithIndex> attrs;

    public AttrList(List<AttributeWithIndex> indices)
    {
        attrs = new ArrayList<>();
        attrs.addAll(indices);
    }

    public boolean paramHasAttr(int index, int attr)
    {
        return (getAttribute(index) & attr) != 0;
    }

    public int getParamAlignment(int index)
    {
        return Attribute.getAlignmentFromAttrs(getAttribute(index));
    }

    public int getAttribute(int index)
    {
        if (attrs == null || attrs.isEmpty())
            return Attribute.None;

        for (AttributeWithIndex i : attrs)
        {
            if (i.index > index)
                break;
            if (i.index == index)
                return i.attrs;
        }
        return Attribute.None;
    }

    public int getParamAttriute(int index)
    {
        assert index != 0 && index != ~0:"invalid parameter index!";
        return getAttribute(index);
    }

    public int getRetAttribute()
    {
        return getAttribute(0);
    }

    public int getFnAttribute()
    {
        return getAttribute(~0);
    }

    public boolean isEmpty()
    {
        return attrs == null ||attrs.isEmpty();
    }

    public void dump()
    {
        // TODO: 2017/11/27
    }
}