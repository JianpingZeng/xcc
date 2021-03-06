package backend.codegen;
/*
 * Extremely Compiler Collection
 * Copyright (c) 2015-2020, Jianping Zeng.
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
import tools.FoldingSetNodeID;
import tools.Util;

import java.io.PrintStream;

import static backend.support.AssemblyWriter.writeAsOperand;

/**
 * A description of a memory reference used in the backend.
 * /// Instead of holding a StoreInst or LoadInst, this class holds the address
 * /// Value of the reference along with a byte size and offset. This allows it
 * /// to describe lowered loads and stores. Also, the special PseudoSourceValue
 * /// objects can be used to represent loads and stores to memory locations
 * /// that aren't explicit in the regular LLVM IR.
 *
 * @author Jianping Zeng
 * @version 0.4
 */
public class MachineMemOperand {
  private long offset;
  private long size;
  private int flags;
  private Value val;

  public static final int MOLoad = 1;
  public static final int MOStore = 2;
  public static final int MOVolatile = 4;

  /**
   * Constructor of {@linkplain MachineMemOperand}.
   *
   * @param v The LLVM IR value
   * @param f Flag to attribute
   * @param o Offset
   * @param s Size of this operand
   * @param a Alignment
   */
  public MachineMemOperand(Value v, int f, long o, long s, int a) {
    this.offset = o;
    this.size = s;
    this.val = v;
    this.flags = (f & 0xf) | (Util.log2(a) + 1) << 3;
    Util.assertion(Util.isPowerOf2(a), "Alignment is not a power of 2!");
    Util.assertion(isLoad() || isStore(), "Not a Load/Store!");
  }

  public Value getValue() {
    return val;
  }

  public int getFlags() {
    return flags & 0x7;
  }

  public long getOffset() {
    return offset;
  }

  public long getSize() {
    return size;
  }

  public int getAlignment() {
    return (1 << (flags >> 3)) >> 1;
  }

  public boolean isLoad() {
    return (flags & MOLoad) != 0;
  }

  public boolean isStore() {
    return (flags & MOStore) != 0;
  }

  public boolean isVolatile() {
    return (flags & MOVolatile) != 0;
  }

  public void profile(FoldingSetNodeID id) {
    Util.assertion(id != null);
    id.addInteger(offset);
    id.addInteger(size);
    id.addInteger(val.hashCode());
    id.addInteger(flags);
  }

  public void print(PrintStream os) {
    Util.assertion(isLoad() || isStore(), "SV has to be a load or store");

    if (isVolatile())
      os.print("Volatile ");

    if (isLoad())
      os.print("LD ");
    if (isStore())
      os.print("ST ");
    os.print(getSize());

    // print the address information.
    os.print("[");
    if (getValue() == null)
      os.print("<unknown>");
    else {
      writeAsOperand(os, getValue(), /*printtype*/false, null);
    }

    // If the alignment of the memory reference itself differs from the alignment
    // of the base pointer, print the base alignment explicitly, next to the base
    // pointer.
    if (getAlignment() != 0)
      os.printf("(align=%d)", getAlignment());

    if (getOffset() != 0)
      os.printf("+%d", getOffset());

    os.print("]");
  }
}
