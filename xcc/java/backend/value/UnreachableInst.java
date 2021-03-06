/*
 * Extremely Compiler Collection
 * Copyright (c) 2015-2020, Jianping Zeng.
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

package backend.value;

import backend.support.LLVMContext;
import backend.type.Type;
import tools.Util;

/**
 * @author Jianping Zeng
 * @version 0.4
 */
public class UnreachableInst extends Instruction.TerminatorInst {
  public UnreachableInst(LLVMContext context, BasicBlock insertAtEnd) {
    super(Type.getVoidTy(context), Operator.Unreachable, "", insertAtEnd);
  }

  public UnreachableInst(LLVMContext context, Instruction insertBefore) {
    super(Type.getVoidTy(context), Operator.Unreachable, "", insertBefore);
  }

  public UnreachableInst(LLVMContext context) {
    this(context, (Instruction) null);
  }

  @Override
  public BasicBlock getSuccessor(int index) {
    Util.assertion(false, "UnreachableInst has no successor");
    return null;
  }

  @Override
  public int getNumOfSuccessors() {
    //Util.assertion(false, "UnreachableInst has no successor");
    return 0;
  }

  @Override
  public void setSuccessor(int index, BasicBlock bb) {
    Util.assertion(false, "UnreachableInst has no successor");
  }
}
