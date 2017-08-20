/*
 * Extremely C language Compiler
 * Copyright (c) 2015-2017, Xlous Zeng.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
 * or implied.  See the License for the specific language governing
 * permissions and limitations under the License.
 */

package jlang.type;

import gnu.trove.list.array.TIntArrayList;

/**
 * @author Xlous.zeng
 * @version 0.1
 */
public class FoldingSetNodeID
{
    TIntArrayList bits = new TIntArrayList();

    public void clear()
    {
        bits.clear();
    }

    public int computeHash()
    {
        return 0;
    }

    public void addInteger(int val)
    {
        bits.add(val);
    }

    public void addInteger(long val)
    {
        bits.add((int)val);
        if (val != (int)val)
            bits.add((int)(val >> 32));
    }

    public void addBoolean(boolean val)
    {
        addInteger(val?1:0);
    }

    public void addString(String str)
    {
        int len = str.length();
        bits.add(len);
        if (len == 0)return;

        int pos = 0;
        for (pos +=4; pos < len; pos +=4)
        {
            int v = str.charAt(pos-4) << 24 |
                    str.charAt(pos-3) << 16 |
                    str.charAt(pos-2) << 8 |
                    str.charAt(pos-1);
            bits.add(v);
        }

        // Handle the leftover bits.
        int v = 0;
        switch (pos - len)
        {
            case 1: v = (v << 8) + str.charAt(len-3);
                // Fall trough.
            case 2: v = (v << 8) + str.charAt(len-2);
                // Fall trough.
            case 3: v = (v << 8) + str.charAt(len-1);
                break;
            default:return; // nothing left.
        }
        bits.add(v);
    }

    @Override
    public boolean equals(Object obj)
    {
        if (obj == null)
            return false;
        if (this == obj)
            return true;
        if (getClass() != getClass())
            return false;
        FoldingSetNodeID id = (FoldingSetNodeID)obj;
        return id.bits.equals(this.bits);
    }

    @Override
    public int hashCode()
    {
        return computeHash();
    }
}