package backend;
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

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;

/**
 * This class for defining actual dominator tree node.
 */
public class DomTreeNodeBase<T> implements Iterable<DomTreeNodeBase<T>>
{
    /**
     * The corresponding basic block of this dominator tree node.
     */
    private T block;

    /**
     * Immediate dominator.
     */
    private DomTreeNodeBase<T> IDom;
    /**
     * All of child node.
     */
    private ArrayList<DomTreeNodeBase<T>> children;

    public int DFSNumIn = -1;
    public int DFSNumOut = -1;

    public T getBlock()
    {
        return block;
    }

    public DomTreeNodeBase<T> getIDom()
    {
        return IDom;
    }

    public void setIDom(DomTreeNodeBase<T> newIDom)
    {
        assert IDom != null : "No immediate dominator";
        if (this.IDom != newIDom)
        {
            assert IDom.children
                    .contains(this) : "Not in immediate dominator chidren set";
            // erase this, no longer idom's child
            IDom.children.remove(this);
            this.IDom = newIDom;
            IDom.children.add(this);
        }
    }

    public ArrayList<DomTreeNodeBase<T>> getChildren()
    {
        return children;
    }

    @Override
    public Iterator<DomTreeNodeBase<T>> iterator()
    {
        if (children == null)
            return Collections.emptyIterator();
        else
            return children.iterator();
    }

    public DomTreeNodeBase(T bb, DomTreeNodeBase<T> IDom)
    {
        this.block = bb;
        this.IDom = IDom;
    }

    public DomTreeNodeBase<T> addChidren(DomTreeNodeBase<T> C)
    {
        children.add(C);
        return C;
    }

    public final int getNumbChidren()
    {
        return children.size();
    }

    public final void clearChidren()
    {
        children.clear();
    }

    /**
     * ReturnInst true if this node is dominated by other.
     * Use this only if DFS info is valid.
     *
     * @param other
     * @return
     */
    public boolean dominatedBy(DomTreeNodeBase<T> other)
    {
        return this.DFSNumIn >= other.DFSNumIn
                && this.DFSNumOut <= other.DFSNumOut;
    }

    public int getDFSNumIn()
    {
        return DFSNumIn;
    }

    public int getDFSNumOut()
    {
        return DFSNumOut;
    }
}