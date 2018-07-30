package utils.tablegen;
/*
 * Extremely C language Compiler
 * Copyright (c) 2015-2018, Jianping Zeng.
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

import tools.Util;
import utils.tablegen.Init.DefInit;

import java.util.ArrayList;

/**
 * @author Jianping Zeng
 * @version 0.1
 */
public final class PatternToMatch
{
    public Init.ListInit predicates;
    public TreePatternNode srcPattern;
    public TreePatternNode dstPattern;
    public ArrayList<Record> dstRegs;
    public int addedComplexity;

    public PatternToMatch(Init.ListInit preds,
            TreePatternNode src,
            TreePatternNode dst,
            ArrayList<Record> dstRegs,
            int complexity)
    {
        predicates = preds.clone();
        srcPattern = src.clone();
        dstPattern = dst.clone();
        this.dstRegs = new ArrayList<>();
        this.dstRegs.addAll(dstRegs);
        addedComplexity = complexity;
    }

    public Init.ListInit getPredicates()
    {
        return predicates;
    }

    public TreePatternNode getSrcPattern()
    {
        return srcPattern;
    }

    public ArrayList<Record> getDstRegs()
    {
        return dstRegs;
    }

    public TreePatternNode getDstPattern()
    {
        return dstPattern;
    }

    public int getAddedComplexity()
    {
        return addedComplexity;
    }

    /**
     * Return a single string containing all of this
     * pattern's predicates concatenated with "&&" operators.
     * @return
     * @throws Exception
     */
    public String getPredicateCheck() throws Exception
    {
        StringBuilder predicateCheck = new StringBuilder();
        for (int i = 0, e = predicates.getSize(); i != e; ++i)
        {
            DefInit pred = (predicates.getElement(i) instanceof DefInit) ? (DefInit)predicates.getElement(i):null;
            if (pred != null)
            {
                Record def = pred.getDef();

                if (!def.isSubClassOf("Predicate"))
                {
                    if (TableGen.DEBUG)
                        def.dump();
                    Util.assertion(false, "Undefined predicate type!");
                }

                if(predicateCheck.length() != 0)
                    predicateCheck.append(" && ");
                predicateCheck.append("(").append(def.getValueAsString("CondString")).append(")");
            }
        }
        return predicateCheck.toString();
    }

    public void dump()
    {
        System.err.println("=============================");
        System.err.println("Predicate:");
        for (int i = 0, e = predicates.getSize(); i < e; i++)
            predicates.getElement(i).dump();

        System.err.println("\nsrcPattern:");
        srcPattern.dump();
        System.err.println("\ndstPattern:");
        dstPattern.dump();
        System.err.println("\ndstRegs:");
        dstRegs.forEach(System.err::println);
        System.err.println("\naddComplexity: " + addedComplexity);
    }

    @Override
    public boolean equals(Object obj)
    {
        if (obj == null) return false;
        if (this == obj) return true;
        if (obj.getClass() != getClass())
            return false;
        PatternToMatch pat = (PatternToMatch)obj;
        return predicates.equals(pat.predicates) &&
                srcPattern.equals(pat.srcPattern) && dstPattern.equals(pat.dstPattern)
                && dstRegs.equals(pat.dstRegs) && addedComplexity == pat.addedComplexity;
    }
}
