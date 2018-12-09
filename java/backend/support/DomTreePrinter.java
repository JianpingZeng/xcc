/*
 * Extremely C language Compiler
 * Copyright (c) 2015-2018, Jianping Zeng.
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

package backend.support;

import backend.analysis.DomTree;
import backend.pass.AnalysisResolver;
import backend.pass.AnalysisUsage;
import backend.pass.FunctionPass;
import backend.value.Function;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintStream;

import static backend.support.GraphWriter.writeGraph;

/**
 * This file defines a pass used for printing out Dominator tree for specified
 * Function into dot file.
 *
 * @author Jianping Zeng
 * @version 0.4
 */
public final class DomTreePrinter implements FunctionPass {
  private AnalysisResolver resolver;

  @Override
  public boolean runOnFunction(Function f) {
    String funcName = f.getName();
    String filename = "domtree." + funcName + ".dot";
    DomTree dt = (DomTree) getAnalysisToUpDate(DomTree.class);

    try (PrintStream out = new PrintStream(new File(filename))) {
      System.err.printf("Writing '%s'...%n", filename);
      writeGraph(out, DefaultDotGraphTrait.createDomTreeTrait(dt, funcName));
    } catch (FileNotFoundException e) {
      System.err.println(" error opening file for writing!");
    }
    return false;
  }

  @Override
  public void getAnalysisUsage(AnalysisUsage au) {
    au.setPreservedAll();
    au.addRequired(DomTree.class);
  }

  @Override
  public String getPassName() {
    return "Print out Dominator tree into dot file";
  }

  @Override
  public AnalysisResolver getAnalysisResolver() {
    return resolver;
  }

  @Override
  public void setAnalysisResolver(AnalysisResolver resolver) {
    this.resolver = resolver;
  }
}
