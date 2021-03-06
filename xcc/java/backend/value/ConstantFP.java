package backend.value;
/*
 * Extremely C Compiler Collection
 * Copyright (c) 2015-2020, Jianping Zeng
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

import backend.support.LLVMContext;
import backend.type.Type;
import backend.type.VectorType;
import backend.value.UniqueConstantValueImpl.APFloatKeyType;
import tools.*;

import java.util.Arrays;
import java.util.Objects;

import static backend.type.LLVMTypeID.*;
import static tools.APFloat.RoundingMode.rmNearestTiesToEven;

/**
 * @author Jianping Zeng
 * @version 0.4
 */
public class ConstantFP extends Constant {
  private APFloat val;

  /**
   * Constructs a new instruction representing the specified constants.
   *
   * @param ty
   * @param v
   */
  ConstantFP(Type ty, APFloat v) {
    super(ty, ValueKind.ConstantFPVal);
    Util.assertion(v.getSemantics() == typeToFloatSemantics(ty), "FP type mismatch!");
    val = v.clone();
  }

  private static FltSemantics typeToFloatSemantics(Type ty) {
    if (ty.equals(Type.getFloatTy(ty.getContext())))
      return APFloat.IEEEsingle;
    if (ty.equals(Type.getDoubleTy(ty.getContext())))
      return APFloat.IEEEdouble;
    if (ty.equals(Type.getX86_FP80Ty(ty.getContext())))
      return APFloat.x87DoubleExtended;
    if (ty.equals(Type.getFP128Ty(ty.getContext())))
      return APFloat.IEEEquad;

    Util.assertion("Unknown FP format");
    return null;
  }

  public static Constant get(LLVMContext context, Type ty, double v) {
    APFloat fv = new APFloat(v);
    OutRef<Boolean> ignored = new OutRef<>();
    fv.convert(typeToFloatSemantics(ty.getScalarType()),
        rmNearestTiesToEven, ignored);

    return get(context, fv);
  }

  public static ConstantFP get(Type ty, APFloat v) {
    return new ConstantFP(ty, v);
  }

  public static ConstantFP get(LLVMContext context, APFloat flt) {
    APFloatKeyType key = new APFloatKeyType(flt);
    return UniqueConstantValueImpl.getUniqueImpl().getOrCreate(context, key);
  }

  @Override
  public boolean isNullValue() {
    // positive zero
    return val.isZero() && !val.isNegative();
  }

  public static Constant get(APSInt complexIntReal) {
    // TODO: 17-11-28
    return null;
  }

  public double getValue() {
    return val.convertToDouble();
  }

  public APFloat getValueAPF() {
    return val;
  }

  @Override
  public boolean equals(Object obj) {
    if (obj == null)
      return false;
    if (obj == this)
      return true;

    if (getClass() != obj.getClass())
      return false;
    ConstantFP o = (ConstantFP) obj;
    return new APFloatKeyType(val).equals(new APFloatKeyType(o.val));
  }

  @Override
  public int hashCode() {
    return getValueAPF().hashCode();
  }

  public static boolean isValueValidForType(Type ty, APFloat val) {
    APFloat val2 = new APFloat(val);
    OutRef<Boolean> loseInfo = new OutRef<>(false);

    switch (ty.getTypeID()) {
      default:
        return false;
      case FloatTyID: {
        if (val2.getSemantics() == APFloat.IEEEsingle)
          return true;
        val2.convert(APFloat.IEEEsingle, rmNearestTiesToEven, loseInfo);
        return !loseInfo.get();
      }
      case DoubleTyID: {
        if (val2.getSemantics() == APFloat.IEEEsingle ||
            val2.getSemantics() == APFloat.IEEEdouble)
          return true;

        val2.convert(APFloat.IEEEdouble, rmNearestTiesToEven, loseInfo);
        return !loseInfo.get();
      }
      case X86_FP80TyID:
        return val2.getSemantics() == APFloat.IEEEsingle ||
            val2.getSemantics() == APFloat.IEEEdouble ||
            val2.getSemantics() == APFloat.x87DoubleExtended;
      case FP128TyID:
        return val2.getSemantics() == APFloat.IEEEsingle ||
            val2.getSemantics() == APFloat.IEEEdouble ||
            val2.getSemantics() == APFloat.IEEEquad;
    }
  }

  public static ConstantFP getNegativeZero(Type type) {
    APFloat opf = ((ConstantFP) Constant.getNullValue(type)).getValueAPF();
    opf.changeSign();
    return get(type.getContext(), opf);
  }

  public static Value getZeroValueForNegation(Type type) {
    if (type instanceof VectorType) {
      VectorType vty = (VectorType) type;
      if (vty.getElementType().isFloatingPointType()) {
        Constant[] zeros = new Constant[(int) vty.getNumElements()];
        Arrays.fill(zeros, getNegativeZero(vty.getElementType()));
        return ConstantVector.get(zeros);
      }
    }
    if (type.isFloatingPointType())
      return getNegativeZero(type);
    return Constant.getNullValue(type);
  }

  @Override
  public Value clone() {
    return new ConstantFP(getType(), getValueAPF().clone());
  }
}
