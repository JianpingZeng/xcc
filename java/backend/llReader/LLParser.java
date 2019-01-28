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

package backend.llReader;

import backend.ir.FreeInst;
import backend.ir.MallocInst;
import backend.ir.SelectInst;
import backend.support.*;
import backend.type.*;
import backend.type.Type;
import backend.value.*;
import backend.value.GlobalValue.LinkageType;
import backend.value.GlobalValue.VisibilityTypes;
import backend.value.Instruction.*;
import backend.value.Instruction.CmpInst.Predicate;
import backend.value.Module;
import gnu.trove.iterator.TIntObjectIterator;
import gnu.trove.list.array.TIntArrayList;
import gnu.trove.map.hash.TIntObjectHashMap;
import jlang.support.MemoryBuffer;
import tools.*;
import tools.SourceMgr.SMLoc;

import java.util.*;
import java.util.stream.Collectors;

import static backend.llReader.LLTokenKind.*;
import static backend.llReader.ValID.ValIDKind.t_PackedConstantStruct;
import static tools.Util.unEscapeLexed;

/**
 * This file defines a class which responsible for a frontend pipeline, reading
 * character stream for external file, tokenizing character stream read. finally,
 * parses a valid Module where function and global value resides.
 *
 * @author Jianping Zeng
 * @version 0.4
 */
public final class LLParser {
  public static class UpRefRecord {
    SMLoc loc;
    int nestedLevel;
    Type lastContainedTy;
    OpaqueType upRefTy;

    public UpRefRecord(SMLoc loc, int nestedLevel, OpaqueType upRefTy) {
      this.loc = loc;
      this.nestedLevel = nestedLevel;
      this.lastContainedTy = upRefTy;
      this.upRefTy = upRefTy;
    }
  }

  // Instruction metadata resolution.  Each instruction can have a list of
  // MDRef info associated with them.
  //
  // The simpler approach of just creating temporary MDNodes and then calling
  // RAUW on them when the definition is processed doesn't work because some
  // instruction metadata kinds, such as dbg, get stored in the IR in an
  // "optimized" format which doesn't participate in the normal value use
  // lists. This means that RAUW doesn't work, even on temporary MDNodes
  // which otherwise support RAUW. Instead, we defer resolving MDNode
  // references until the definitions have been processed.
  static class MDRef {
    SMLoc loc;
    int mdKind, mdSlot;

    MDRef(SMLoc loc, int kind, int slot) {
      this.loc = loc;
      this.mdKind = kind;
      this.mdSlot = slot;
    }
  }

  private LLLexer lexer;
  private Module m;
  private TreeMap<String, Pair<Type, SMLoc>> forwardRefTypes;
  private TIntObjectHashMap<Pair<Type, SMLoc>> forwardRefTypeIDs;
  private ArrayList<Type> numberedTypes;
  private ArrayList<MDNode> numberedMetadata;
  private TIntObjectHashMap<Pair<MDNode, SMLoc>> forwardRefMDNodes;
  private ArrayList<UpRefRecord> upRefs;

  private TreeMap<String, Pair<GlobalValue, SMLoc>> forwardRefVals;
  private TIntObjectHashMap<Pair<GlobalValue, SMLoc>> forwardRefValIDs;
  private ArrayList<GlobalValue> numberedVals;
  private HashMap<Instruction, ArrayList<MDRef>> forwardRefInstMetadata;

  public LLParser(MemoryBuffer buf, SourceMgr smg, Module m, OutRef<SMDiagnostic> diag) {
    lexer = new LLLexer(buf, smg, diag);
    this.m = m;
    forwardRefTypes = new TreeMap<>();
    forwardRefTypeIDs = new TIntObjectHashMap<>();
    numberedTypes = new ArrayList<>();
    numberedMetadata = new ArrayList<MDNode>();
    forwardRefMDNodes = new TIntObjectHashMap<>();
    upRefs = new ArrayList<>();
    forwardRefVals = new TreeMap<>();
    forwardRefValIDs = new TIntObjectHashMap<>();
    numberedVals = new ArrayList<>();
    forwardRefInstMetadata = new HashMap<>();
  }

  /**
   * The entry to parse input ll file.
   * <pre>
   *  module ::= toplevelentity*
   * </pre>
   *
   * @return
   */
  public boolean run() {
    // obtain a token.
    lexer.lex();
    return parseTopLevelEntities() || validateEndOfModule();
  }

  boolean error(SMLoc loc, String msg) {
    return lexer.error(loc, msg);
  }

  private boolean tokError(String msg) {
    return error(lexer.getLoc(), msg);
  }

  /**
   * The top level entities.
   *
   * @return Sucessful return true, otherwise return false.
   */
  private boolean parseTopLevelEntities() {
    while (true) {
      switch (lexer.getTokKind()) {
        default:
          return tokError("expected top-level entity");
        case Eof:
          return false;
        case kw_declare:
          if (parseDeclare())
            return true;
          break;
        case kw_define:
          if (parseDefine())
            return true;
          break;
        case kw_module:
          if (parseModuleAsm())
            return true;
          break;
        case kw_target:
          if (parseTargetDefinition())
            return true;
          break;
        case kw_deplibs:
          if (parseDepLibs())
            return true;
          break;
        case kw_type:
          if (parseUnnamedType())
            return true;
          break;
        case LocalVarID:
          if (parseUnnamedType())
            return true;
          break;
        case StringConstant:
        case LocalVar:
          if (parseNamedType())
            return true;
          break;
        case GlobalID:
          if (parseUnnamedGlobal())
            return true;
          break;
        case GlobalVar:
          if (parseNamedGlobal())
            return true;
          break;
        case exclaim:
          if (parseStandaloneMetadata())
            return true;
          break;
        case MetadataVar:
          if (parseNamedMetadata())
            return true;
          break;

        case kw_private:
        case kw_linker_private:
        case kw_internal:
        case kw_weak:
        case kw_weak_odr:
        case kw_linkonce:
        case kw_linkonce_odr:
        case kw_appending:
        case kw_dllexport:
        case kw_common:
        case kw_dllimport:
        case kw_external:
        case kw_extern_weak: {
          OutRef<LinkageType> linkage = new OutRef<>();
          OutRef<VisibilityTypes> visibility = new OutRef<>();
          if (parseOptionalLinkage(linkage)
              || parseOptionalVisibility(visibility)
              || parseGlobal("", new SMLoc(), linkage.get(), true,
              visibility.get())) {
            return true;
          }
          break;
        }
        case kw_default:
        case kw_hidden:
        case kw_protected: {
          OutRef<VisibilityTypes> visibility = new OutRef<>();
          if (parseOptionalVisibility(visibility) || parseGlobal("",
              new SMLoc(), LinkageType.ExternalLinkage, false,
              visibility.get())) {
            return true;
          }
          break;
        }
        case kw_thread_local:
        case kw_addrspace:
        case kw_constant:
        case kw_global:
          if (parseGlobal("", new SMLoc(), LinkageType.ExternalLinkage,
              false, VisibilityTypes.DefaultVisibility))
            return true;
          break;
      }
    }
  }

  /**
   * TopLevelEntity ::=
   *  'module' 'asm' STRINGCONSTANT
   * @return
   */
  private boolean parseModuleAsm() {
    Util.assertion(lexer.getTokKind() == kw_module);
    lexer.lex();

    OutRef<String> asmStr = new OutRef<>("");
    if (parseToken(kw_asm, "expected 'module asm'") ||
        parseStringConstant(asmStr))
      return true;
    m.appendModuleInlineAsm(asmStr.get());
    return false;
  }
  /**
   * !foo = !{!1, !2}
   *
   * @return
   */
  private boolean parseNamedMetadata() {
    Util.assertion(lexer.getTokKind() == MetadataVar);
    lexer.lex();

    String name = lexer.getStrVal();
    if (parseToken(equal, "expected '=' here") ||
        parseToken(exclaim, "Expected '!' here") ||
        parseToken(lbrace, "Expected '{' here"))
      return true;

    ArrayList<MDNode> elts = new ArrayList<>();
    OutRef<MDNode> node = new OutRef<>();
    NamedMDNode nmd = m.getOrCreateNamedMetadata(name);
    if (lexer.getTokKind() != rbrace) {
      do {
        if (parseToken(exclaim, "expected '!' here"))
          return true;

        OutRef<MDNode> n = new OutRef<>(null);
        if (parseMDNodeID(n)) return true;
        nmd.addOperand(n.get());
      }while (eatIfPresent(comma));
    }

    if (parseToken(rbrace, "expected '}' at end of metadata node"))
      return true;
    return false;
  }

  /**
   * !42 = !{...}
   *
   * @return
   */
  private boolean parseStandaloneMetadata() {
    Util.assertion(lexer.getTokKind() == exclaim);
    lexer.lex();

    OutRef<Integer> metadataID = new OutRef<>();
    OutRef<SMLoc> loc = new OutRef<>();
    OutRef<Type> ty = new OutRef<>();
    ArrayList<Value> elts = new ArrayList<>();

    if (parseInt32(metadataID) ||
        parseToken(equal, "expected '=' here") ||
        parseType(ty, loc, false) ||
        parseToken(exclaim, "Expected '!' here") ||
        parseToken(lbrace, "Expected '{' here") ||
        parseMDNodeVector(elts, null) ||
        parseToken(rbrace, "expected end of metadata node"))
      return true;

    MDNode init = MDNode.get(elts);

    if (forwardRefMDNodes.containsKey(metadataID.get())) {
      MDNode fwdNode = forwardRefMDNodes.get(metadataID.get()).first;
      fwdNode.replaceAllUsesWith(init);
      forwardRefMDNodes.remove(metadataID.get());
    } else {
      if (metadataID.get() >= numberedMetadata.size()) {
        for (int i = numberedMetadata.size(); i < metadataID.get()+1; i++)
          numberedMetadata.add(null);
      }

      numberedMetadata.set(metadataID.get(), init);
    }
    return false;
  }

  private boolean parseNamedGlobal() {
    Util.assertion(lexer.getTokKind() == GlobalVar);
    SMLoc nameLoc = lexer.getLoc();
    String name = lexer.getStrVal();
    lexer.lex();

    ///   GlobalVar '=' OptionalVisibility ALIAS ...
    ///   GlobalVar '=' OptionalLinkage OptionalVisibility ...   -> global variable
    OutRef<Boolean> hasLinkage = new OutRef<>();
    OutRef<LinkageType> linkage = new OutRef<>();
    OutRef<VisibilityTypes> visbility = new OutRef<>();
    if (parseToken(equal, "expected '=' after name") ||
        parseOptionalLinkage(linkage, hasLinkage) ||
        parseOptionalVisibility(visbility))
      return true;

    if (hasLinkage.get() || lexer.getTokKind() != kw_alias)
      return parseGlobal(name, nameLoc, linkage.get(), hasLinkage.get(),
          visbility.get());

    return error(nameLoc, "alias not supported");
  }

  private boolean parseUnnamedGlobal() {
    int varID = numberedVals.size();
    String name = "";
    SMLoc nameLoc = lexer.getLoc();

    /// ParseUnnamedGlobal:
    ///   OptionalVisibility ALIAS ...
    ///   OptionalLinkage OptionalVisibility ...   -> global variable
    ///   GlobalID '=' OptionalVisibility ALIAS ...
    ///   GlobalID '=' OptionalLinkage OptionalVisibility ...   -> global variable
    if (lexer.getTokKind() == GlobalID) {
      if (lexer.getIntVal() != varID)
        return tokError("variable expect to be numbered '%" + varID + "'");
      lexer.lex();

      if (parseToken(equal, "expected '=' after name"))
        return true;
    }

    OutRef<Boolean> hasLinkage = new OutRef<>();
    OutRef<LinkageType> linkage = new OutRef<>();
    OutRef<VisibilityTypes> visbility = new OutRef<>();
    if (parseOptionalLinkage(linkage, hasLinkage) || parseOptionalVisibility(visbility))
      return true;

    if (hasLinkage.get() || lexer.getTokKind() != kw_alias)
      return parseGlobal(name, nameLoc, linkage.get(), hasLinkage.get(),
          visbility.get());

    return error(nameLoc, "alias not supported");
  }

  /**
   * ::= LocalVar '=' 'type' type
   *
   * @return
   */
  private boolean parseNamedType() {
    String name = lexer.getStrVal();
    SMLoc nameLoc = lexer.getLoc();
    lexer.lex();    // eat LocalVar

    OutRef<Type> result = new OutRef<>();
    if (parseToken(equal, "expected '=' after name") ||
        parseToken(kw_type, "expected 'type' after '='"))
      return true;

    if (parseStructDefinition(nameLoc, name, result))
      return true;

    // set the type name, checking for conflicts as we do so.
    if (!m.addTypeName(name, result.get()))
      return false;
    if (forwardRefTypes.containsKey(name)) {
      Pair<Type, SMLoc> itr = forwardRefTypes.get(name);
      if (itr.first.equals(result.get()))
        return error(nameLoc, "self referential type is invalid");

      ((DerivedType) itr.first).refineAbstractTypeTo(result.get());
      result.set(itr.first);
      forwardRefTypes.remove(name);
    }

    // Inserting a name that is already defined, get the existing name.
    Type existing = m.getTypeByName(name);
    Util.assertion(existing != null, "conflict but no matching name");

    // Otherwise, this is an attempt to redefine a type. That's okay if
    // the redefinition is identical to the original.
    if (existing.equals(result.get()))
      return false;

    // Any other kind of (non-equivalent) redefinition is an error.
    return error(nameLoc, String
        .format("redefinition of type named '%s' of type '%s'", name,
            result.get().getDescription()));
  }

  private boolean parseStructDefinition(SMLoc typeLoc,
                                        String name,
                                        OutRef<Type> resultTy) {
    if (eatIfPresent(kw_opaque)) {
      resultTy.set(OpaqueType.get());
      return false;
    }

    boolean isPacked = eatIfPresent(less);

    // If we don't have a struct, then we have a random type alias, which we
    // accept for compatibility with old files.  These types are not allowed to be
    // forward referenced and not allowed to be recursive.
    if (lexer.getTokKind() != lbrace) {
      error(typeLoc, "forward references to non-struct type");
      resultTy.set(null);
      if (isPacked)
        return parseArrayVectorType(resultTy, true);
      return parseType(resultTy, false);
    }

    StructType sty = StructType.create(name);

    ArrayList<Type> body = new ArrayList<>();
    if (parseStructBody(body) ||
        (isPacked && parseToken(greater, "expected '>' in packed struct")))
      return true;

    sty.setBody(body, isPacked);
    resultTy.set(handleUpRefs(sty));
    return false;
  }

  /**
   * StructBody ::= '{' '}'
   *               '{' Type (',' Type)* '}'
   *               '<' '{' '}' '>'
   *               '<' '{' Type (',' Type)* '}' '<'
   * @param body
   * @return
   */
  private boolean parseStructBody(ArrayList<Type> body) {
    Util.assertion(lexer.getTokKind() == lbrace);
    lexer.lex();  // consume the '{'

    // handle the empty struct body
    if (eatIfPresent(rbrace))
      return false;

    SMLoc eleTyLoc = lexer.getLoc();
    OutRef<Type> ty = new OutRef<>();
    if (parseType(ty, false))
      return true;

    if (ty.get().equals(LLVMContext.VoidTy))
      return error(eleTyLoc, "struct element can not have void type");
    if (!StructType.isValidElementType(ty.get()))
      return error(eleTyLoc, "invalid element type for struct");

    body.add(ty.get());

    while (eatIfPresent(comma)) {
      ty.set(null);
      if (parseType(ty, false))
        return true;

      if (ty.get().equals(LLVMContext.VoidTy))
        return error(eleTyLoc, "struct element can not have void type");
      if (!StructType.isValidElementType(ty.get()))
        return error(eleTyLoc, "invalid element type for struct");

      body.add(ty.get());
    }

    return parseToken(rbrace, "expect a '}' at end of struct");
  }

  /**
   * ::= LocalVarID '=' 'type' type
   *
   * @return
   */
  private boolean parseUnnamedType() {
    int typeID = numberedTypes.size();
    // handle localVarID form.
    if (lexer.getTokKind() == LocalVarID) {
      if (lexer.getIntVal() != typeID)
        return tokError(String
            .format("type expected to be numbered '%d'", typeID));
      lexer.lex();

      if (parseToken(equal, "expected '=' after name"))
        return true;
    }
    Util.assertion(lexer.getTokKind() == kw_type);

    SMLoc typeLoc = lexer.getLoc();
    lexer.lex();

    OutRef<Type> result = new OutRef<>();
    if (parseType(result, false))
      return true;

    // see if this type was previously referenced.
    if (forwardRefTypeIDs.containsKey(typeID)) {
      Pair<Type, SMLoc> itr = forwardRefTypeIDs.get(typeID);
      if (!itr.first.equals(result.get()))
        return error(typeLoc, "self referential type is invalid");

      ((DerivedType) itr.first).refineAbstractTypeTo(result.get());
      result.set(itr.first);
      forwardRefTypeIDs.remove(typeID);
    }

    numberedTypes.add(result.get());
    return false;
  }

  /**
   * ::= 'deplibs' '=' '[' ']'
   * ::= 'deplibs' '=' '[' STRINGCONSTANT (',' STRINGCONSTANT)* ']'
   * FIXME: Remove in 4.0. Currently parse, but ignore.
   *
   * @return
   */
  private boolean parseDepLibs() {
    if (parseToken(equal, "expected '=' after 'deplibs'"))
      return true;
    if (eatIfPresent(lsquare)) {
      if (lexer.getTokKind() == rsquare)
        return false;   // empty list

      OutRef<String> str = new OutRef<>();
      if (parseStringConstant(str))
        return true;
      while (eatIfPresent(comma)) {
        if (parseStringConstant(str))
          return true;
      }
      if (eatIfPresent(rsquare))
        return true;
    } else
      return tokError("missing '[' after '='");

    return false;
  }

  /**
   * ::= 'target' 'triple' '=' STRINGCONSTANT
   * ::= 'target' 'datalayout' '=' STRINGCONSTANT
   *
   * @return
   */
  private boolean parseTargetDefinition() {
    Util.assertion(lexer.getTokKind() == kw_target);

    OutRef<String> str = new OutRef<>();
    boolean tripleOrDataLayout = true;
    lexer.lex();    // eat 'target'

    switch (lexer.getTokKind()) {
      default:
        return tokError("unknown target property");
      case kw_triple:
        tripleOrDataLayout = true;
        break;
      case kw_datalayout:
        tripleOrDataLayout = false;
        break;
    }
    lexer.lex();
    if (parseToken(equal, "expected '=' after 'triple'")
        || parseStringConstant(str))
      return true;

    if (tripleOrDataLayout)
      m.setTargetTriple(str.get());
    else
      m.setDataLayout(str.get());
    return false;
  }

  /**
   * ::= 'constant'
   * ::= 'global'
   *
   * @param isConstant
   * @return
   */
  private boolean parseGlobalType(OutRef<Boolean> isConstant) {
    LLTokenKind tok = lexer.getTokKind();
    switch (tok) {
      case kw_constant:
        isConstant.set(true);
        break;
      case kw_global:
        isConstant.set(false);
        break;
      default:
        isConstant.set(false);
        return tokError("expected 'global' or 'constant'");
    }
    lexer.lex();
    return false;
  }

  private boolean parseGlobal(String name,
                              SMLoc nameLoc,
                              LinkageType linkage,
                              boolean hasLinkage,
                              VisibilityTypes visibility) {
    OutRef<Integer> val = new OutRef<>(0);
    OutRef<Boolean> val2 = new OutRef<>(false);
    OutRef<Boolean> val3 = new OutRef<>(false);
    OutRef<SMLoc> tmpLoc = new OutRef<>(null);

    OutRef<Type> ty = new OutRef<>();
    OutRef<Boolean> unnamedAddr = new OutRef<>(false);
    OutRef<SMLoc> unnamedAddrLoc = new OutRef<>();

    if (parseOptionalToken(kw_thread_local, val2) ||
        parseOptionalAddrSpace(val) ||
        parseOptionalToken(kw_unnamed_addr, unnamedAddr, unnamedAddrLoc) ||
        parseGlobalType(val3) ||
        parseType(ty, tmpLoc, false))
      return true;

    OutRef<Constant> c = new OutRef<>(null);
    if (!hasLinkage || (linkage != LinkageType.ExternalLinkage)) {
      if (parseGlobalValue(ty.get(), c))
        return true;
    }

    backend.type.Type globalTy = ty.get();
    int addrSpace = val.get();
    boolean threadLocal = val2.get();
    SMLoc tyLoc = tmpLoc.get();
    Constant init = c.get();
    boolean isConstant = val3.get();

    if (globalTy instanceof FunctionType || globalTy.equals(LLVMContext.LabelTy)) {
      return error(tyLoc, "invalid type for global variable");
    }
    GlobalVariable gv = null;
    // See if the global was forward referenced, if so, use the global.
    if (name != null && !name.isEmpty()) {
      if ((gv = m.getGlobalVariable(name, true)) != null) {
        forwardRefVals.remove(name);
      }
    } else {
      if (forwardRefValIDs.containsKey(numberedVals.size())) {
        Pair<GlobalValue, SMLoc> itr = forwardRefValIDs.get(numberedVals.size());
        gv = (GlobalVariable) itr.first;
        forwardRefValIDs.remove(numberedVals.size());
      }
    }

    if (gv == null) {
      gv = new GlobalVariable(m, globalTy, false, LinkageType.ExternalLinkage,
          null, name, null, addrSpace);
    } else {
      if (!gv.getType().getElementType().equals(globalTy))
        return error(tyLoc,
            "forward reference and definition of global have different types");
    }

    if (name == null || name.isEmpty())
      numberedVals.add(gv);

    if (init != null)
      gv.setInitializer(init);

    gv.setConstant(isConstant);
    gv.setLinkage(linkage);
    gv.setVisibility(visibility);
    gv.setThreadLocal(threadLocal);

    while (lexer.getTokKind() == comma) {
      lexer.lex();

      if (lexer.getTokKind() == kw_section) {
        lexer.lex();
        gv.setSection(lexer.getStrVal());
        if (parseToken(StringConstant, "expected global section string"))
          return true;
      } else if (lexer.getTokKind() == kw_align) {
        OutRef<Integer> align = new OutRef<>();
        if (parseOptionalAlignment(align))
          return true;
        gv.setAlignment(align.get());
      } else {
        tokError("unknown global variable property");
      }
    }
    return false;
  }

  private boolean parseOptionalToken(LLTokenKind kind,
                                     OutRef<Boolean> present,
                                     OutRef<SMLoc> loc) {
    if (lexer.getTokKind() != kind)
      present.set(false);
    else {
      if (loc != null)
        loc.set(lexer.getLoc());

      lexer.lex();
      present.set(true);
    }
    return false;
  }

  private boolean parseOptionalToken(LLTokenKind kind,
                                     OutRef<Boolean> present) {
    return parseOptionalToken(kind, present, null);
  }

  /**
   * Top-level entity ::= 'declare' FunctionHeader
   *
   * @return
   */
  private boolean parseDeclare() {
    Util.assertion(lexer.getTokKind() == LLTokenKind.kw_declare);
    lexer.lex();

    OutRef<Function> f = new OutRef<>();
    return parseFunctionHeader(f, false);
  }

  /**
   * FunctionHeader ::= OptionalLinkage OptionalVisibility OptionalCallingConvetion OptRetAttrs
   * Type GlobalName '(' ArgList ')' OptFuncAttrs
   * OptSection OptionalAlign OptGC
   *
   * @param f        The parsed declaration of function.
   * @param isDefine
   * @return
   */
  private boolean parseFunctionHeader(OutRef<Function> f, boolean isDefine) {
    // parse linkage
    SMLoc linkageLoc = lexer.getLoc();
    OutRef<LinkageType> linkage = new OutRef<>();
    OutRef<VisibilityTypes> visibility = new OutRef<>();
    OutRef<CallingConv> cc = new OutRef<>();
    OutRef<Type> resultTy = new OutRef<>();

    SMLoc retTypeLoc = lexer.getLoc();
    OutRef<Integer> retAttrs = new OutRef<>();
    if (parseOptionalLinkage(linkage) || parseOptionalVisibility(visibility)
        || parseCallingConv(cc) || parseOptionalAttrs(retAttrs, 1)
        || parseType(resultTy, true/*void allowed*/))
      return false;

    // verify the linkage is fine
    switch (linkage.get()) {
      case ExternalLinkage:
        break;
      case InternalLinkage:
      case PrivateLinkage:
      case LinkerPrivateLinkage:
        if (!isDefine)
          return error(linkageLoc,
              "invalid linkage for function declaration");
        break;
      case CommonLinkage:
        return error(linkageLoc, "invalid function linkage type");
    }

    if (!FunctionType.isValidReturnType(resultTy.get()) || resultTy.get() instanceof OpaqueType)
      return error(retTypeLoc, "invalid function return type");

    SMLoc nameLoc = lexer.getLoc();

    String functionName = null;
    if (lexer.getTokKind() == GlobalVar) {
      functionName = lexer.getStrVal();
    } else if (lexer.getTokKind() == GlobalID) // @1 is file.
    {
      int nameID = lexer.getIntVal();
      if (nameID != numberedVals.size()) {
        return tokError(
            "function expected to be numbered '%" + numberedVals.size() + "'");
      }
    } else {
      return tokError("expected function name");
    }

    lexer.lex();

    if (lexer.getTokKind() != lparen) {
      return tokError("expected '(' in function argument list");
    }

    ArrayList<ArgInfo> argList = new ArrayList<>();
    OutRef<Boolean> isVarArg = new OutRef<>(false);
    OutRef<Integer> funcAttrs = new OutRef<>(0);
    OutRef<String> section = new OutRef<>("");
    OutRef<Integer> alignment = new OutRef<>(0);
    OutRef<String> gc = new OutRef<>("");

    if (parseArgumentList(argList, isVarArg, false) || parseOptionalAttrs(
        funcAttrs, 2) || (eatIfPresent(kw_section) && parseStringConstant(section)) || parseOptionalAlignment(
        alignment) || (eatIfPresent(kw_gc) && parseStringConstant(gc))) {
      return true;
    }

    boolean isVariadic = isVarArg.get();
    int functionAttrs = funcAttrs.get();
    String sec = section.get();
    int align = alignment.get();
    String gcInfo = gc.get();

    if ((functionAttrs & Attribute.Alignment) != 0) {
      align = Attribute.getAlignmentFromAttrs(funcAttrs.get());
      functionAttrs &= ~Attribute.Alignment;
    }

    ArrayList<Type> paramTypeList = new ArrayList<>();
    ArrayList<AttributeWithIndex> attrs = new ArrayList<>();

    int obsoleteFuncAttrs = Attribute.ZExt | Attribute.SExt | Attribute.InReg;
    if ((functionAttrs & obsoleteFuncAttrs) != 0) {
      retAttrs.set(functionAttrs & obsoleteFuncAttrs);
      functionAttrs &= ~obsoleteFuncAttrs;
    }

    if (retAttrs.get() != Attribute.None) {
      attrs.add(AttributeWithIndex.get(0, retAttrs.get()));
    }

    int i = 0;
    for (ArgInfo ai : argList) {
      paramTypeList.add(ai.type);
      if (ai.attr != Attribute.None) {
        attrs.add(AttributeWithIndex.get(i + 1, ai.attr));
      }
      ++i;
    }

    if (functionAttrs != Attribute.None) {
      attrs.add(AttributeWithIndex.get(~0, functionAttrs));
    }

    AttrList alist = new AttrList(attrs);

    if (alist.paramHasAttr(1, Attribute.StructRet) && !resultTy.get().equals(LLVMContext.VoidTy)) {
      return error(retTypeLoc,
          "function with 'sret' argument must return void");
    }

    FunctionType ft = FunctionType
        .get(resultTy.get(), paramTypeList, isVariadic);
    PointerType ptr = PointerType.getUnqual(ft);

    Function fn = null;
    if (functionName != null && !functionName.isEmpty()) {
      if (forwardRefVals.containsKey(functionName)) {
        // If this was a definition of a forward reference, remove the definition
        // from the forward reference table and fill in the forward ref.
        fn = (Function) forwardRefVals.get(functionName).first;
        forwardRefVals.remove(functionName);
      } else if ((fn = m.getFunction(functionName)) != null) {
        // If this function already exists in the symbol table, then it is
        // multiply defined.  We accept a few cases for old backwards compat.
        // FIXME: Remove this stuff for LLVM 3.0.

        if (!fn.getType().equals(ptr) || !fn.getAttributes().equals(alist) || (!fn.isDeclaration() && isDefine)) {
          // If the redefinition has different type or different attributes,
          // reject it.  If both have bodies, reject it.
          return error(nameLoc,
              "invalid redefinition of function '" + functionName
                  + "'");
        } else if (fn.isDeclaration()) {
          // Make sure to strip off any argument names so we can't get conflicts.
          for (Function func : m.getFunctionList())
            func.setName("");
        }
      }
    } else {
      // if the name of function is empty
      if (forwardRefValIDs.containsKey(numberedVals.size())) {
        fn = (Function) forwardRefValIDs.get(numberedVals.size()).first;
        if (!fn.getType().equals(ptr)) {
          return error(nameLoc,
              "type of definition and forward reference" + " of '@" + numberedVals.size()
                  + "' disagree");
        }
        forwardRefValIDs.remove(numberedVals.size());
      }
    }

    if (fn == null)
      fn = new Function(ft, LinkageType.ExternalLinkage, functionName, m);
    else
      m.addFunction(fn);

    if (functionName == null || functionName.isEmpty())
      numberedVals.add(fn);

    fn.setLinkage(linkage.get());
    fn.setVisibility(visibility.get());
    fn.setCallingConv(cc.get());
    fn.setAttributes(alist);
    fn.setAlignment(align);
    fn.setSection(sec);
    // allowed GC but ignore it.

    ArrayList<Argument> fnArgs = fn.getArgumentList();
    int idx = 0;
    // All of arguments we parsed to the function.
    for (ArgInfo ai : argList) {
      ++idx;
      if (ai.name == null || ai.name.isEmpty())
        continue;

      fnArgs.get(idx-1).setName(ai.name);
    }

    f.set(fn);
    return false;
  }

  private boolean parseOptionalLinkage(OutRef<LinkageType> linkage) {
    OutRef<Boolean> hasLinkage = new OutRef<>();
    return parseOptionalLinkage(linkage, hasLinkage);
  }

  /**
   * ParseOptionalLinkage
   * ///   ::= empty
   * ///   ::= 'private'
   * ///   ::= 'linker_private'
   * ///   ::= 'internal'
   * ///   ::= 'weak'
   * ///   ::= 'weak_odr'
   * ///   ::= 'linkonce'
   * ///   ::= 'linkonce_odr'
   * ///   ::= 'appending'
   * ///   ::= 'dllexport'
   * ///   ::= 'common'
   * ///   ::= 'dllimport'
   * ///   ::= 'extern_weak'
   * ///   ::= 'external'
   */
  private boolean parseOptionalLinkage(OutRef<LinkageType> linkage,
                                       OutRef<Boolean> hasLinkage) {
    hasLinkage.set(false);
    switch (lexer.getTokKind()) {
      default:
        linkage.set(LinkageType.ExternalLinkage);
        return false;
      case kw_private:
        linkage.set(LinkageType.PrivateLinkage);
        break;
      case kw_linker_private:
        linkage.set(LinkageType.LinkerPrivateLinkage);
        break;
      case kw_internal:
        linkage.set(LinkageType.InternalLinkage);
        break;
      case kw_weak:
      case kw_weak_odr:
      case kw_linkonce:
      case kw_linkonce_odr:
      case kw_available_externally:
      case kw_appending:
      case kw_dllexport:
      case kw_dllimport:
      case kw_extern_weak:
        Util.assertion("Unsupported linkage type 'weak'");
        break;
      case kw_external:
        linkage.set(LinkageType.ExternalLinkage);
        break;
      case kw_common:
        linkage.set(LinkageType.CommonLinkage);
        break;
    }
    lexer.lex();
    hasLinkage.set(true);
    return false;
  }

  private boolean parseOptionalVisibility(OutRef<VisibilityTypes> visibility) {
    switch (lexer.getTokKind()) {
      default:
        visibility.set(VisibilityTypes.DefaultVisibility);
        return false;
      case kw_default:
        visibility.set(VisibilityTypes.DefaultVisibility);
        break;
      case kw_hidden:
        visibility.set(VisibilityTypes.HiddenVisibility);
        break;
      case kw_protected:
        visibility.set(VisibilityTypes.ProtectedVisibility);
        break;
    }
    lexer.lex();
    return false;
  }

  /**
   * CallingConvention
   * ///   ::= empty
   * ///   ::= 'ccc'
   * ///   ::= 'fastcc'
   * ///   ::= 'coldcc'
   * ///   ::= 'x86_stdcallcc'
   * ///   ::= 'x86_fastcallcc'
   * ///   ::= 'arm_apcscc'
   * ///   ::= 'arm_aapcscc'
   * ///   ::= 'arm_aapcs_vfpcc'
   * ///   ::= 'cc' UINT
   *
   * @param cc
   * @return
   */
  private boolean parseCallingConv(OutRef<CallingConv> cc) {
    switch (lexer.getTokKind()) {
      default:
        cc.set(CallingConv.C);
        return false;
      case kw_fastcc:
        cc.set(CallingConv.Fast);
        break;
      case kw_coldcc:
        cc.set(CallingConv.Cold);
        break;
      case kw_x86_fastcallcc:
        cc.set(CallingConv.X86_FastCall);
        break;
      case kw_x86_stdcallcc:
        cc.set(CallingConv.X86_StdCall);
        break;
    }
    lexer.lex();
    return false;
  }

  private boolean eatIfPresent(LLTokenKind kind) {
    if (lexer.getTokKind() != kind)
      return false;
    lexer.lex();
    return true;
  }

  private boolean parseOptionalAlignment(OutRef<Integer> align) {
    if (!eatIfPresent(LLTokenKind.kw_align))
      return false;

    SMLoc alignLoc = lexer.getLoc();
    if (parseInt32(align))
      return true;
    if (!Util.isPowerOf2(align.get()))
      return error(alignLoc, "alignment is not power of 2");
    return false;
  }

  private boolean parseInt32(OutRef<Integer> align) {
    if (lexer.getTokKind() != LLTokenKind.APSInt || lexer.getAPsIntVal().isSigned())
      return tokError("expected integer");
    long intVal = lexer.getAPsIntVal().getLimitedValue(0xFFFFFFFFL + 1);
    if (intVal != (int) intVal) {
      return tokError("expected 32 bit integer(too large)");
    }
    align.set((int) intVal);
    lexer.lex();
    return false;
  }

  /**
   * ParseOptionalCommaAlign
   * <pre>
   *  ::=
   *  ::= ',' align 4
   * </pre>
   * This returns with AteExtraComma set to true if it ate an excess comma at the
   * end.
   *
   * @param align
   * @param ateExtraComma
   * @return
   */
  private boolean parseOptionalCommaAlign(OutRef<Integer> align,
                                          OutRef<Boolean> ateExtraComma) {
    if (lexer.getTokKind() != LLTokenKind.comma)
      return false;

    ateExtraComma.set(false);
    while (eatIfPresent(comma)) {
      // metadata at the end of is an early exit
      if (lexer.getTokKind() == MetadataVar) {
        ateExtraComma.set(true);
        return false;
      }

      if (lexer.getTokKind() != kw_align)
        return error(lexer.getLoc(), "expected metadata or 'align'");

      if (parseOptionalAlignment(align))
        return true;
    }
    return false;
  }

  private boolean parseToken(LLTokenKind expectToken, String errorMsg) {
    if (lexer.getTokKind() != expectToken)
      return tokError(errorMsg);
    lexer.lex();
    return false;
  }

  private boolean parseStringConstant(OutRef<String> result) {
    if (lexer.getTokKind() != LLTokenKind.StringConstant)
      return false;
    result.set(lexer.getStrVal());
    lexer.lex();
    return false;
  }

  private boolean parseIndexList(TIntArrayList indices) {
    if (lexer.getTokKind() != LLTokenKind.comma)
      return tokError("expected ',' as start of index list");

    OutRef<Integer> index = new OutRef<>(0);
    while (eatIfPresent(LLTokenKind.comma)) {
      if (parseInt32(index))
        return true;
      indices.add(index.get());
    }
    return false;
  }

  /**
   * Parse a potentially empty attribute list.  AttrKind
   * indicates what kind of attribute list this is: 0: function arg, 1: result,
   * 2: function attr.
   * 3: function arg after value: FIXME: REMOVE IN LLVM 3.0
   *
   * @param attrs
   * @return
   */
  private boolean parseOptionalAttrs(OutRef<Integer> attrs, int attrKind) {
    int attr = Attribute.None;
    SMLoc attrLoc = lexer.getLoc();

    while (true) {
      switch (lexer.getTokKind()) {
        case kw_sext:
        case kw_zext:
          if (attrKind == 3) {
            if (lexer.getTokKind() == kw_sext)
              attr |= Attribute.SExt;
            else
              attr |= Attribute.ZExt;
            break;
          }
          // fall through
        default:
          if (attrKind != 2 && (attr & Attribute.FunctionOnly) != 0)
            return error(attrLoc,
                "invalid use of function-only attribute");
          if (attrKind != 0 && attrKind != 3
              && (attr & Attribute.ParameterOnly) != 0)
            return error(attrLoc,
                "invalid use of parameter-only attribute");

          attrs.set(attr);
          return false;
        case kw_zeroext:
          attr |= Attribute.ZExt;
          break;
        case kw_signext:
          attr |= Attribute.SExt;
          break;
        case kw_inreg:
          attr |= Attribute.InReg;
          break;
        case kw_sret:
          attr |= Attribute.StructRet;
          break;
        case kw_noalias:
          attr |= Attribute.NoAlias;
          break;
        case kw_nocapture:
          attr |= Attribute.NoCapture;
          break;
        case kw_byval:
          attr |= Attribute.ByVal;
          break;
        case kw_nest:
          attr |= Attribute.Nest;
          break;
        case kw_noreturn:
          attr |= Attribute.NoReturn;
          break;
        case kw_nounwind:
          attr |= Attribute.NoUnwind;
          break;
        case kw_uwtable:
          attr |= Attribute.UWTable;
          break;
        case kw_noinline:
          attr |= Attribute.NoInline;
          break;
        case kw_readnone:
          attr |= Attribute.ReadNone;
          break;
        case kw_readonly:
          attr |= Attribute.ReadOnly;
          break;
        case kw_inlinehint:
          attr |= Attribute.InlineHint;
          break;
        case kw_alwaysinline:
          attr |= Attribute.AlwaysInline;
          break;
        case kw_optsize:
          attr |= Attribute.OptimizeForSize;
          break;
        case kw_ssp:
          attr |= Attribute.StackProtect;
          break;
        case kw_sspreq:
          attr |= Attribute.StackProtectReq;
          break;
        case kw_noredzone:
          attr |= Attribute.NoRedZone;
          break;
        case kw_noimplicitfloat:
          attr |= Attribute.NoImplicitFloat;
          break;
        case kw_naked:
          attr |= Attribute.Naked;
          break;
        case kw_nonlazybind:
          attr |= Attribute.NonLazyBind;
          break;
        case kw_alignstack: {
          OutRef<Integer> alignment = new OutRef<>(0);
          if (parseOptionalStackAlignment(alignment))
            return true;
          attr |= Attribute.constructStackAlignmentFromInt(alignment.get());
          continue;
        }

        case kw_align: {
          OutRef<Integer> align = new OutRef<>(0);
          if (parseOptionalAlignment(align)) {
            attrs.set(attr);
            return true;
          }
          attr |= Attribute.constructAlignmentFromInt(align.get());
          continue;
        }
      }
      lexer.lex();
    }
  }

  /**
   * optionalStackAlignment ::=
   * /empty/
   * 'alignstack' '(' 4 ')'
   * @param alignment
   * @return
   */
  private boolean parseOptionalStackAlignment(OutRef<Integer> alignment) {
    alignment.set(0);
    if (!eatIfPresent(kw_alignstack))
      return false;
    SMLoc parentLoc = lexer.getLoc();
    if (!eatIfPresent(lparen))
      return error(parentLoc, "expected a '('");
    SMLoc alignLoc = lexer.getLoc();
    if (parseInt32(alignment))
      return true;
    parentLoc = lexer.getLoc();
    if (!eatIfPresent(rparen))
      return error(parentLoc, "expected a ')'");
    if (!Util.isPowerOf2(alignment.get()))
      return error(alignLoc, "stack alignment is not a power of two");
    return false;
  }

  private boolean parseType(OutRef<Type> result,
                            OutRef<SMLoc> loc) {
    return parseType(result, loc, false);
  }

  private boolean parseType(OutRef<Type> result,
                            OutRef<SMLoc> retLoc, boolean allowVoid) {
    retLoc.set(lexer.getLoc());
    return parseType(result, allowVoid);
  }

  private boolean parseType(OutRef<Type> result, boolean allowVoid) {
    SMLoc typeLoc = lexer.getLoc();
    if (parseTypeRec(result))
      return true;

    if (!upRefs.isEmpty())
      return error(upRefs.get(upRefs.size() - 1).loc,
          "invalid unresolved type upward reference");
    if (!allowVoid && result.get().equals(LLVMContext.VoidTy))
      return error(typeLoc, "void type only allowed for function results");
    return false;
  }

  private boolean parseTypeRec(OutRef<Type> result) {
    switch (lexer.getTokKind()) {
      default:
        return tokError("expected type");
      case Type:
        result.set(lexer.getTyVal());
        lexer.lex();
        break;
      case kw_opaque:
        result.set(OpaqueType.get());
        lexer.lex();
        break;
      case lbrace:
        if (parseAnonStructType(result, false))
          return true;
        break;
      case lsquare:
        lexer.lex();
        if (parseArrayVectorType(result, false))
          return true;
        break;
      case less:
        // Either vector or packed struct.
        lexer.lex();
        if (lexer.getTokKind() == LLTokenKind.lbrace) {
          if (parseAnonStructType(result, true) || parseToken(LLTokenKind.greater,
              "expected '>' at end of packed struct"))
            return true;
        } else if (parseArrayVectorType(result, true))
          return true;
        break;
      case LocalVar:
      case StringConstant:
        // TypeRec ::= %bar
        Type ty = m.getTypeByName(lexer.getStrVal());
        if (ty != null)
          result.set(ty);
        else {
          result.set(OpaqueType.get());
          forwardRefTypes.put(lexer.getStrVal(),
              Pair.get(result.get(), lexer.getLoc()));
          m.addTypeName(lexer.getStrVal(), result.get());
        }
        lexer.lex();
        break;
      case LocalVarID:
        // TypeRec ::= %4
        int typeId = lexer.getIntVal();
        if (typeId < numberedTypes.size())
          result.set(numberedTypes.get(typeId));
        else {
          if (forwardRefTypeIDs.containsKey(typeId)) {
            result.set(forwardRefTypeIDs.get(typeId).first);
          } else {
            result.set(OpaqueType.get());
            forwardRefTypeIDs.put(typeId,
                Pair.get(result.get(), lexer.getLoc()));
          }
        }
        lexer.lex();
        break;
      case backslash:
        // TypeRec ::= '\' 4
        lexer.lex();
        OutRef<Integer> val = new OutRef<>(0);
        if (parseInt32(val))
          return true;
        OpaqueType ot = OpaqueType.get();
        upRefs.add(new UpRefRecord(lexer.getLoc(), val.get(), ot));
        result.set(ot);
        break;
    }

    // parse type suffixes.
    while (true) {
      switch (lexer.getTokKind()) {
        // end of type
        default:
          return false;

        // TypeRec ::= TypeRec '*'
        case star:
          if (result.get().equals(LLVMContext.LabelTy))
            return tokError("basic block pointers are invalid");
          if (result.get().equals(LLVMContext.VoidTy))
            return tokError(
                "pointers to void are invalid, use i8* instead");
          if (!PointerType.isValidElementType(result.get()))
            return tokError("pointer to this type is invalid");
          result.set(handleUpRefs(PointerType.getUnqual(result.get())));
          lexer.lex();
          break;
        case kw_addrspace:
          // TypeRec ::= TypeRec 'addrspace' '(' uint32 ')' '*'
          if (result.get().equals(LLVMContext.LabelTy))
            return tokError("basic block pointers are invalid");
          if (result.get().equals(LLVMContext.VoidTy))
            return tokError(
                "pointers to void are invalid, use i8* instead");
          if (!PointerType.isValidElementType(result.get()))
            return tokError("pointer to this type is invalid");

          OutRef<Integer> addrSpace = new OutRef<>(0);
          if (parseOptionalAddrSpace(addrSpace) || parseToken(star,
              "expected '*' in address space"))
            return true;

          result.set(handleUpRefs(
              PointerType.get(result.get(), addrSpace.get())));
          lexer.lex();
          break;
        case lparen:
          // Types '(' ArgTypeListI ')' OptFuncAttrs
          if (parseFunctionType(result))
            return true;
          break;
      }
    }
  }

  /**
   * AddressSpace ::= /empty/
   * 'addrspace' '(' uint32 ')'
   *
   * @param addrSpace
   * @return
   */
  private boolean parseOptionalAddrSpace(OutRef<Integer> addrSpace) {
    if (!eatIfPresent(kw_addrspace))
      return false;

    return parseToken(lparen, "expected '(' in address space")
        || parseInt32(addrSpace) || parseToken(rparen,
        "expected ')' in address space");
  }

  private static class ArgInfo {
    SMLoc loc;
    Type type;
    int attr;
    String name;

    public ArgInfo(SMLoc loc, Type ty, int attr, String name) {
      this.loc = loc;
      this.type = ty;
      this.attr = attr;
      this.name = name;
    }
  }

  private boolean parseFunctionType(OutRef<Type> result) {
    Util.assertion(lexer.getTokKind() == lparen);

    if (!FunctionType.isValidArgumentType(result.get()))
      return tokError("invalid function return type");

    ArrayList<ArgInfo> argList = new ArrayList<>();
    OutRef<Boolean> isVarArg = new OutRef<>();
    OutRef<Integer> attrs = new OutRef<>(0);
    if (parseArgumentList(argList, isVarArg, true) || parseOptionalAttrs(
        attrs, 2)) {
      // FIXME: Allow, but ignore attributes on function types!
      // FIXME: Remove in LLVM 3.0
      return true;
    }

    // reject name on the argument lists.
    for (ArgInfo ai : argList) {
      if (!ai.name.isEmpty()) {
        return error(ai.loc, "argument name invalid in function type");
      }
      if (ai.attr == 0) {
        // allow but ignore attributes on function types; this permits
        // auto-upgrade.
        // FIXME reject attributes on function argument in LLVM 3.0
      }
    }

    ArrayList<Type> argListTy = new ArrayList<>();
    argListTy.addAll(argList.stream().map(x -> x.type).collect(Collectors.toList()));

    result.set(handleUpRefs(
        FunctionType.get(result.get(), argListTy, isVarArg.get())));
    return false;
  }

  /**
   * Parse the argument list in function declaration of LLVM IR as follows.
   * <pre>
   * ArgList::= 'empty'
   *            '...'
   *            'ArgListEnt[,...]'
   * ArgListEnt::= 'Arg' (', Arg')*
   * </pre>
   *
   * @param argList
   * @param isVarArg
   * @param inType
   * @return
   */
  private boolean parseArgumentList(ArrayList<ArgInfo> argList,
                                    OutRef<Boolean> isVarArg, boolean inType) {
    isVarArg.set(false);
    Util.assertion(lexer.getTokKind() == lparen);
    lexer.lex();    // eat the '('
    if (lexer.getTokKind() == rparen) {
      // empty argument list.
    } else if (lexer.getTokKind() == dotdotdot) {
      isVarArg.set(true);
      lexer.lex();    // eat the '...'
    } else {
      SMLoc typeLoc = lexer.getLoc();
      String name = "";
      OutRef<Integer> attr = new OutRef<>();
      OutRef<backend.type.Type> argTy = new OutRef<>();
      if ((inType ? parseTypeRec(argTy) : parseType(argTy, false))
          || parseOptionalAttrs(attr, 0))
        return true;

      if (argTy.get().equals(LLVMContext.VoidTy))
        return error(typeLoc, "argument can not have void type");

      if (lexer.getTokKind() == LocalVar
          || lexer.getTokKind() == StringConstant) {
        name = lexer.getStrVal();
        lexer.lex();
      }

      if (!FunctionType.isValidArgumentType(argTy.get()))
        return error(typeLoc, "invalid type for function argument");

      argList.add(new ArgInfo(typeLoc, argTy.get(), attr.get(), name));
      while (eatIfPresent(comma)) {
        // handle '...' at end of argument list.
        if (lexer.getTokKind() == dotdotdot) {
          isVarArg.set(true);
          lexer.lex();
          break;
        }

        // otherwise must be an argument type.
        typeLoc = lexer.getLoc();
        if ((inType ? parseTypeRec(argTy) : parseType(argTy, false))
            || parseOptionalAttrs(attr, 0))
          return true;

        if (argTy.get().equals(LLVMContext.VoidTy))
          return error(typeLoc, "argument can not have void type");

        if (lexer.getTokKind() == LocalVar
            || lexer.getTokKind() == StringConstant) {
          name = lexer.getStrVal();
          lexer.lex();
        } else
          name = "";

        if (!argTy.get().isFirstClassType() && !(argTy.get() instanceof OpaqueType))
          return error(typeLoc, "invalid type for function argument");

        argList.add(new ArgInfo(typeLoc, argTy.get(), attr.get(), name));
      }
    }
    return parseToken(rparen, "expected ')' at end of argument list");
  }

  /**
   * Parse anonymous struct definiton as following.
   * %1 = call {i64, i1} memcpy(...)
   * @param result
   * @param packed
   * @return
   */
  private boolean parseAnonStructType(OutRef<Type> result, boolean packed) {
    ArrayList<Type> body = new ArrayList<>();
    if (parseStructBody(body))
      return true;

    result.set(StructType.get(body, packed));
    return false;
  }

  private Type handleUpRefs(Type ty) {
    if (!ty.isAbstract() || upRefs.isEmpty())
      return ty;

    OpaqueType typeToResolve = null;

    for (int i = 0, e = upRefs.size(); i < e; i++) {
      boolean containedType = false;
      for (int j = 0, sz = ty.getNumContainedTypes(); j < sz; j++) {
        if (upRefs.get(i).lastContainedTy.equals(ty.getContainedType(j))) {
          containedType = true;
          break;
        }
      }
      if (!containedType)
        continue;

      int level = --upRefs.get(i).nestedLevel;
      upRefs.get(i).lastContainedTy = ty;

      if (level != 0)
        continue;
      if (typeToResolve == null)
        typeToResolve = upRefs.get(i).upRefTy;
      else
        upRefs.get(i).upRefTy.refineAbstractTypeTo(typeToResolve);
      upRefs.remove(i);
      --i;
      --e;
    }
    if (typeToResolve != null)
      typeToResolve.refineAbstractTypeTo(ty);
    return ty;
  }

  /**
   * <pre>
   * TypeRec
   *  ::= '[' APSINTVAL 'x' Types ']'
   *  ::= '<' APSINTVAL 'x' Types '>'
   * </pre>
   *
   * @param result
   * @param isVector
   * @return
   */
  private boolean parseArrayVectorType(OutRef<Type> result, boolean isVector) {
    if (lexer.getTokKind() != APSInt || lexer.getAPsIntVal().isSigned()
        || lexer.getAPsIntVal().getBitWidth() > 64)
      return tokError("expected number in address space");

    SMLoc sizeLoc = lexer.getLoc();
    long size = lexer.getAPsIntVal().getZExtValue();
    lexer.lex();

    if (parseToken(kw_x, "expected 'x' after element count"))
      return true;

    SMLoc typeLoc = lexer.getLoc();
    OutRef<Type> eltTy = new OutRef<>(LLVMContext.VoidTy);
    if (parseTypeRec(eltTy))
      return error(typeLoc, "array and vector element type can't be void");

    if (parseToken(isVector ? greater : rsquare,
        "expected end of sequential type"))
      return true;

    if (isVector) {
      if (size == 0)
        return error(sizeLoc, "zero element vector is illegal");
      if ((int) size != size)
        return error(sizeLoc, "size too large for vector");
      return error(sizeLoc, "Currently, vector type is not supported");
    } else {
      if (!ArrayType.isValidElementType(eltTy.get()))
        return error(typeLoc, "invalid array element type");
      result.set(handleUpRefs(ArrayType.get(eltTy.get(), (int) size)));
    }
    return false;
  }

  /**
   * Top-level entity
   * ::= 'define' FunctionHeader '{' ... '}'
   *
   * @return
   */
  private boolean parseDefine() {
    Util.assertion(lexer.getTokKind() == kw_define);
    lexer.lex();    // eat the 'define'
    OutRef<Function> f = new OutRef<>();
    return parseFunctionHeader(f, true) || parseFunctionBody(f);
  }

  /**
   * <pre>
   * Function ::=
   *          '{' BasicBlock+ '}'
   *          'begin' BasicBlock+ 'end' // FIXME removed in LLVM 3.0
   * </pre>
   *
   * @param f
   * @return
   */
  private boolean parseFunctionBody(OutRef<Function> f) {
    if (lexer.getTokKind() != lbrace) {
      return tokError("expected '{' in function body");
    }
    lexer.lex();

    PerFunctionState fs = new PerFunctionState(this, f.get());
    while (lexer.getTokKind() != rbrace)
      if (parseBasicBlock(fs))
        return true;

    // eat the '}'
    lexer.lex();
    return fs.verifyFunctionComplete();
  }

  /**
   * <pre>
   *     BasicBlock ::=
   *                  LocalStr ? Instruction*
   * </pre>
   *
   * @param pfs
   * @return
   */
  private boolean parseBasicBlock(PerFunctionState pfs) {
    String name = "";
    SMLoc nameLoc = lexer.getLoc();
    if (lexer.getTokKind() == LabelStr) {
      name = lexer.getStrVal();
      lexer.lex();    // eat the name.
    }

    BasicBlock bb = pfs.defineBB(name, nameLoc);
    if (bb == null)
      return false;

    pfs.getFunction().addBasicBlock(bb);
    // Parse the instructions in this block until we get a terminator.
    String nameStr;

    OutRef<Instruction> inst = new OutRef<>();
    do {
      // This instruction may have three possibilities for a name: a) none
      // specified, b) name specified "%foo =", c) number specified: "%4 =".
      nameLoc = lexer.getLoc();
      int nameID = -1;
      nameStr = "";

      if (lexer.getTokKind() == LocalVarID) {
        nameID = lexer.getIntVal();
        lexer.lex();
        if (parseToken(equal, "expected '=' after instruction id"))
          return true;
      } else if (lexer.getTokKind() == LocalVar || lexer.getTokKind() == StringConstant) {
        nameStr = lexer.getStrVal();
        lexer.lex();
        if (parseToken(equal, "expected '=' after instruction id"))
          return true;
      }

      OutRef<Boolean> needConsiderComma = new OutRef<>(false);
      if (parseInstruction(inst, pfs, needConsiderComma))
        return true;
      else {
        bb.appendInst(inst.get());

        // With a normal result, we check to see if the instruction is followed by
        // a comma and metadata.
        if (needConsiderComma.get() || eatIfPresent(comma)) {
          if (parseInstructionMetadata(inst.get(), pfs))
            return true;
        }
      }

      // set the name of the instruction.
      if (pfs.setInstName(nameID, nameStr, nameLoc, inst.get()))
        return true;
    } while (!(inst.get() instanceof TerminatorInst));
    return false;
  }

  //===----------------------------------------------------------------------===//
  // Instruction Parsing.
  //===----------------------------------------------------------------------===//

  /**
   * Parse one of the many different instructions.
   *
   * @param inst
   * @param pfs
   * @return
   */
  private boolean parseInstruction(OutRef<Instruction> inst,
                                   PerFunctionState pfs,
                                   OutRef<Boolean> needConsiderComma) {
    LLTokenKind kind = lexer.getTokKind();
    if (kind == Eof)
      return tokError("found end of file when expecting more instructions");

    SMLoc loc = lexer.getLoc();
    Operator opc = parseOperator(kind);
    lexer.lex();    // eat keyword token.

    switch (kind) {
      default:
        return error(loc, "expected instruction");
      case kw_unwind:
        inst.set(new UnWindInst());
        return false;
      case kw_invoke:
        return tokError("currently, invoke is not supported");
      case kw_indirectbr:
        return tokError("currently, indirectbr is not supported");
      case kw_unreachable:
        inst.set(new UnreachableInst());
        return false;
      case kw_ret:
        return parseRet(inst, pfs);
      case kw_br:
        return parseBr(inst, pfs);
      case kw_switch:
        return parseSwitch(inst, pfs);
      case kw_add:
      case kw_sub:
      case kw_mul:
      case kw_shl: {
        boolean nuw = false;
        boolean nsw = false;
        SMLoc modifierLoc = lexer.getLoc();
        if (eatIfPresent(kw_nuw))
          nuw = true;
        if (eatIfPresent(kw_nsw)) {
          nsw = true;
          if (eatIfPresent(kw_nuw))
            nuw = true;
        }
        // API compatibility: Accept either integer or floating-point types.
        boolean result = parseArithmetic(inst, pfs, opc, 0);
        if (!result) {
          if (!inst.get().getType().isInteger()) {
            if (nuw)
              return error(modifierLoc,
                  "nuw only applies to integer operation");
            if (nsw)
              return error(modifierLoc,
                  "nsw only applies to integer operation");
          }
          // Allow nsw and nuw, but ignores it.
          ((BinaryOps)inst.get()).setHasNoUnsignedWrap(true);
          ((BinaryOps)inst.get()).setHasNoSignedWrap(true);
        }
        return result;
      }
      case kw_fadd:
      case kw_fsub:
      case kw_fmul:
        return parseArithmetic(inst, pfs, opc, 2);
      case kw_sdiv:
      case kw_udiv:
      case kw_lshr:
      case kw_ashr: {
        boolean exact = false;
        if (eatIfPresent(kw_exact))
          exact = true;
        if (parseArithmetic(inst, pfs, opc, 1))
          return true;
        if (exact)
          ((BinaryOps)inst.get()).setIsExact(true);
        return false;
      }
      case kw_urem:
      case kw_srem:
        return parseArithmetic(inst, pfs, opc, 1);
      case kw_fdiv:
      case kw_frem:
        return parseArithmetic(inst, pfs, opc, 2);
      case kw_and:
      case kw_or:
      case kw_xor:
        return parseLogical(inst, pfs, opc);
      case kw_icmp:
      case kw_fcmp:
        return parseCompare(inst, pfs, opc);
      // Casts.
      case kw_trunc:
      case kw_zext:
      case kw_sext:
      case kw_fptrunc:
      case kw_fpext:
      case kw_bitcast:
      case kw_uitofp:
      case kw_sitofp:
      case kw_fptoui:
      case kw_fptosi:
      case kw_inttoptr:
      case kw_ptrtoint:
        return parseCast(inst, pfs, opc);
      // Other.
      case kw_select:
        return parseSelect(inst, pfs);
      case kw_phi:
        return parsePHI(inst, pfs);
      case kw_call:
        return parseCall(inst, pfs, false);
      case kw_tail:
        return parseCall(inst, pfs, true);
      // Memory.
      case kw_alloca:
      //case kw_malloc:
        return parseAlloc(inst, pfs, opc, needConsiderComma);
      //case kw_free:
      //  return parseFree(inst, pfs);
      case kw_load:
        return parseLoad(inst, pfs, false, needConsiderComma);
      case kw_store:
        return parseStore(inst, pfs, false, needConsiderComma);
      case kw_volatile:
        if (eatIfPresent(kw_load))
          return parseLoad(inst, pfs, true, needConsiderComma);
        else if (eatIfPresent(kw_store))
          return parseStore(inst, pfs, true, needConsiderComma);
        else
          return tokError("expected 'load' or 'store'");
      case kw_getelementptr:
        return parseGetElementPtr(inst, pfs);
      case kw_va_arg:
        return parseVAArg(inst, pfs);
      case kw_extractvalue:
        return parseExtractValue(inst, pfs);
      case kw_insertvalue:
        return parseInsertValue(inst, pfs);
      case kw_extractelement:
        return parseExtractElement(inst, pfs);
      case kw_insertelement:
        return parseInsertElement(inst, pfs);
      case kw_shufflevector:
        return parseShuffleVector(inst, pfs);
    }
  }

  //===----------------------------------------------------------------------===//
  // Memory Instructions.
  //===----------------------------------------------------------------------===//

  /**
   * <pre>
   * Parse GetElementPtr instruction.
   *   ::= 'getelementptr' 'inbounds'? TypeAndValue (',' TypeAndValue)*
   * </pre>
   */
  private boolean parseGetElementPtr(OutRef<Instruction> inst,
                                     PerFunctionState pfs) {
    boolean inBounds = eatIfPresent(kw_inbounds);
    OutRef<Value> ptr, val;
    OutRef<SMLoc> loc, eltLoc;
    ptr = new OutRef<>();
    val = new OutRef<>();
    loc = new OutRef<>();
    eltLoc = new OutRef<>();

    if (parseTypeAndValue(ptr, loc, pfs))
      return true;

    if (!(ptr.get().getType() instanceof PointerType))
      return error(loc.get(), "base of getelementptr must be a pointer");

    ArrayList<Value> indices = new ArrayList<>();
    while (eatIfPresent(comma)) {
      if (parseTypeAndValue(val, eltLoc, pfs))
        return true;
      if (!val.get().getType().isInteger())
        return error(eltLoc.get(),
            "index of getelementptr must be an integer");

      indices.add(val.get());
    }

    if (GetElementPtrInst.getIndexedType(ptr.get().getType(), indices) == null)
      return error(loc.get(), "invalid getelementptr indices");

    GetElementPtrInst gep = new GetElementPtrInst(ptr.get(), indices, "",
        null);
    gep.setInbounds(inBounds);

    inst.set(gep);
    return false;
  }

  /**
   * * Parse store instruction.
   * <pre>
   *   ::= 'volatile'? 'store' TypeAndValue ',' TypeAndValue (',' 'align' i32)?
   * </pre>
   *
   * @param inst
   * @param pfs
   * @param isVolatile
   * @return
   */
  private boolean parseStore(OutRef<Instruction> inst,
                             PerFunctionState pfs,
                             boolean isVolatile,
                             OutRef<Boolean> needConsiderComma) {
    OutRef<Value> val, ptr;
    val = new OutRef<>();
    ptr = new OutRef<>();
    OutRef<SMLoc> valLoc = new OutRef<>();
    OutRef<SMLoc> ptrLoc = new OutRef<>();
    OutRef<Integer> align = new OutRef<>(0);
    needConsiderComma.set(false);

    if (parseTypeAndValue(val, valLoc, pfs) || parseToken(comma,
        "expected a ',' in store instruction") || parseTypeAndValue(ptr,
        ptrLoc, pfs) || parseOptionalCommaAlign(align, needConsiderComma))
      return true;

    Value src = val.get(), dest = ptr.get();
    int alignment = align.get();
    SMLoc srcLoc = valLoc.get(), destLoc = ptrLoc.get();

    if (!src.getType().isFirstClassType())
      return error(srcLoc, "store operand must be a first class value");
    if (!(dest.getType() instanceof PointerType))
      return error(destLoc,
          "store instruction requires pointer type of destination");
    if (!src.getType().equals(((PointerType) dest.getType()).getElementType()))
      return error(srcLoc, "stored value and pointer type do not match");

    inst.set(new StoreInst(src, dest, isVolatile, alignment));
    return false;
  }

  /**
   * Parse load instruction.
   * <pre>
   *   ::= 'volatile'? 'load' TypeAndValue (',' 'align' i32)?
   *   ::= 'load' 'volatile'? TypeAndValue (',' 'align' i32)?
   *   ::= 'load' 'atomic' 'volatile'? TypeAndValue
   *        'singlethread'? AtomicOrdering (',' 'align' i32)?
   * </pre>
   *
   * @param inst
   * @param pfs
   * @param isVolatile
   * @return
   */
  private boolean parseLoad(OutRef<Instruction> inst,
                            PerFunctionState pfs,
                            boolean isVolatile,
                            OutRef<Boolean> needConsiderComma) {
    boolean isAtomic = false;
    OutRef<Boolean> ateExtraComma = new OutRef<>(false);

    if (lexer.getTokKind() == kw_atomic) {
      if (isVolatile)
        return tokError("mixing atomic with old volatile placement");
      isAtomic = true;
      lexer.lex();
    }

    if (lexer.getTokKind() == kw_volatile) {
      if (isVolatile)
        return tokError("duplicate volatile before and after load");
      isVolatile = true;
      lexer.lex();
    }

    OutRef<Value> ptr = new OutRef<>();
    OutRef<SMLoc> loc = new OutRef<>();
    OutRef<Integer> align = new OutRef<>(0);
    if (parseTypeAndValue(ptr, loc, pfs) ||
        parseOptionalCommaAlign(align, ateExtraComma)) {
      return true;
    }

    if (!(ptr.get().getType() instanceof PointerType))
      return error(loc.get(),
          "load instr requires the operand of pointer type");
    inst.set(new LoadInst(ptr.get(), "", isVolatile, align.get()));
    needConsiderComma.set(ateExtraComma.get());
    return false;
  }

  /**
   * Parse free instruction
   * <pre>
   * ::= 'free' TypeAndValue
   * </pre>
   *
   * @param inst
   * @param pfs
   * @return
   */
  private boolean parseFree(OutRef<Instruction> inst,
                            PerFunctionState pfs) {
    OutRef<Value> ptrVal = new OutRef<>();
    OutRef<SMLoc> loc = new OutRef<>();
    if (parseTypeAndValue(ptrVal, loc, pfs))
      return true;
    if (!(ptrVal.get().getType() instanceof PointerType))
      return error(loc.get(),
          "free instr requires operand with pointer type");

    inst.set(new FreeInst(ptrVal.get()));
    return false;
  }

  /**
   * Parse alloca and malloc instruction.
   * <pre>
   *   ::= 'malloc' Type (',' TypeAndValue)? (',' OptionalAlignment)?
   *   ::= 'alloca' Type (',' TypeAndValue)? (',' OptionalAlignment)?
   * </pre>
   *
   * @param inst
   * @param pfs
   * @param opc
   * @return
   */
  private boolean parseAlloc(OutRef<Instruction> inst,
                             PerFunctionState pfs,
                             Operator opc,
                             OutRef<Boolean> needConsiderComma) {
    OutRef<Type> ty = new OutRef<>();
    if (parseType(ty, false))
      return true;

    OutRef<Integer> align = new OutRef<>(0);
    OutRef<Value> val = new OutRef<>();
    OutRef<SMLoc> loc = new OutRef<>();
    needConsiderComma.set(false);

    if (eatIfPresent(comma)) {
      if (lexer.getTokKind() == kw_align) {
        if (parseOptionalAlignment(align))
          return true;
      }
      else if (lexer.getTokKind() == MetadataVar)
        needConsiderComma.set(true);
      else {
        if ((parseTypeAndValue(val, loc, pfs) ||
            parseOptionalCommaAlign(align, needConsiderComma)))
        return true;
      }
    }
    Type allocTy = ty.get();
    int alignment = align.get();
    Value size = val.get();
    SMLoc sizeLoc = loc.get();

    if (size != null && size.getType().equals(LLVMContext.Int32Ty))
      return error(sizeLoc, "allocated size must have 'i32' type");

    if (opc == Operator.Malloc)
      inst.set(new MallocInst(allocTy, size, "", alignment, null));
    else
      inst.set(new AllocaInst(allocTy, size, alignment));
    return false;
  }

  /**
   * Parse Call instruction.
   * <pre>
   * CallInstr
   *      ::= 'tail'? 'call' OptionalCallingConv OptionalAttrs Type Value
   *       ParameterList OptionalAttrs
   * </pre>
   *
   * @param inst
   * @param pfs
   * @param isTail
   * @return
   */
  private boolean parseCall(OutRef<Instruction> inst,
                            PerFunctionState pfs, boolean isTail) {
    OutRef<CallingConv> cc = new OutRef<>();
    // return attribute
    OutRef<Integer> attrs1 = new OutRef<>();
    OutRef<Type> ty = new OutRef<>();
    OutRef<SMLoc> retLoc = new OutRef<>();
    ValID valID = new ValID();

    // function attribute
    OutRef<Integer> attrs2 = new OutRef<>();
    ArrayList<backend.llReader.ParamInfo> argList = new ArrayList<>();
    SMLoc callLoc = lexer.getLoc();

    if ((isTail && parseToken(kw_call, "expected 'tail call'")) ||
        parseCallingConv(cc) || parseOptionalAttrs(attrs1, 1)
        || parseType(ty, retLoc, true/*allow void*/) ||
        parseValID(valID) || parseParameterList(argList, pfs) ||
        parseOptionalAttrs(attrs2, 2))
      return true;

    // If RetType is a non-function pointer type, then this is the short syntax
    // for the call, which means that RetType is just the return type.  Infer the
    // rest of the function argument types from the arguments that are present.
    Type retTy = ty.get();
    PointerType ptr = retTy instanceof PointerType ?
        (PointerType) retTy :
        null;
    FunctionType fty = ptr != null ?
        ptr.getElementType() instanceof FunctionType ?
            (FunctionType) ptr.getElementType() : null : null;

    if (ptr == null || fty == null) {
      ArrayList<Type> paramType = argList.stream().map(arg -> arg.val.getType()).collect(Collectors.toCollection(ArrayList::new));
      if (!FunctionType.isValidArgumentType(retTy))
        return error(retLoc.get(),
            "Invalid result type for LLVM function");

      fty = FunctionType.get(retTy, paramType, false);
      ptr = PointerType.getUnqual(fty);
    }

    // Lookup callee.
    OutRef<Value> callee = new OutRef<>();
    if (convertValIDToValue(ptr, valID, callee, pfs))
      return true;

    // FIXME: In LLVM 3.0, stop accepting zext, sext and inreg as optional
    // function attributes.
    int obsoleteFuncAttrs = Attribute.ZExt | Attribute.SExt | Attribute.InReg;
    int fnAttrs = attrs2.get();
    int retAttrs = attrs1.get();

    if ((fnAttrs & obsoleteFuncAttrs) != 0) {
      retAttrs |= fnAttrs & obsoleteFuncAttrs;
      fnAttrs &= ~obsoleteFuncAttrs;
    }

    // Set up the Attributes for the function.
    ArrayList<AttributeWithIndex> attrs = new ArrayList<>();
    if (retAttrs != Attribute.None)
      attrs.add(AttributeWithIndex.get(0, retAttrs));

    ArrayList<Value> args = new ArrayList<>();
    int j = 0;  // a index to function formal parameter list.
    int sz = fty.getNumParams();
    for (int i = 0, e = argList.size(); i < e; i++) {
      Type expectedTy = null;
      if (j < sz) {
        expectedTy = fty.getParamType(j++);
      } else if (!fty.isVarArg()) {
        return error(argList.get(i).loc, "too many arguments specified");
      }

      if (expectedTy != null && !expectedTy.equals(argList.get(i).val.getType())) {
        return error(argList.get(i).loc, String.format("argument is not of expected type '%s'",
            expectedTy.getDescription()));
      }
      args.add(argList.get(i).val);
      if (argList.get(i).attrs != Attribute.None) {
        attrs.add(AttributeWithIndex.get(i + 1, argList.get(i).attrs));
      }
    }

    if (j != sz)
      return error(callLoc, "not enough parameters specified for call");

    if (fnAttrs != Attribute.None)
      attrs.add(AttributeWithIndex.get(~0, fnAttrs));

    AttrList alist = new AttrList(attrs);

    CallInst ci = new CallInst(callee.get(), args);
    ci.setTailCall(isTail);
    ci.setCallingConv(cc.get());
    ci.setAttributes(alist);
    inst.set(ci);
    return false;
  }

  /**
   * ParseParameterList
   * ::= '(' ')'
   * ::= '(' Arg (',' Arg)* ')'
   * Arg
   * ::= Type OptionalAttributes Value OptionalAttributes
   *
   * @param argList
   * @param pfs
   * @return
   */
  private boolean parseParameterList(
      ArrayList<backend.llReader.ParamInfo> argList, PerFunctionState pfs) {
    if (lexer.getTokKind() != lparen)
      return tokError("expected a '(' in call expression");
    lexer.lex();    // eat the '('
    if (eatIfPresent(rparen)) {
      // empty argument list.
      return false;
    }
    OutRef<Type> argTy = new OutRef<>();
    OutRef<Integer> attrsBeforeVal = new OutRef<>();
    OutRef<Integer> attrsAfterVal = new OutRef<>();
    OutRef<Value> val = new OutRef<>();
    while (lexer.getTokKind() != rparen) {
      SMLoc loc = lexer.getLoc();
      if (parseType(argTy, false) || parseOptionalAttrs(attrsBeforeVal, 0)
          || parseValue(argTy.get(), val, pfs)
          // FIXME: Should not allow attributes after the argument, remove this in
          // LLVM 3.0.
          || parseOptionalAttrs(attrsAfterVal, 2))
        return true;

      argList.add(new ParamInfo(loc, val.get(),
          attrsBeforeVal.get() | attrsAfterVal.get()));
      if (!eatIfPresent(comma) && lexer.getTokKind() != rparen)
        break;
    }
    return parseToken(rparen, "expected a ')' in function call expression");
  }

  /**
   * Parse cast instruction.
   * <pre>
   *     CastOps TypeAndValue 'to' Type
   * </pre>
   *
   * @param inst
   * @param pfs
   * @param opc
   * @return
   */
  private boolean parseCast(OutRef<Instruction> inst,
                            PerFunctionState pfs, Operator opc) {
    OutRef<Value> val = new OutRef<>();
    OutRef<SMLoc> loc = new OutRef<>();
    OutRef<Type> ty = new OutRef<>();

    if (parseTypeAndValue(val, loc, pfs) || parseToken(kw_to,
        "expected a 'to' in cast op") || parseType(ty, false/*allow void*/))
      return true;

    Value op = val.get();
    Type destTy = ty.get();
    SMLoc opLoc = loc.get();
    if (!CastInst.castIsValid(opc, op, destTy)) {
      CastInst.castIsValid(opc, op, destTy);
      return error(opLoc, String.format("invalid type conversion from '%s' to '%s'",
          op.getType().getDescription(), destTy.getDescription()));
    }
    inst.set(CastInst.create(opc, op, destTy, "", null));
    return false;
  }

  /**
   * <pre>
   * Parse Select instruction in the level of LLVM IR.
   * Select ::= 'select i1' Value ',' Type Value ',' Type Value
   * </pre>
   *
   * @param inst The parsed instruction would be carried out.
   * @param pfs  The class keeps track of state of current parsed function.
   * @return Return false when no occurence of error. Otherwise return false.
   */
  private boolean parseSelect(
      OutRef<Instruction> inst,
      PerFunctionState pfs) {
    SMLoc typeLoc = lexer.getLoc();
    OutRef<Type> condTy = new OutRef<>();
    if (parseType(condTy, false))
      return true;

    if (!condTy.get().equals(LLVMContext.Int1Ty))
      return error(typeLoc, "the type of condition in select instruction must be i1");
    OutRef<Value> cond = new OutRef<>();
    OutRef<Type> trueType = new OutRef<>();
    OutRef<Value> trueVal = new OutRef<>();
    OutRef<Type> falseType = new OutRef<>();
    OutRef<Value> falseVal = new OutRef<>();

    if (parseValue(condTy.get(), cond, pfs)
        || parseToken(comma, "expected a ',' after the condition")
        || parseType(trueType, false)
        || parseValue(trueType.get(), trueVal, pfs)
        || parseToken(comma, "expected a ',' after the true value")
        || parseType(falseType, false)
        || parseValue(falseType.get(), falseVal, pfs))
      return true;

    inst.set(new SelectInst(cond.get(), trueVal.get(), falseVal.get(), ""));
    return false;
  }

  /**
   * Parse phi instruction.
   * <pre>
   * Phi ::= 'phi' Type '[' Value ',' Value ']' (',' '[' Value ',' Value ']')*
   * </pre>
   *
   * @param inst
   * @param pfs
   * @return
   */
  private boolean parsePHI(
      OutRef<Instruction> inst,
      PerFunctionState pfs) {
    SMLoc typeLoc = lexer.getLoc();
    OutRef<Type> ty = new OutRef<>();
    if (parseType(ty, false))
      return true;

    if (!ty.get().isFirstClassType())
      return error(typeLoc, "phi node must have first class type");

    OutRef<Value> val = new OutRef<>();
    OutRef<Value> val2 = new OutRef<>();
    if (parseToken(lsquare, "expected '[' at beginning of phi op") ||
        parseValue(ty.get(), val, pfs) ||
        parseToken(comma, "expected ',' in phi value list")
        || parseValue(LLVMContext.LabelTy, val2, pfs) ||
        parseToken(rsquare, "expected ']' at end of phi op"))
      return true;

    ArrayList<Pair<Value, BasicBlock>> elts = new ArrayList<>();
    elts.add(Pair.get(val.get(), (BasicBlock) val2.get()));
    while (lexer.getTokKind() == comma) {
      lexer.lex();    // eat the comma
      if (parseToken(lsquare, "expected '[' at beginning of phi op") ||
          parseValue(ty.get(), val, pfs) ||
          parseToken(comma, "expected ',' in phi value list")
          || parseValue(LLVMContext.LabelTy, val2, pfs) ||
          parseToken(rsquare, "expected ']' at end of phi op"))
        return true;

      elts.add(Pair.get(val.get(), (BasicBlock) val2.get()));
    }

    PhiNode pn = new PhiNode(ty.get(), elts.size(), "");
    elts.forEach(pair -> pn.addIncoming(pair.first, pair.second));
    inst.set(pn);
    return false;
  }

  /**
   * Parse Compare instruction.
   * <pre>
   *  ::= 'icmp' IPredicates TypeAndValue ',' Value
   *  ::= 'fcmp' FPredicates TypeAndValue ',' Value
   * </pre>
   *
   * @param inst
   * @param pfs
   * @param opc
   * @return
   */
  private boolean parseCompare(
      OutRef<Instruction> inst,
      PerFunctionState pfs, Operator opc) {
    OutRef<Predicate> p = new OutRef<>();
    OutRef<Value> val1 = new OutRef<>();
    OutRef<SMLoc> loc = new OutRef<>();
    OutRef<Value> val2 = new OutRef<>();

    if (parseCmpPredicate(p, opc)
        || parseTypeAndValue(val1, loc, pfs)
        || parseToken(comma, "expected ',' after first operand of compare op")
        || parseValue(val1.get().getType(), val2, pfs))
      return true;

    Predicate pred = p.get();
    Value lhs = val1.get(), rhs = val2.get();
    SMLoc lhsLoc = loc.get();
    if (opc == Operator.FCmp) {
      if (!lhs.getType().isFloatingPointType())
        return error(lhsLoc, "fcmp op requires floating point operand");
    } else {
      Util.assertion(opc == Operator.ICmp);
      if (!lhs.getType().isInteger() && !(lhs.getType() instanceof PointerType))
        return error(lhsLoc, "icmp op requires integral operand");
    }
    inst.set(CmpInst.create(opc, pred, lhs, rhs, "", null));
    return false;
  }

  /**
   * Parse logical operation, like binary arithmetic.
   * logical ::=
   * LoigcalOps TypeAndValue ',' Value
   *
   * @param inst
   * @param pfs
   * @param opc
   * @return
   */
  private boolean parseLogical(OutRef<Instruction> inst,
                               PerFunctionState pfs, Operator opc) {
    OutRef<Value> val1 = new OutRef<>();
    OutRef<Value> val2 = new OutRef<>();
    OutRef<SMLoc> loc = new OutRef<>();
    if (parseTypeAndValue(val1, loc, pfs) ||
        parseToken(comma, "expected a ',' after first operand of logical op") ||
        parseValue(val1.get().getType(), val2, pfs))
      return true;

    Value lhs = val1.get(), rhs = val2.get();
    SMLoc lhsLoc = loc.get();
    if (!lhs.getType().isInteger())
      return error(lhsLoc, "the first operand of logical op must have integer type");
    inst.set(new Instruction.BinaryOps(lhs.getType(), opc, lhs, rhs, ""));
    return false;
  }

  /**
   * Parse a return instruction.
   * <pre>
   * ret ::= 'ret' void
   *         'ret' TypeAndValue
   *         'ret' TypeAndValue (',' TypeAndValue)+ (FIXME obsolete in LLVM 3.0)
   * </pre>
   *
   * @param inst
   * @param pfs
   * @return
   */
  private boolean parseRet(
      OutRef<Instruction> inst,
      PerFunctionState pfs) {
    OutRef<Type> retTy = new OutRef<>();
    if (parseType(retTy, true/*allow void type*/))
      return true;
    if (retTy.get().equals(LLVMContext.VoidTy)) {
      inst.set(new ReturnInst());
      return false;
    }

    OutRef<Value> rv = new OutRef<>();
    if (parseValue(retTy.get(), rv, pfs)) return true;

    // the normal case is one return value.
    // FIXME: LLVM 3.0 remove MRV support for 'ret i32 1, i32 2', requiring use
    // of 'ret {i32,i32} {i32 1, i32 2}'
    inst.set(new ReturnInst(rv.get()));
    return false;
  }

  private boolean parseTypeAndValue(OutRef<Value> op,
                                    OutRef<SMLoc> loc, PerFunctionState pfs) {
    loc.set(lexer.getLoc());
    return parseTypeAndValue(op, pfs);
  }

  private boolean parseTypeAndValue(OutRef<Value> val,
                                    PerFunctionState pfs) {
    OutRef<Type> ty = new OutRef<>();
    return parseType(ty, false) || parseValue(ty.get(), val, pfs);
  }

  private boolean parseValue(Type ty, OutRef<Value> val,
                             PerFunctionState pfs) {
    ValID id = new ValID();
    return parseValID(id) || convertValIDToValue(ty, id, val, pfs);
  }

  private boolean parseValID(ValID id) {
    return parseValID(id, null);
  }

  /**
   * Parse an abstract value that doesn't necessarily have a
   * type implied.  For example, if we parse "4" we don't know what integer type
   * it has.  The value will later be combined with its type and checked for
   * sanity.
   *
   * @param id
   * @return
   */
  private boolean parseValID(ValID id, PerFunctionState pfs) {
    id.loc = lexer.getLoc();
    LLTokenKind tok = lexer.getTokKind();
    switch (tok) {
      default:
        return tokError("expected value token");
      case GlobalID:
        // @42
        id.intVal = lexer.getIntVal();
        id.kind = ValID.ValIDKind.t_GlobalID;
        break;
      case GlobalVar:
        // @foo
        id.strVal = lexer.getStrVal();
        id.kind = ValID.ValIDKind.t_GlobalName;
        break;
      case LocalVarID:
        // %42
        id.intVal = lexer.getIntVal();
        id.kind = ValID.ValIDKind.t_LocalID;
        break;
      case LocalVar:
        // %foo
      case StringConstant:
        // "foo" -FIXME remove in LLVM 3.0
        id.strVal = lexer.getStrVal();
        id.kind = ValID.ValIDKind.t_LocalName;
        break;
      case exclaim:
        // !{...} MDNode, !"foo" MDString
        return parseMetadataValue(id, pfs);
      case APSInt:
        id.apsIntVal = lexer.getAPsIntVal();
        id.kind = ValID.ValIDKind.t_APSInt;
        break;
      case APFloat:
        id.apFloatVal = lexer.getFloatVal();
        id.kind = ValID.ValIDKind.t_APFloat;
        break;
      case kw_true:
        id.constantVal = ConstantInt.getTrue();
        id.kind = ValID.ValIDKind.t_Constant;
        break;
      case kw_false:
        id.constantVal = ConstantInt.getFalse();
        id.kind = ValID.ValIDKind.t_Constant;
        break;
      case kw_null:
        id.kind = ValID.ValIDKind.t_Null;
        break;
      case kw_undef:
        id.kind = ValID.ValIDKind.t_Undef;
        break;
      case kw_zeroinitializer:
        id.kind = ValID.ValIDKind.t_Zero;
        break;
      case lbrace: {
        // '{' elt '}'
        lexer.lex();    // eat the '{'
        ArrayList<Constant> elts = new ArrayList<>();
        if (parseGlobalValueVector(elts) || parseToken(rbrace,
            "expected '}' at end of struct constant"))
          return true;

        id.constantVal = ConstantStruct.get(elts, false);
        id.kind = ValID.ValIDKind.t_Constant;
        return false;
      }
      case less: {
        // ValID ::= '<' constVector '>' --> vector
        // ValID ::= '<' '{' constVector '}' '>' --> packed struct
        lexer.lex();    // eat the '<'
        boolean isPackedStruct = eatIfPresent(lbrace);

        ArrayList<Constant> elts = new ArrayList<>();
        SMLoc firstEltLoc = lexer.getLoc();

        if (parseGlobalValueVector(elts) || (isPackedStruct && parseToken(rbrace,
            "expected '}' at end of packed struct")) || parseToken(
            greater, "expected '>' at end of vector")) {
          return true;
        }

        if (isPackedStruct) {
          id.constantVal = ConstantStruct.get(elts, true);
          id.kind = ValID.ValIDKind.t_Constant;
          return false;
        }

        if (elts.isEmpty())
          return error(id.loc, "constant vector must not be empty");

        if (!elts.get(0).getType().isInteger() && elts.get(0).getType().isFloatingPointType())
          return error(firstEltLoc,
              "vector elements must have integer or floating point");

        // verify that all the vector elements have the same type.
        Type firstEltType = elts.get(0).getType();
        for (int i = 1, e = elts.size(); i < e; i++) {
          if (elts.get(i).getType().equals(firstEltType))
            return error(firstEltLoc,
                "vector element #" + i + " is not of type '"
                    + firstEltType.getDescription() + "'");
        }

        id.constantVal = null;
        tokError("vector type not supported");
        id.kind = ValID.ValIDKind.t_Constant;
        return false;
      }
      case lsquare: {
        // Array constant.
        lexer.lex();
        ArrayList<Constant> elts = new ArrayList<>();
        SMLoc firstEltLoc = lexer.getLoc();
        if (parseGlobalValueVector(elts) || parseToken(rsquare,
            "expected ']' at end of array constant"))
          return true;

        // handle empty element.
        if (elts.isEmpty()) {
          id.kind = ValID.ValIDKind.t_EmptyArray;
          return false;
        }

        Type firsEltType = elts.get(0).getType();
        if (!firsEltType.isFirstClassType())
          return error(firstEltLoc,
              "invalid array element type: " + firsEltType.getDescription());

        ArrayType at = ArrayType.get(elts.get(0).getType(), elts.size());

        // verify all elements have same type.

        for (int i = 1, e = elts.size(); i < e; i++) {
          if (!elts.get(i).getType().equals(firsEltType))
            return error(firstEltLoc,
                "array element #" + i + " is not of type '"
                    + firsEltType.getDescription() + "'");
        }

        id.constantVal = ConstantArray.get(at, elts);
        id.kind = ValID.ValIDKind.t_Constant;
        return false;
      }
      case kw_c:
        // c "foo"
        lexer.lex();
        id.constantVal = ConstantArray.get(unEscapeLexed(lexer.getStrVal()), false);
        if (parseToken(StringConstant, "expected string"))
          return true;
        id.kind = ValID.ValIDKind.t_Constant;
        return false;
      case kw_asm:
        return tokError("inline asm not supported");
      case kw_trunc:
      case kw_zext:
      case kw_sext:
      case kw_fptrunc:
      case kw_fpext:
      case kw_bitcast:
      case kw_uitofp:
      case kw_sitofp:
      case kw_fptoui:
      case kw_fptosi:
      case kw_inttoptr:
      case kw_ptrtoint: {
        Operator opc = parseOperator(tok);
        lexer.lex();
        OutRef<Type> destTy = new OutRef<>();
        OutRef<Constant> srcVal = new OutRef<>();
        if (parseToken(lparen, "expected '(' after constantexpr cast")
            || parseGlobalTypeAndValue(srcVal) ||
            parseToken(kw_to, "expected 'to' in constantexpr cast")
            || parseType(destTy, false) ||
            parseToken(rparen, "expected ')' at end of constantexpr cast"))
          return true;

        if (!Instruction.CastInst.castIsValid(opc, srcVal.get(), destTy.get()))
          return error(id.loc, "invalid cast opcode for cast from '" +
              srcVal.get().getType().getDescription() + "' to '" +
              destTy.get().getDescription() + "'");
        id.constantVal = ConstantExpr.getCast(opc, srcVal.get(), destTy.get());
        id.kind = ValID.ValIDKind.t_Constant;
        return false;
      }
      case kw_icmp:
      case kw_fcmp: {
        Operator opc = parseOperator(tok);
        OutRef<Constant> val0 = new OutRef<>();
        OutRef<Constant> val1 = new OutRef<>();
        OutRef<Predicate> pred = new OutRef<>();

        lexer.lex();
        if (parseCmpPredicate(pred, opc) ||
            parseToken(lparen, "expected '(' in compare constantexpr")
            || parseGlobalTypeAndValue(val0) ||
            parseToken(comma, "expected ',' in compare constantexpr")
            || parseGlobalTypeAndValue(val1) ||
            parseToken(rparen, "expected ')' in compare constantexpr"))
          return true;

        if (val0.get().getType().equals(val1.get().getType()))
          return error(id.loc, "compare operands must have same type");

        if (opc == Operator.FCmp) {
          if (!val0.get().getType().isFloatingPointType())
            return error(id.loc, "fcmp requires floating point operand");
          id.constantVal = ConstantExpr.getFCmp(pred.get(), val0.get(), val1.get());
        } else {
          Util.assertion(opc == Operator.ICmp, "Unexpected opcode for compare");
          if (!val0.get().getType().isInteger()) {
            return error(id.loc, "icmp requires integral operand");
          }
          id.constantVal = ConstantExpr.getICmp(pred.get(), val0.get(), val1.get());
        }
        id.kind = ValID.ValIDKind.t_Constant;
        return false;

      }
      // Binary Operators.
      case kw_add:
      case kw_fadd:
      case kw_sub:
      case kw_fsub:
      case kw_mul:
      case kw_fmul:
      case kw_udiv:
      case kw_sdiv:
      case kw_fdiv:
      case kw_urem:
      case kw_srem:
      case kw_frem: {
        boolean nuw = false, nsw = false;
        Operator opc = parseOperator(tok);
        OutRef<Constant> val0 = new OutRef<>();
        OutRef<Constant> val1 = new OutRef<>();
        boolean exact = false;
        lexer.lex();

        SMLoc modifierLoc = lexer.getLoc();
        if (opc == Operator.Add || opc == Operator.Sub || opc == Operator.Mul) {
          if (eatIfPresent(kw_nuw))
            nuw = true;
          if (eatIfPresent(kw_nsw)) {
            nsw = true;
            if (eatIfPresent(kw_nuw))
              nuw = true;
          }
        } else if (opc == Operator.SDiv) {
          if (eatIfPresent(kw_exact))
            exact = true;
        }

        if (parseToken(lparen, "expected '(' in binary constantexpr")
            || parseGlobalTypeAndValue(val0) ||
            parseToken(comma, "expected ',' in binary constantexpr")
            || parseGlobalTypeAndValue(val1) ||
            parseToken(rparen, "expected ')' in binary constantexpr"))
          return true;
        if (!val0.get().getType().equals(val1.get().getType()))
          return error(id.loc, "operands of constantexpr must have same type");
        if (!val0.get().getType().isInteger()) {
          if (nuw)
            return error(modifierLoc, "nuw only applied to integral binary operator");
          if (nsw)
            return error(modifierLoc, "nsw only applied to integral binary operator");
        }

        if (!val0.get().getType().isInteger() && !val0.get().getType().isFloatingPointType()) {
          return error(id.loc, "constantexpr requires integer, fp operand");
        }

        // Allow nsw and nuw, exact, but ignore it.
        id.constantVal = ConstantExpr.get(opc, val0.get(), val1.get());
        id.kind = ValID.ValIDKind.t_Constant;
        return false;
      }
      // Logical Operations
      case kw_shl:
      case kw_lshr:
      case kw_ashr:
      case kw_and:
      case kw_or:
      case kw_xor: {
        Operator opc = parseOperator(tok);
        OutRef<Constant> val0 = new OutRef<>();
        OutRef<Constant> val1 = new OutRef<>();
        lexer.lex();

        if (parseToken(lparen, "expected '(' in logical constantexpr")
            || parseGlobalTypeAndValue(val0) ||
            parseToken(comma, "expected ',' in logical constantexpr")
            || parseGlobalTypeAndValue(val1) ||
            parseToken(rparen, "expected ')' at end of constantexpr"))
          return true;

        if (!val0.get().getType().equals(val1.get().getType())) {
          return error(id.loc, "operands of constantexpr must have same type");
        }
        if (!val0.get().getType().isInteger()) {
          return error(id.loc, "constexpr requires integer type");
        }

        id.constantVal = ConstantExpr.get(opc, val0.get(), val1.get());
        id.kind = ValID.ValIDKind.t_Constant;
        return false;
      }
      case kw_getelementptr: {
        Operator opc = parseOperator(tok);
        ArrayList<Constant> elts = new ArrayList<>();

        lexer.lex();
        boolean inBounds = eatIfPresent(kw_inbounds);
        if (parseToken(lparen, "expected '(' in logical constantexpr")
            || praseGlobalValueVector(elts) ||
            parseToken(rparen, "expected ')' at end of constantexpr"))
          return true;
        if (elts.isEmpty() || !(elts.get(0).getType() instanceof PointerType))
          return error(id.loc, "getelementptr requires poinertype");

        ArrayList<Value> tmp = new ArrayList<>(elts);

        if (GetElementPtrInst.getIndexedType(elts.get(0).getType(),
            tmp.subList(1, tmp.size())) == null)
          return error(id.loc, "invalid indices for getelementptr");

        id.constantVal = ConstantExpr.getGetElementPtr(elts.get(0), elts.subList(1, elts.size()));
        id.kind = ValID.ValIDKind.t_Constant;
        return false;
      }

      case kw_shufflevector:
      case kw_insertelement:
      case kw_extractelement:
      case kw_select: {
        return tokError("unsupported operation");
      }
    }
    lexer.lex();
    return false;
  }

  /**
   * ::= !42
   * ::= !{...}
   * ::= !"string"
   * @param id
   * @param pfs
   * @return
   */
  private boolean parseMetadataValue(ValID id, PerFunctionState pfs) {
    Util.assertion(lexer.getTokKind() == exclaim);
    lexer.lex();

    // MDNode:
    // !{ ... }
    if (lexer.getTokKind() == lbrace) {
      return parseMetadataListValue(id, pfs);
    }

    // Standalone metadata reference
    // !42
    if (lexer.getTokKind() == APSInt) {
      OutRef<MDNode> ref = new OutRef<>(id.mdNodeVal);
      boolean res = parseMDNodeID(ref);
      id.mdNodeVal = ref.get();
      if (res) return true;
      id.kind = ValID.ValIDKind.t_MDNode;
      return false;
    }

    // MDString:
    //   ::= '!' STRINGCONSTANT
    OutRef<MDString> ref = new OutRef<>(id.mdStringVal);
    boolean res = parseMDString(ref);
    id.mdStringVal = ref.get();
    if (res) return false;
    id.kind = ValID.ValIDKind.t_MDString;
    return false;
  }

  /**
   * <pre>
   * GlobalValueVector ::=
   *                   empty
   *                   TypeAndValue (',' TypeAndValue)*
   * </pre>
   *
   * @param elts
   * @return
   */
  private boolean praseGlobalValueVector(ArrayList<Constant> elts) {
    // empty list
    LLTokenKind token = lexer.getTokKind();
    if (token == rbrace || token == rsquare
        || token == greater || token == rparen)
      return false;
    OutRef<Constant> c = new OutRef<>();
    if (parseGlobalTypeAndValue(c))
      return true;

    elts.add(c.get());
    while (eatIfPresent(comma)) {
      if (parseGlobalTypeAndValue(c))
        return true;
      elts.add(c.get());
    }
    return false;
  }

  /**
   * ParseMDNodeVector
   * ::= Element (',' Element)*
   * Element
   * ::= 'null' | TypeAndValue
   *
   * @param elts
   * @return
   */
  private boolean parseMDNodeVector(ArrayList<Value> elts,
                                    PerFunctionState pfs) {
    if (lexer.getTokKind() == rbrace)
      return false;

    do {
      if (eatIfPresent(kw_null)) {
        elts.add(null);
        continue;
      }

      OutRef<Value> v = new OutRef<>();
      if (parseTypeAndValue(v, pfs))
        return true;

      elts.add(v.get());
    } while (eatIfPresent(comma));

    return false;
  }

  /**
   * ::= '!' STRING CONSTANT
   *
   * @param md
   * @return
   */
  private boolean parseMDString(OutRef<MDString> md) {
    OutRef<String> name = new OutRef<>();
    if (parseStringConstant(name)) return true;
    md.set(MDString.get(name.get()));
    return false;
  }

  /**
   * ::= \epsilon
   * ::= TypeAndValue (',' TypeAndValue)*
   *
   * @param elts
   * @return
   */
  private boolean parseGlobalValueVector(ArrayList<Constant> elts) {
    // empty list
    LLTokenKind tok = lexer.getTokKind();
    if (tok == lbrace || tok == lsquare || tok == lparen || tok == less)
      return false;

    OutRef<Constant> c = new OutRef<>();
    if (parseGlobalTypeAndValue(c)) return true;

    elts.add(c.get());
    while (eatIfPresent(comma)) {
      if (parseGlobalTypeAndValue(c)) return true;
      elts.add(c.get());
    }
    return false;
  }

  private boolean parseGlobalTypeAndValue(OutRef<Constant> val) {
    OutRef<Type> ty = new OutRef<>();
    return parseType(ty, false) || parseGlobalValue(ty.get(), val);
  }

  private boolean parseGlobalValue(Type ty, OutRef<Constant> val) {
    ValID valID = new ValID();
    return parseValID(valID) || convertGlobalValIDToValue(ty, valID, val);
  }

  private boolean convertGlobalValIDToValue(
      Type ty, ValID id,
      OutRef<Constant> val) {
    if (ty instanceof FunctionType)
      return error(id.loc, "functions are not values, refer to them as pointers");

    switch (id.kind) {
      default:
        Util.shouldNotReachHere("Unknown ValID!");
      case t_LocalID:
      case t_LocalName:
        return error(id.loc, "invalid use of function-local name");
      case t_InlineAsm:
        return error(id.loc, "inline asm can only be an operand of call/invoke");
      case t_GlobalName:
        val.set(getGlobalVal(id.strVal, ty, id.loc));
        return val.get() == null;
      case t_GlobalID:
        val.set(getGlobalVal(id.intVal, ty, id.loc));
        return val.get() == null;
      case t_APSInt:
        if (!(ty instanceof IntegerType)) {
          return error(id.loc, "integer constant must have integer type");
        }
        id.apsIntVal.extOrTrunc(ty.getPrimitiveSizeInBits());
        val.set(ConstantInt.get(id.apsIntVal));
        return false;
      case t_APFloat:
        if (!ty.isFloatingPointType() ||
            !ConstantFP.isValueValidForType(ty, id.apFloatVal))
          return error(id.loc, "floating point constant invalid for type");

        if (id.apFloatVal.getSemantics() == tools.APFloat.IEEEdouble &&
            ty.equals(LLVMContext.FloatTy)) {
          id.apFloatVal.convert(tools.APFloat.IEEEsingle,
              tools.APFloat.RoundingMode.rmNearestTiesToEven,
              new OutRef<>(false));
        }
        val.set(ConstantFP.get(id.apFloatVal));
        if (!val.get().getType().equals(ty))
          return error(id.loc, "floating point constant does not have"
              + " type '" + ty.getDescription() + "'");
        return false;
      case t_Null:
        if (!(ty instanceof PointerType))
          return error(id.loc, "null must be a pointer type");
        val.set(ConstantPointerNull.get((PointerType) ty));
        return false;
      case t_Undef:
        if ((!ty.isFirstClassType() || ty.equals(LLVMContext.LabelTy)) &&
            !(ty instanceof OpaqueType)) {
          return error(id.loc, "invalid type for undef constant");
        }
        val.set(Value.UndefValue.get(ty));
        return false;
      case t_EmptyArray:
        if (!(ty instanceof ArrayType) || ((ArrayType) ty).getNumElements() != 0)
          return error(id.loc, "invalid empty array initializer");
        val.set(Value.UndefValue.get(ty));
        return false;
      case t_Zero:
        if (!ty.isFirstClassType() || ty.equals(LLVMContext.LabelTy))
          return error(id.loc, "invalid type for null constant");
        val.set(Constant.getNullValue(ty));
        return false;
      case t_Constant:
        if (!id.constantVal.getType().equals(ty))
          return error(id.loc, "constant expression type mismatch");
        val.set(id.constantVal);
        return false;
    }
  }

  private GlobalValue getGlobalVal(String name, Type ty, SMLoc loc) {
    PointerType pty = ty instanceof PointerType ? (PointerType) ty : null;
    if (pty == null) {
      error(loc, "global variable reference must have pointer type");
      return null;
    }

    // look this name up in the normal function symbol table.
    Value val = m.getValueSymbolTable().getValue(name);
    GlobalValue gv = val instanceof GlobalValue ? (GlobalValue) val : null;
    if (gv == null) {
      // if this a forward reference for the value, see if we already have
      // forward ref record.
      if (forwardRefVals.containsKey(name))
        gv = forwardRefVals.get(name).first;
    }

    if (gv != null) {
      if (gv.getType().equals(ty)) return gv;
      error(loc, String.format("'@%s' defined with type '%s'",
          name, gv.getType().getDescription()));
    }

    // Otherwise, create a new forward references for the value.
    GlobalValue fwdVal;
    if (pty.getElementType() instanceof FunctionType) {
      FunctionType ft = (FunctionType) pty.getElementType();
      if (ft.getReturnType() instanceof OpaqueType) {
        error(loc, "function may not return opaque type");
        return null;
      }

      fwdVal = new Function(ft, LinkageType.ExternalLinkage, name, null);
    } else {
      fwdVal = new GlobalVariable(m, pty.getElementType(), false,
          LinkageType.ExternalLinkage, null, name, null, 0);
    }

    forwardRefVals.put(name, Pair.get(fwdVal, loc));
    return fwdVal;
  }

  private GlobalValue getGlobalVal(int id, Type ty, SMLoc loc) {
    if (!(ty instanceof PointerType)) {
      error(loc, "global variable reference must have pointer type");
      return null;
    }

    PointerType ptr = (PointerType) ty;
    GlobalValue val = id < numberedVals.size() ? numberedVals.get(id) : null;
    if (val == null) {
      // if this is a forward reference for the value, check if we already
      // create forward ref for it.
      if (forwardRefValIDs.containsKey(id))
        val = forwardRefValIDs.get(id).first;
    }

    // if we have value in the symbol table for forward ref, return it.
    if (val != null) {
      if (val.getType().equals(ty)) return val;
      error(loc, "'@" + id + "' defined with type '" +
          val.getType().getDescription() + "'");
      return null;
    }

    // Otherwise, create a new forward reference for the value and remenber it.
    GlobalValue frdVal;
    if (ptr.getElementType() instanceof FunctionType) {
      FunctionType ft = (FunctionType) ptr.getElementType();
      if (ft.getReturnType() instanceof OpaqueType) {
        error(loc, "function may not return opaque type");
        return null;
      }
      frdVal = new Function(ft, LinkageType.ExternalLinkage, "", m);
    } else {
      frdVal = new GlobalVariable(m, ptr.getElementType(), false,
          LinkageType.ExternalLinkage, null, "", null, 0);
    }
    forwardRefValIDs.put(id, Pair.get(frdVal, loc));
    return frdVal;
  }

  private Operator parseOperator(LLTokenKind tok) {
    switch (tok) {
      case kw_extractelement:
      case kw_insertelement:
      case kw_shufflevector:
      case kw_extractvalue:
      case kw_insertvalue:
      case kw_va_arg:
      default:
        tokError("invalid opecode!");
        return null;
      case kw_select:
        return Operator.Select;
      case kw_add:
        return Operator.Add;
      case kw_fadd:
        return Operator.FAdd;
      case kw_sub:
        return Operator.Sub;
      case kw_fsub:
        return Operator.FSub;
      case kw_mul:
        return Operator.Mul;
      case kw_fmul:
        return Operator.FMul;
      case kw_udiv:
        return Operator.UDiv;
      case kw_sdiv:
        return Operator.SDiv;
      case kw_fdiv:
        return Operator.FDiv;
      case kw_urem:
        return Operator.URem;
      case kw_srem:
        return Operator.SRem;
      case kw_frem:
        return Operator.FRem;
      case kw_shl:
        return Operator.Shl;
      case kw_lshr:
        return Operator.LShr;
      case kw_ashr:
        return Operator.AShr;
      case kw_and:
        return Operator.And;
      case kw_or:
        return Operator.Or;
      case kw_xor:
        return Operator.Xor;
      case kw_icmp:
        return Operator.ICmp;
      case kw_fcmp:
        return Operator.FCmp;

      case kw_phi:
        return Operator.Phi;
      case kw_call:
      case kw_tail:
        return Operator.Call;
      case kw_trunc:
        return Operator.Trunc;
      case kw_zext:
        return Operator.ZExt;
      case kw_sext:
        return Operator.SExt;
      case kw_fptrunc:
        return Operator.FPTrunc;
      case kw_fpext:
        return Operator.FPExt;
      case kw_uitofp:
        return Operator.UIToFP;
      case kw_sitofp:
        return Operator.SIToFP;
      case kw_fptoui:
        return Operator.FPToUI;
      case kw_fptosi:
        return Operator.FPToSI;
      case kw_inttoptr:
        return Operator.IntToPtr;
      case kw_ptrtoint:
        return Operator.PtrToInt;
      case kw_bitcast:
        return Operator.BitCast;

      case kw_ret:
        return Operator.Ret;
      case kw_br:
        return Operator.Br;
      case kw_switch:
        return Operator.Switch;
      case kw_invoke:
      case kw_unwind:
      case kw_unreachable:
        return Operator.Unreachable;
      case kw_alloca:
        return Operator.Alloca;
      case kw_load:
        return Operator.Load;
      case kw_store:
        return Operator.Store;
      case kw_getelementptr:
        return Operator.GetElementPtr;
    }
  }

  private boolean parseCmpPredicate(OutRef<Predicate> pred, Operator opc) {
    if (opc == Operator.FCmp) {
      switch (lexer.getTokKind()) {
        default:
          return tokError("expected fcmp predicate (e.g. 'oeq')");
        case kw_oeq:
          pred.set(Predicate.FCMP_OEQ);
          break;
        case kw_one:
          pred.set(Predicate.FCMP_ONE);
          break;
        case kw_olt:
          pred.set(Predicate.FCMP_OLT);
          break;
        case kw_ogt:
          pred.set(Predicate.FCMP_OGT);
          break;
        case kw_ole:
          pred.set(Predicate.FCMP_OLE);
          break;
        case kw_oge:
          pred.set(Predicate.FCMP_OGE);
          break;
        case kw_ord:
          pred.set(Predicate.FCMP_ORD);
          break;
        case kw_uno:
          pred.set(Predicate.FCMP_UNO);
          break;
        case kw_ueq:
          pred.set(Predicate.FCMP_UEQ);
          break;
        case kw_une:
          pred.set(Predicate.FCMP_UNE);
          break;
        case kw_ult:
          pred.set(Predicate.FCMP_ULT);
          break;
        case kw_ugt:
          pred.set(Predicate.FCMP_UGT);
          break;
        case kw_ule:
          pred.set(Predicate.FCMP_ULE);
          break;
        case kw_uge:
          pred.set(Predicate.FCMP_UGE);
          break;
        case kw_true:
          pred.set(Predicate.FCMP_TRUE);
          break;
        case kw_false:
          pred.set(Predicate.FCMP_FALSE);
          break;
      }
    } else {
      switch (lexer.getTokKind()) {
        default:
          tokError("expected icmp predicate (e.g. 'eq')");
        case kw_eq:
          pred.set(Predicate.ICMP_EQ);
          break;
        case kw_ne:
          pred.set(Predicate.ICMP_NE);
          break;
        case kw_slt:
          pred.set(Predicate.ICMP_SLT);
          break;
        case kw_sgt:
          pred.set(Predicate.ICMP_SGT);
          break;
        case kw_sle:
          pred.set(Predicate.ICMP_SLE);
          break;
        case kw_sge:
          pred.set(Predicate.ICMP_SGE);
          break;
        case kw_ult:
          pred.set(Predicate.ICMP_ULT);
          break;
        case kw_ugt:
          pred.set(Predicate.ICMP_UGT);
          break;
        case kw_ule:
          pred.set(Predicate.ICMP_ULE);
          break;
        case kw_uge:
          pred.set(Predicate.ICMP_UGE);
          break;
      }
    }
    lexer.lex();
    return false;
  }

  private boolean convertValIDToValue(Type ty, ValID id,
                                      OutRef<Value> val, PerFunctionState pfs) {
    if (ty.isFunctionType())
      return error(id.loc, "function are not values, refer to them as pointers");

    switch (id.kind) {
      default:
        Util.shouldNotReachHere("Unknonw valID!");
        break;
      case t_LocalID:
        val.set(pfs.getVal(id.intVal, ty, id.loc));
        break;
      case t_LocalName:
        val.set(pfs.getVal(id.strVal, ty, id.loc));
        break;
      case t_MDNode:
        if (!ty.isMetadataTy())
          return error(id.loc, "metadata value must have metadata type");
        val.set(id.mdNodeVal);
        break;
      case t_MDString:
        if (!ty.isMetadataTy())
          return error(id.loc, "metadata value must have metadata type");
        val.set(id.mdStringVal);
        break;
      case t_GlobalName:
      case t_GlobalID:
        OutRef<Constant> c = new OutRef<>();
        if (convertGlobalValIDToValue(ty, id, c)) return true;
        val.set(c.get());
        return false;
      case t_APSInt:
        if (!ty.isIntegerType())
          return error(id.loc, "integer constant must have integer type");
        id.apsIntVal = id.apsIntVal.extOrTrunc(ty.getPrimitiveSizeInBits());
        val.set(ConstantInt.get(id.apsIntVal));
        return false;
      case t_APFloat:
        if (!ty.isFloatingPointType() || !ConstantFP.isValueValidForType(ty,
            id.apFloatVal))
          return error(id.loc, "floating point constant invalid for type");

          if (id.apFloatVal.getSemantics() == tools.APFloat.IEEEdouble && ty.isFloatTy()) {
            OutRef<Boolean> ignores = new OutRef<>(false);
            id.apFloatVal.convert(tools.APFloat.IEEEsingle, tools.APFloat.RoundingMode.rmNearestTiesToEven,
                ignores);
          }

          val.set(ConstantFP.get(id.apFloatVal));
          if (!val.get().getType().equals(ty))
            return error(id.loc, String.format("floating point constant doesn't have type '%s'", ty.toString()));

          return false;
      case t_Null:
        if (!ty.isPointerType())
          return error(id.loc, "null must be a pointer type");
        val.set(ConstantPointerNull.get(ty));
        return false;
      case t_Undef:
        if (!ty.isFirstClassType() || ty.isLabelTy())
          return error(id.loc, "invalid type for undef constant");
        val.set(Value.UndefValue.get(ty));
        return false;
      case t_EmptyArray:
        if (!ty.isArrayType() || ((ArrayType)ty).getNumElements() != 0)
          return error(id.loc, "invalid empty array initializer");
        val.set(Value.UndefValue.get(ty));
        return false;
      case t_Zero:
        if (!ty.isFirstClassType() || ty.isLabelTy() )
          return error(id.loc, "invalid type for null constant");
        val.set(Constant.getNullValue(ty));
        return false;
      case t_Constant:
        if (!id.constantVal.getType().equals(ty))
          return error(id.loc, "constant expression type mismatch!");
        val.set(id.constantVal);
        return false;
      case t_ConstantStruct:
      case t_PackedConstantStruct:
        if (ty instanceof StructType) {
          StructType st = (StructType) ty;
          if (st.getNumOfElements() != id.intVal) {
            return error(id.loc, "initializer with struct has wrong number of elements");
          }

          if (st.isPacked() != (id.kind == t_PackedConstantStruct))
            return error(id.loc, "packedness of intializer and type don't match");

          for (int i = 0, e = id.intVal; i < e; i++) {
            if (!id.constantStructElts[i].getType().equals(st.getElementType(i)))
              return error(id.loc, String.format("element #%d of struct" +
                  " initializer doesn't match struct element type", i));
          }
          val.set(ConstantStruct.get(st, id.constantStructElts));
        }
        else {
          return error(id.loc, "constant expression type mismatch");
        }
        return false;
    }

    return val.get() == null;
  }

  /**
   * Br ::=
   * 'br' TypeAndValue
   * 'br' TypeAndValue ',' TypeAndValue ',' TypeAndValue
   *
   * @param inst
   * @param pfs
   * @return
   */
  private boolean parseBr(OutRef<Instruction> inst,
                          PerFunctionState pfs) {
    OutRef<SMLoc> loc1 = new OutRef<>();
    OutRef<SMLoc> loc2 = new OutRef<>();

    OutRef<Value> op0 = new OutRef<>();
    OutRef<Value> op1 = new OutRef<>();
    OutRef<Value> op2 = new OutRef<>();

    if (parseTypeAndValue(op0, loc1, pfs))
      return true;

    Value cond = op0.get();
    if (cond instanceof BasicBlock) {
      // unconditional branch instr
      inst.set(new BranchInst((BasicBlock) cond));
      return false;
    }

    if (!cond.getType().equals(LLVMContext.Int1Ty)) {
      return error(loc1.get(), "branch condition must have 'i1' type");
    }

    if (parseToken(comma, "expected ',' after branch condition") ||
        parseTypeAndValue(op1, loc1, pfs) ||
        parseToken(comma, "expected ',' after true destination") ||
        parseTypeAndValue(op2, loc2, pfs))
      return true;

    SMLoc trueLoc = loc1.get(), falseLoc = loc2.get();
    Value trueOp = op1.get(), falseOp = op2.get();

    if (!(trueOp instanceof BasicBlock))
      return error(trueLoc, "true destination of branch must be a basic block");
    if (!(falseOp instanceof BasicBlock))
      return error(trueLoc, "false destination of branch must be a basic block");

    inst.set(new BranchInst((BasicBlock) trueOp, (BasicBlock) falseOp, cond));
    return false;
  }

  /**
   * Parse Switch instruction.
   * <pre>
   *  Instruction
   *    ::= 'switch' TypeAndValue ',' TypeAndValue '[' JumpTable ']'
   *  JumpTable
   *    ::= (TypeAndValue ',' TypeAndValue)*
   * </pre>
   *
   * @param inst
   * @param pfs
   * @return
   */
  private boolean parseSwitch(
      OutRef<Instruction> inst,
      PerFunctionState pfs) {
    OutRef<Value> valWrapper = new OutRef<>();
    OutRef<SMLoc> locWrapper = new OutRef<>();
    if (parseTypeAndValue(valWrapper, locWrapper, pfs)) return true;

    Value cond = valWrapper.get();
    SMLoc condLoc = locWrapper.get();
    if (!cond.getType().isIntegerType())
      return error(condLoc, "condition of switch instr must have 'i1' type");

    if (eatIfPresent(comma) &&
        parseTypeAndValue(valWrapper, locWrapper, pfs)) return true;
    Value defaultVal = valWrapper.get();
    SMLoc defaultValLoc = locWrapper.get();
    if (!(defaultVal instanceof BasicBlock))
      return error(defaultValLoc, "default destination of switch must be a basic block");

    if (eatIfPresent(lsquare)) {
      SMLoc lsquareLoc = lexer.getLoc();

      OutRef<Value> val2 = new OutRef<>();
      OutRef<SMLoc> loc2 = new OutRef<>();
      ArrayList<Constant> elts = new ArrayList<>();
      ArrayList<BasicBlock> dests = new ArrayList<>();
      HashSet<Constant> uniqueElts = new HashSet<>();

      while (lexer.getTokKind() != rsquare) {
        if (parseTypeAndValue(valWrapper, locWrapper, pfs) ||
            parseToken(comma, "expected ',' in each jump table pair") ||
            parseTypeAndValue(val2, loc2, pfs))
          return true;

        if (!valWrapper.get().getType().isIntegerType() ||
            !(valWrapper.get() instanceof ConstantInt))
          return error(locWrapper.get(), "case value is not a integer constant");
        if (!uniqueElts.add((Constant) valWrapper.get()))
          return error(locWrapper.get(), "duplicate case value in switch");
        if (!(val2.get() instanceof BasicBlock))
          return error(loc2.get(), "case destination must be a basic block");

        dests.add((BasicBlock) val2.get());
        elts.add((Constant) valWrapper.get());
      }
      if (elts.size() != dests.size())
        return error(lsquareLoc, "the number of case value and destination basic block is not matched");

      lexer.lex();    // eat the ']'

      SwitchInst si = new SwitchInst(cond, (BasicBlock) defaultVal, elts.size(), "");
      int i = 0;
      for (Constant val : elts) {
        si.addCase(val, dests.get(i++));
      }
      inst.set(si);
      return false;
    } else {
      return tokError("expected '[' at end of switch instruction");
    }
  }

  /**
   * <pre>
   * Parse Arithmetic instruction
   *  ::= ArithmeticOps TypeAndValue ',' Value
   *
   * If operandType is 0, then any FP or integer operand is allowed.  If it is 1,
   * then any integer operand is allowed, if it is 2, any fp operand is allowed.
   * </pre>
   *
   * @param inst
   * @param pfs
   * @param opc
   * @param operandType
   * @return
   */
  private boolean parseArithmetic(
      OutRef<Instruction> inst,
      PerFunctionState pfs,
      Operator opc,
      int operandType) {
    OutRef<Value> val = new OutRef<>();
    OutRef<Value> val2 = new OutRef<>();
    OutRef<SMLoc> loc = new OutRef<>();

    if (parseTypeAndValue(val, loc, pfs) ||
        parseToken(comma, "expected a ',' after first operand of binary op") ||
        parseValue(val.get().getType(), val2, pfs))
      return true;

    boolean valid = true;
    Value op1 = val.get(), op2 = val2.get();
    SMLoc op1Loc = loc.get();
    switch (operandType) {
      default:
        break;
      case 0:
        // both int and fp.
        valid = (op1.getType().isInteger() || op1.getType().isFloatingPointType())
            && (op2.getType().isInteger() || op2.getType().isFloatingPointType());
        break;
      case 1:
        // only integral allowed
        valid = op1.getType().isInteger() && op2.getType().isInteger();
        break;
      case 2:
        // only fp allowed
        valid = op1.getType().isFloatingPointType() && op2.getType().isFloatingPointType();
        break;
    }
    if (!valid)
      return error(op1Loc, "invalid type for arithmetic instruction");
    inst.set(new Instruction.BinaryOps(op1.getType(), opc, op1, op2, ""));
    return false;
  }

  /**
   * Validate the parsed LLVM module.
   *
   * @return
   */
  private boolean validateEndOfModule() {

    if (!forwardRefInstMetadata.isEmpty()) {
      for (Map.Entry<Instruction, ArrayList<MDRef>> entry : forwardRefInstMetadata.entrySet()) {
        Instruction inst = entry.getKey();
        ArrayList<MDRef> mdList = entry.getValue();

        for (MDRef ref : mdList) {
          int slotNo = ref.mdSlot;
          if (slotNo >= numberedMetadata.size() || numberedMetadata.get(slotNo) == null)
            return error(ref.loc, String.format("use of undefined metadata '!%d'", slotNo));
            inst.setMetadata(ref.mdKind, numberedMetadata.get(slotNo));
        }
      }
      forwardRefInstMetadata.clear();
    }

    if (!forwardRefTypes.isEmpty()) {
      Map.Entry<String, Pair<Type, SMLoc>> itr = forwardRefTypes.entrySet().iterator().next();
      return error(itr.getValue().second,
          String.format("use of undefined type name '%s'", itr.getKey()));
    }
    if (!forwardRefTypeIDs.isEmpty()) {
      TIntObjectIterator<Pair<Type, SMLoc>> itr = forwardRefTypeIDs.iterator();
      return error(itr.value().second,
          String.format("use of undefined type '%%%d'", itr.key()));
    }
    if (!forwardRefVals.isEmpty()) {
      Map.Entry<String, Pair<GlobalValue, SMLoc>> itr = forwardRefVals.entrySet().iterator().next();
      return error(itr.getValue().second,
          String.format("use of undefined value '@%s'", itr.getKey()));
    }
    if (!forwardRefValIDs.isEmpty()) {
      TIntObjectIterator<Pair<GlobalValue, SMLoc>> itr = forwardRefValIDs.iterator();
      return error(itr.value().second,
          String.format("use of undefined value'@%d'", itr.key()));
    }
    if (!forwardRefMDNodes.isEmpty()) {
      TIntObjectIterator<Pair<MDNode, SMLoc>> itr = forwardRefMDNodes.iterator();
      return error(itr.value().second,
          String.format("use of undefined metadata '!%d'", itr.key()));
    }

    // Look for intrinsic functions and CallInst that need to be upgraded
    // for (Function f : m.getFunctionList())
    //upgradeCallsToIntrinsic(f);

    return false;
  }

  /**
   * parse the following grammar.
   * ::= !dbg !42 (',' !dbg !57)*
   *
   * @param inst
   * @param pfs
   * @return
   */
  private boolean parseInstructionMetadata(Instruction inst,
                                           PerFunctionState pfs) {
    do {
      if (lexer.getTokKind() != MetadataVar)
        return tokError("expected metadata after comma");

      String name = lexer.getStrVal();
      int mdk = m.getMDKindID(name);
      lexer.lex();

      OutRef<MDNode> node = new OutRef<>(null);
      SMLoc loc = lexer.getLoc();

      if (parseToken(exclaim, "expected '!' here"))
        return true;

      // This code is similar to that of ParseMetadataValue, however it needs to
      // have special-case code for a forward reference; see the comments on
      // ForwardRefInstMetadata for details. Also, MDStrings are not supported
      // at the top level here.
      if (lexer.getTokKind() == lbrace) {
        ValID id = new ValID();
        if (parseMetadataListValue(id, pfs))
          return true;
        Util.assertion(id.kind == ValID.ValIDKind.t_MDNode);
        inst.setMetadata(mdk, id.mdNodeVal);
      } else {
        OutRef<Integer> nodeId = new OutRef<>(0);
        if (parseMDNodeID(node, nodeId))
          return true;
        if (node.get() != null)
          inst.setMetadata(mdk, node.get());
        else {
          MDRef r = new MDRef(loc, mdk, nodeId.get());
          if (!forwardRefInstMetadata.containsKey(inst))
            forwardRefInstMetadata.put(inst, new ArrayList<>());

          forwardRefInstMetadata.get(inst).add(r);
        }
      }
    } while (eatIfPresent(comma));
    return false;
  }

  /**
   * This version of ParseMDNodeID returns the slot number and null in the case
   * of a forward reference.
   *
   * @param result
   * @return
   */
  private boolean parseMDNodeID(OutRef<MDNode> result) {
    // !{ ..., !42, ... }
    OutRef<Integer> slotNo = new OutRef<>(0);
    if (parseMDNodeID(result, slotNo))
      return true;

    if (result.get() != null)
      return false;

    // create a temporary object
    MDNode fwdNode = new MDNode(new ArrayList<>());
    forwardRefMDNodes.put(slotNo.get(), Pair.get(fwdNode, lexer.getLoc()));

    if (slotNo.get() >= numberedMetadata.size()) {
      for (int i = numberedMetadata.size(); i < slotNo.get()+1; i++)
        numberedMetadata.add(null);
    }

    numberedMetadata.set(slotNo.get(), fwdNode);
    result.set(fwdNode);
    return false;
  }

  private boolean parseMDNodeID(OutRef<MDNode> result, OutRef<Integer> slotNo) {
    if (parseInt32(slotNo)) return true;

    if (slotNo.get() < numberedMetadata.size() && numberedMetadata.get(slotNo.get()) != null)
      result.set(numberedMetadata.get(slotNo.get()));
    else
      result.set(null);
    return false;
  }

  private boolean parseMetadataListValue(ValID id, PerFunctionState pfs) {
    Util.assertion(lexer.getTokKind() == lbrace);
    lexer.lex();

    ArrayList<Value> elts = new ArrayList<>();
    if (parseMDNodeVector(elts, pfs) ||
        parseToken(rbrace, "expected end of metadata node"))
      return true;

    id.mdNodeVal = MDNode.get(elts);
    id.kind = ValID.ValIDKind.t_MDNode;
    return false;
  }

  /**
   * VA_Arg ::= 'va_arg' TypeAndValue ',' Type
   * @param inst
   * @param pfs
   * @return
   */
  private boolean parseVAArg(OutRef<Instruction> inst, PerFunctionState pfs) {
    OutRef<Value> op = new OutRef<>();
    OutRef<Type> eltTy = new OutRef<>(LLVMContext.VoidTy);
    OutRef<SMLoc> typeLoc = new OutRef<>();
    if (parseTypeAndValue(op, pfs) ||
        parseToken(comma, "expected ',' after vaarg operand") ||
        parseType(eltTy, typeLoc))
          return true;
    if (!eltTy.get().isFirstClassType())
      return error(typeLoc.get(), "va_arg requires operand with first class type");
    inst.set(new VAArgInst(op.get(), eltTy.get()));
    return false;
  }

  /**
   * ExtractValueInst ::= 'extractvalue' TypeAndValue (',' uint32)+
   * @param inst
   * @param pfs
   * @return
   */
  private boolean parseExtractValue(OutRef<Instruction> inst, PerFunctionState pfs) {
    OutRef<SMLoc> loc = new OutRef<>();
    OutRef<Value> op0 = new OutRef<>();
    OutRef<Integer> idx = new OutRef<>(0);
    TIntArrayList indices = new TIntArrayList();

    if (parseTypeAndValue(op0, loc, pfs) ||
        parseToken(comma, "expected a ',' after extractvalue operands") ||
        parseInt32(idx))
      return true;

    indices.add(idx.get());
    while (eatIfPresent(comma)) {
      if (parseInt32(idx))
        return true;

      indices.add(idx.get());
    }

    if (!op0.get().getType().isAggregateType())
      return error(loc.get(), "extractvalue operand must be aggregate type");

    if (ExtractValueInst.getIndexedType(op0.get().getType(), indices.toArray()) == null)
      return error(loc.get(), "invalid indices for extractvalue instruction");

    inst.set(new ExtractValueInst(op0.get(), indices.toArray()));
    return false;
  }

  /**
   * InsertValueInst ::= 'insertvalue' TypeAndValue ',' TypeAndValue (',' uint32)+
   * @param inst
   * @param pfs
   * @return
   */
  private boolean parseInsertValue(OutRef<Instruction> inst, PerFunctionState pfs) {
    OutRef<SMLoc> loc = new OutRef<>();
    OutRef<Value> vec = new OutRef<>(), elt = new OutRef<>();
    OutRef<Integer> idx = new OutRef<>(0);
    TIntArrayList indices = new TIntArrayList();

    if (parseTypeAndValue(vec, loc, pfs) ||
        parseToken(comma, "expected a ',' after extractvalue operands") ||
        parseTypeAndValue(elt, pfs) ||
        parseInt32(idx))
      return true;

    indices.add(idx.get());
    while (eatIfPresent(comma)) {
      if (parseInt32(idx))
        return true;

      indices.add(idx.get());
    }

    if (!vec.get().getType().isAggregateType())
      return error(loc.get(), "insertvalue operand must be aggregate type");

    if (ExtractValueInst.getIndexedType(vec.get().getType(), indices.toArray()) == null)
      return error(loc.get(), "invalid indices for insertvalue instruction");

    inst.set(new InsertValueInst(vec.get(), elt.get(), indices.toArray()));
    return false;
  }

  /**
   * ExtractElement ::= 'extractelement' TypeAndValue ',' TypeAndValue
   * @param inst
   * @param pfs
   * @return
   */
  private boolean parseExtractElement(OutRef<Instruction> inst, PerFunctionState pfs) {
    OutRef<SMLoc> loc = new OutRef<>();
    OutRef<Value> op0 = new OutRef<>(), op1 = new OutRef<>();
    if (parseTypeAndValue(op0, loc, pfs) ||
    parseToken(comma, "expected a ',' after extractelemnt operands") ||
    parseTypeAndValue(op1, pfs))
      return true;

    if (!ExtractElementInst.isValidOperands(op0.get(), op1.get()))
      return error(loc.get(), "invalid extractelement operrands");

    inst.set(new ExtractElementInst(op0.get(), op1.get()));
    return false;
  }

  /**
   * InsertElement = 'insertelement' TypeAndValue ',' TypeAndValue ',' TypeAndValue
   * @param inst
   * @param pfs
   * @return
   */
  private boolean parseInsertElement(OutRef<Instruction> inst, PerFunctionState pfs) {
    OutRef<SMLoc> loc = new OutRef<>();
    OutRef<Value> vec = new OutRef<>(), elt = new OutRef<>(), index = new OutRef<>();
    if (parseTypeAndValue(vec, loc, pfs) ||
        parseToken(comma, "expected a ',' after insertelemnt operands") ||
        parseTypeAndValue(elt, pfs) ||
        parseTypeAndValue(index, pfs))
      return true;

    if (!InsertElementInst.isValidOperands(vec.get(), elt.get(), index.get()))
      return error(loc.get(), "invalid insertelement operrands");

    inst.set(new InsertElementInst(vec.get(), elt.get(), index.get()));
    return false;
  }

  /**
   * ShuffleVectorInst = 'shufflevector' TypeAndValue ',' TypeAndValue ',' TypeAndValue
   * @param inst
   * @param pfs
   * @return
   */
  private boolean parseShuffleVector(OutRef<Instruction> inst, PerFunctionState pfs) {
    OutRef<SMLoc> loc = new OutRef<>();
    OutRef<Value> op0 = new OutRef<>(), op1 = new OutRef<>(), op2 = new OutRef<>();
    if (parseTypeAndValue(op0, loc, pfs) ||
        parseToken(comma, "expected a ',' after shufflevector operands") ||
        parseTypeAndValue(op1, pfs) ||
        parseTypeAndValue(op2, pfs))
      return true;

    if (!ShuffleVectorInst.isValidOperands(op0.get(), op1.get(), op2.get()))
      return error(loc.get(), "invalid shufflevector operrands");

    inst.set(new ShuffleVectorInst(op0.get(), op1.get(), op2.get()));
    return false;
  }
}
