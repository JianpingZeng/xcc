package utils.tablegen;
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

import tools.Error;
import tools.Util;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.TreeMap;
import java.util.TreeSet;

/**
 * This class corresponds to the Target class in .td file.
 *
 * @author Jianping Zeng
 * @version 0.4
 */
public final class CodeGenTarget {
  private Record targetRec;
  private TreeMap<String, CodeGenInstruction> insts;
  private ArrayList<CodeGenRegister> registers;
  private ArrayList<CodeGenRegisterClass> registerClasses;
  private ArrayList<ValueTypeByHwMode> legalValueTypes;
  private CodeGenHwModes hwModes;
  private RecordKeeper keeper;

  public CodeGenTarget(RecordKeeper keeper) {
    legalValueTypes = new ArrayList<>();
    this.keeper = keeper;
    hwModes = new CodeGenHwModes(keeper);

    ArrayList<Record> targets = Record.records.getAllDerivedDefinition("Target");
    if (targets.isEmpty())
      Error.printFatalError("Error: No target defined!");
    if (targets.size() != 1)
      Error.printFatalError("Error: Multiple subclasses of Target defined!");

    targetRec = targets.get(0);
    readRegisters();
    // Read register classes description information from records.
    readRegisterClasses();
  }

  CodeGenHwModes getHwModes() {
    return hwModes;
  }

  private void readRegisters() {
    ArrayList<Record> regs = Record.records.getAllDerivedDefinition("Register");
    if (regs.isEmpty())
      Error.printFatalError("No 'Register' subclasses defined!");
    registers = new ArrayList<>();
    regs.forEach(reg ->
    {
      try {
        registers.add(new CodeGenRegister(reg));
      } catch (Exception e) {
        e.printStackTrace();
      }
    });
  }

  /**
   * rc1 is a sub-class of rc2 if it is a valid replacement for any
   * instruction operand where an rc2 register is required. It must satisfy
   * these conditions:
   * 1. All rc1 registers are also in rc2.
   * 2. The rc2 spill size must not be smaller that the rc1 spill size.
   * 3. rc2 spill alignment must be compatible with rc1.
   * <p>
   * Sub-classes are used to determine if a virtual register can be used
   * as an instruction operand, or if it must be copied first.
   *
   * @param rc1
   * @param rc2
   * @return
   */
  private boolean isSubRegClass(CodeGenRegisterClass rc1, CodeGenRegisterClass rc2) {
    return rc1.regInfos.isSubClassOf(rc2.regInfos) &&
        rc2.members.containsAll(rc1.members);
  }

  /**
   * For each register class, computing sub class for it.
   */
  private void computeSubClasses() {
    for (int i = 0, e = registerClasses.size(); i < e; i++) {
      CodeGenRegisterClass rc = registerClasses.get(i);
      for (int j = 0; j < e; j++) {
        // don't add itself to the sub-classes list.
        if (j == i) continue;
        CodeGenRegisterClass rc2 = registerClasses.get(j);
        if (rc.subClasses.contains(rc2))
          continue;
        if (isSubRegClass(rc2, rc))
          rc.subClasses.add(rc2);
      }
    }
    for (CodeGenRegisterClass rc : registerClasses) {
      for (CodeGenRegisterClass subClass : rc.subClasses)
        subClass.superClasses.add(rc);
    }
  }

  private void readRegisterClasses() {
    ArrayList<Record> regClasses = Record.records.getAllDerivedDefinition("RegisterClass");
    if (regClasses.isEmpty())
      Error.printFatalError("No 'RegisterClass subclass defined!");
    registerClasses = new ArrayList<>();
    regClasses.forEach(regKls ->
        registerClasses.add(new CodeGenRegisterClass(regKls, getHwModes())));
    computeSubClasses();
  }

  private void readInstructions() {
    ArrayList<Record> instrs = Record.records.getAllDerivedDefinition("Instruction");
    if (instrs.size() <= 2)
      Error.printFatalError("No 'Instruction' subclasses defined!");

    insts = new TreeMap<>();
    for (Record inst : instrs) {
      insts.put(inst.getName(), new CodeGenInstruction(inst));
    }
  }

  private static int AsmWriterNum = 0;

  Record getAsmWriter() {
    ArrayList<Record> li = targetRec.getValueAsListOfDefs("AssemblyWriters");
    if (AsmWriterNum >= li.size())
      Error.printFatalError("Target does not have an AsmWriter #" + AsmWriterNum + "!");
    return li.get(AsmWriterNum);
  }

  public Record getTargetRecord() {
    return targetRec;
  }

  public String getName() {
    return targetRec.getName();
  }

  Record getInstructionSet() {
    return targetRec.getValueAsDef("InstructionSet");
  }

  ArrayList<CodeGenRegisterClass> getRegisterClasses() {
    return registerClasses;
  }

  public ArrayList<CodeGenRegister> getRegisters() {
    return registers;
  }

  public TreeMap<String, CodeGenInstruction> getInstructions() {
    if (insts == null || insts.isEmpty())
      readInstructions();
    return insts;
  }

  /**
   * Return all of the insts defined by the target, ordered by their
   * enum value.
   *
   * @param numberedInstructions
   */
  void getInstructionsByEnumValue(
      ArrayList<CodeGenInstruction> numberedInstructions) {
    String[] firstPriority = {
        "PHI",
        "INLINEASM",
        "PROLOG_LABEL",
        "EH_LABEL",
        "GC_LABEL",
        "KILL",
        "EXTRACT_SUBREG",
        "INSERT_SUBREG",
        "IMPLICIT_DEF",
        "SUBREG_TO_REG",
        "COPY_TO_REGCLASS",
        "DBG_VALUE",
        "REG_SEQUENCE",
        "COPY"
    };
    TreeSet<String> names = new TreeSet<>();
    for (String instr : firstPriority) {
      if (!insts.containsKey(instr))
        Error.printFatalError(String.format("Could not find '%s' instruction", instr));
      numberedInstructions.add(insts.get(instr));
      names.add(instr);
    }

    // Print out the rest of the insts set.
    insts.entrySet().forEach(entry ->
    {
      CodeGenInstruction inst = entry.getValue();
      if (!names.contains(entry.getKey()))
        numberedInstructions.add(inst);
    });
  }

  public CodeGenInstruction getInstruction(String name) {
    insts = getInstructions();
    Util.assertion(insts.containsKey(name), String.format("The '%s' is not an instruction!", name));
    return insts.get(name);
  }

  /**
   * Return the MVT::SimpleValueType that the specified TableGen
   * record corresponds to.
   *
   * @param rec
   * @return
   * @throws Exception
   */
  public static int getValueType(Record rec) {
    return (int) rec.getValueAsInt("Value");
  }

  private void readLegalValueTypes() {
    ArrayList<CodeGenRegisterClass> rcs = getRegisterClasses();
    for (CodeGenRegisterClass rc : rcs) {
      for (int i = 0, e = rc.vts.size(); i != e; i++)
        legalValueTypes.add(rc.vts.get(i));
    }

    // Remove duplicates.
    HashSet<ValueTypeByHwMode> set = new HashSet<>(legalValueTypes);

    legalValueTypes.clear();
    legalValueTypes.addAll(set);
  }

  ArrayList<ValueTypeByHwMode> getLegalValueTypes() {
    if (legalValueTypes.isEmpty()) readLegalValueTypes();

    return legalValueTypes;
  }

  CodeGenRegisterClass getRegisterClass(Record r) {
    for (CodeGenRegisterClass rc : registerClasses)
      if (rc.theDef.equals(r))
        return rc;

    Util.assertion("Didn't find the register class!");
    return null;
  }

  /**
   * Find the register class that contains the
   * specified physical register.  If the register is not in a register
   * class, return null. If the register is in multiple classes, and the
   * classes have a superset-subset relationship and the same set of
   * types, return the superclass.  Otherwise return null.
   *
   * @param r
   * @return
   */
  CodeGenRegisterClass getRegisterClassForRegister(Record r) {
    ArrayList<CodeGenRegisterClass> rcs = getRegisterClasses();
    CodeGenRegisterClass foundRC = null;
    for (int i = 0, e = rcs.size(); i != e; ++i) {
      CodeGenRegisterClass rc = registerClasses.get(i);
      for (int ei = 0, ee = rc.members.size(); ei != ee; ++ei) {
        if (!rc.contains(r))
          continue;

        if (foundRC == null) {
          foundRC = rc;
          continue;
        }
        // If a register's classes have different types, return null.
        if (!rc.getValueTypes().equals(foundRC.getValueTypes()))
          return null;

        // Check to see if the previously found class that contains
        // the register is a subclass of the current class. If so,
        // prefer the superclass.
        if (rc.hasSubClass(foundRC)) {
          foundRC = rc;
          continue;
        }

        if (foundRC.hasSupClass(rc))
          continue;

        // Multiple classes, and neither is a superclass of the other.
        // Return null.
        return null;
      }
    }
    return foundRC;
  }

  /**
   * Find the union of all possible SimpleValueTypes for the
   * specified physical register.
   *
   * @param r
   * @return
   */
  ArrayList<ValueTypeByHwMode> getRegisterVTs(Record r) {
    ArrayList<ValueTypeByHwMode> res = new ArrayList<>();
    for (CodeGenRegisterClass rc : registerClasses) {
      if (rc.contains(r)) {
        ArrayList<ValueTypeByHwMode> inVTs = rc.getValueTypes();
        res.addAll(inVTs);
      }
    }
    return res;
  }
}
