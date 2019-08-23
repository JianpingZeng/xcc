/*
 * Extremely C language Compiler
 * Copyright (c) 2015-2019, Jianping Zeng.
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

package cfe.type;

import cfe.ast.Tree.Expr;
import cfe.support.PrintingPolicy;

/**
 * TypeOfExprType (GCC extension).
 *
 * @author Jianping Zeng
 * @version 0.4
 */
public final class TypeOfExprType extends cfe.type.Type {
  private Expr toexpr;

  public TypeOfExprType(Expr e, QualType can) {
    super(TypeOfExpr, can);
    toexpr = e;
  }

  public TypeOfExprType(Expr e) {
    super(TypeOfExpr, new QualType());
  }

  @Override
  public String getAsStringInternal(String inner, PrintingPolicy policy) {
    // Prefix the basic type, e.g. 'typeof(e) X'.
    if (!inner.isEmpty())
      inner = ' ' + inner;
    String str = getUnderlyingExpr().toString();
    return "typeof " + str + inner;
  }

  public Expr getUnderlyingExpr() {
    return toexpr;
  }
}