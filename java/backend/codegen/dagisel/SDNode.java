/*
 * Extremely C language Compiler
 * Copyright (c) 2015-2018, Xlous Zeng.
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

package backend.codegen.dagisel;

import backend.codegen.*;
import backend.codegen.fastISel.ISD;
import backend.target.TargetInstrInfo;
import backend.target.TargetLowering;
import backend.value.*;
import tools.*;

import java.io.PrintStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.TreeSet;

/**
 * @author Xlous.zeng
 * @version 0.1
 */
public class SDNode implements Comparable<SDNode>, FoldingSetNode
{
    protected int opcode;
    protected int sublassData;
    protected int nodeID;
    protected SDUse[] operandList;
    protected EVT[] valueList;
    protected ArrayList<SDUse> useList;
    private static HashMap<EVT, TreeSet<EVT>> evts = new HashMap<>();
    private static EVT[] vts = new EVT[MVT.LAST_VALUETYPE];

    private static EVT getValueTypeList(EVT vt)
    {
        if (vt.isExtended())
        {
            evts.put(vt, new TreeSet<>());
            return vt;
        }
        else
        {
            vts[vt.getSimpleVT().simpleVT] = vt;
            return vt;
        }
    }

    public int getOpcode()
    {
        assert opcode >= 0 : "Is a machine operator?";
        return opcode;
    }

    public boolean isTargetOpcode()
    {
        return opcode >= NodeType.BUILTIN_OP_END.ordinal();
    }

    public boolean isMachineOperand()
    {
        return opcode < 0;
    }

    public int getMachineOpcode()
    {
        assert isMachineOperand();
        return ~opcode;
    }

    public boolean isUseEmpty()
    {
        return useList == null;
    }

    public boolean hasOneUse()
    {
        return !isUseEmpty() && useList.size() == 1;
    }

    public int getUseSize()
    {
        return useList.size();
    }

    public int getNodeID()
    {
        return nodeID;
    }

    public boolean hasNumUsesOfValue(int numOfUses, int value)
    {
        assert value < getNumValues():"Illegal value!";
        for (SDUse u : useList)
        {
            if (u.getResNo() == value)
            {
                if (numOfUses == 0)
                    return false;
                --numOfUses;
            }
        }
        return numOfUses == 0;
    }

    public boolean hasAnyUseOfValue(int value)
    {
        assert value < getNumValues():"Illegal value!";
        for (SDUse u : useList)
        {
            if (u.getResNo() == value)
            {
                return true;
            }
        }
        return false;
    }

    public boolean isOnlyUserOf(SDNode node)
    {
        for (SDUse u : useList)
        {
            if (!u.getUser().equals(node))
                return false;
        }
        return true;
    }

    public boolean isOperandOf(SDNode node)
    {
        for (int i = 0, e = node.getNumOperands(); i < e; i++)
        {
            if (node.getOperand(i).getNode().equals(this))
                return true;
        }
        return false;
    }

    private static void collectsPreds(SDNode root, HashSet<SDNode> visited)
    {
        if (root == null || !visited.add(root)) return;

        for (int i = 0, e = root.getNumOperands(); i < e; i++)
            collectsPreds(root.getOperand(i).getNode(), visited);
    }

    /**
     * Checks if this is predecessor of the specified node. The predecessor means it either is an
     * operand of the given node or it can be reached traversed recursively from the sub tree rooted at node.
     * @param node
     * @return
     */
    public boolean isPredecessorOf(SDNode node)
    {
        HashSet<SDNode> visited = new HashSet<>();
        collectsPreds(node, visited);
        return visited.contains(this);
    }

    public static FltSemantics EVTToAPFloatSemantics(EVT vt)
    {
        switch (vt.getSimpleVT().simpleVT)
        {
            case MVT.f32: return APFloat.IEEEsingle;
            case MVT.f64: return APFloat.IEEEdouble;
            case MVT.f80: return APFloat.x87DoubleExtended;
            case MVT.f128: return APFloat.IEEEquad;
            default:
                Util.shouldNotReachHere("Unknown FP format!");
                return null;
        }
    }

    /**
     * Return this is a normal load SDNode.
     * @return
     */
    public boolean isNormalLoad()
    {
        LoadSDNode ld = this instanceof LoadSDNode ?(LoadSDNode)this: null;
        return (ld != null && ld.getExtensionType() == LoadExtType.NON_EXTLOAD &&
                ld.getAddressingMode() == MemIndexedMode.UNINDEXED);
    }

    public boolean isNONExtLoad()
    {
        LoadSDNode ld = this instanceof LoadSDNode ?(LoadSDNode)this: null;
        return ld != null && ld.getExtensionType() == LoadExtType.NON_EXTLOAD;
    }

    public boolean isExtLoad()
    {
        LoadSDNode ld = this instanceof LoadSDNode ?(LoadSDNode)this: null;
        return ld != null && ld.getExtensionType() == LoadExtType.EXTLOAD;
    }

    public boolean isSEXTLoad()
    {
        LoadSDNode ld = this instanceof LoadSDNode ?(LoadSDNode)this: null;
        return ld != null && ld.getExtensionType() == LoadExtType.SEXTLOAD;
    }

    public boolean isZEXTLoad()
    {
        LoadSDNode ld = this instanceof LoadSDNode ?(LoadSDNode)this: null;
        return ld != null && ld.getExtensionType() == LoadExtType.ZEXTLOAD;
    }

    public boolean isUNINDEXEDLoad()
    {
        LoadSDNode ld = this instanceof LoadSDNode ?(LoadSDNode)this: null;
        return ld != null && ld.getAddressingMode() == MemIndexedMode.UNINDEXED;
    }

    public boolean isNormalStore()
    {
        StoreSDNode st = this instanceof StoreSDNode ?(StoreSDNode)this : null;
        return st != null && st.getAddressingMode() == MemIndexedMode.UNINDEXED &&
                !st.isTruncatingStore();
    }

    public boolean isNONTRUNCStore()
    {
        StoreSDNode st = this instanceof StoreSDNode ?(StoreSDNode)this : null;
        return st != null && !st.isTruncatingStore();
    }

    public boolean isTRUNCStore()
    {
        StoreSDNode st = this instanceof StoreSDNode ?(StoreSDNode)this : null;
        return st != null && st.isTruncatingStore();
    }

    public boolean isUNINDEXEDStore()
    {
        StoreSDNode st = this instanceof StoreSDNode ?(StoreSDNode)this : null;
        return st != null && st.getAddressingMode() == MemIndexedMode.UNINDEXED;
    }

    public int getNumOperands()
    {
        return operandList.length;
    }

    public long getConstantOperandVal(int num)
    {
        assert num >= 0 && num < getNumOperands();
        SDValue op = getOperand(num);
        assert op.getNode() instanceof ConstantSDNode;
        return ((ConstantSDNode)op.getNode()).getZExtValue();
    }

    public SDValue getOperand(int num)
    {
        assert num <= getNumOperands() && num >= 0;
        return operandList[num].val;
    }

    public SDUse[] getOperandList()
    {
        return operandList;
    }

    public SDNode getFlaggedNode()
    {
        if (getNumOperands() != 0 && getOperand(getNumOperands() - 1).getValueType().getSimpleVT().
                equals(new EVT(MVT.Flag)))
        {
            return getOperand(getNumOperands() - 1).getNode();
        }
        return null;
    }

    public SDNode getFlaggedMachineNode()
    {
        SDNode res = this;
        while (!res.isMachineOperand())
        {
            SDNode n = res.getFlaggedNode();
            if (n == null)
                break;
            res = n;
        }
        return res;
    }

    public int getNumValues()
    {
        return valueList.length;
    }

    public EVT getValueType(int resNo)
    {
        assert resNo <= getNumValues() && resNo >= 0;
        return valueList[resNo];
    }

    public int getValueSizeInBits(int resNo)
    {
        return getValueType(resNo).getSizeInBits();
    }

    public SDVTList getValueList()
    {
        return new SDVTList(valueList);
    }

    public String getOperationName()
    {
        return getOperationName(null);
    }

    public String getOperationName(SelectionDAG dag)
    {
        switch (getOpcode())
        {
            default:
                if (getOpcode() < ISD.BUILTIN_OP_END)
                    return "<<Unknown DAG Node>>";

                if (isMachineOperand())
                {
                    if (dag != null)
                    {
                        TargetInstrInfo tii = dag.getTarget().getInstrInfo();
                        if (tii != null)
                            if (getMachineOpcode() < tii.getNumTotalOpCodes())
                                return tii.get(getMachineOpcode()).getName();
                    }
                    return "<<Unknown Machine Node>>";
                }
                if (dag != null)
                {
                    TargetLowering tli = dag.getTarget().getTargetLowering();
                    String name = tli.getTargetNodeName(getOpcode());
                    if (name != null)  return name;
                    return "<<Unknown Target Node>>";
                }
                return "<<Unknown Node>>";

            case ISD.DELETED_NODE:
                return "<<Deleted Node!>>";

            case ISD.PREFETCH:      return "Prefetch";
            case ISD.MEMBARRIER:    return "MemBarrier";
            case ISD.ATOMIC_CMP_SWAP:    return "AtomicCmpSwap";
            case ISD.ATOMIC_SWAP:        return "AtomicSwap";
            case ISD.ATOMIC_LOAD_ADD:    return "AtomicLoadAdd";
            case ISD.ATOMIC_LOAD_SUB:    return "AtomicLoadSub";
            case ISD.ATOMIC_LOAD_AND:    return "AtomicLoadAnd";
            case ISD.ATOMIC_LOAD_OR:     return "AtomicLoadOr";
            case ISD.ATOMIC_LOAD_XOR:    return "AtomicLoadXor";
            case ISD.ATOMIC_LOAD_NAND:   return "AtomicLoadNand";
            case ISD.ATOMIC_LOAD_MIN:    return "AtomicLoadMin";
            case ISD.ATOMIC_LOAD_MAX:    return "AtomicLoadMax";
            case ISD.ATOMIC_LOAD_UMIN:   return "AtomicLoadUMin";
            case ISD.ATOMIC_LOAD_UMAX:   return "AtomicLoadUMax";
            case ISD.PCMARKER:      return "PCMarker";
            case ISD.READCYCLECOUNTER: return "ReadCycleCounter";
            case ISD.SRCVALUE:      return "SrcValue";
            case ISD.MEMOPERAND:    return "MemOperand";
            case ISD.EntryToken:    return "EntryToken";
            case ISD.TokenFactor:   return "TokenFactor";
            case ISD.AssertSext:    return "AssertSext";
            case ISD.AssertZext:    return "AssertZext";

            case ISD.BasicBlock:    return "BasicBlock";
            case ISD.VALUETYPE:     return "ValueType";
            case ISD.Register:      return "Register";

            case ISD.Constant:      return "Constant";
            case ISD.ConstantFP:    return "ConstantFP";
            case ISD.GlobalAddress: return "GlobalAddress";
            case ISD.GlobalTLSAddress: return "GlobalTLSAddress";
            case ISD.FrameIndex:    return "FrameIndex";
            case ISD.JumpTable:     return "JumpTable";
            case ISD.GLOBAL_OFFSET_TABLE: return "GLOBAL_OFFSET_TABLE";
            case ISD.RETURNADDR: return "RETURNADDR";
            case ISD.FRAMEADDR: return "FRAMEADDR";
            case ISD.FRAME_TO_ARGS_OFFSET: return "FRAME_TO_ARGS_OFFSET";
            case ISD.EXCEPTIONADDR: return "EXCEPTIONADDR";
            case ISD.LSDAADDR: return "LSDAADDR";
            case ISD.EHSELECTION: return "EHSELECTION";
            case ISD.EH_RETURN: return "EH_RETURN";
            case ISD.ConstantPool:  return "ConstantPool";
            case ISD.ExternalSymbol: return "ExternalSymbol";
            case ISD.INTRINSIC_WO_CHAIN:
            {
                long iid = ((ConstantSDNode)getOperand(0).getNode()).getZExtValue();
                assert false:"Intrinsic function not supported!";
            }
            case ISD.INTRINSIC_VOID:
            case ISD.INTRINSIC_W_CHAIN:
            {
                long iid = ((ConstantSDNode)getOperand(0).getNode()).getZExtValue();
                assert false:"Intrinsic function not supported!";
            }

            case ISD.BUILD_VECTOR:   return "BUILD_VECTOR";
            case ISD.TargetConstant: return "TargetConstant";
            case ISD.TargetConstantFP:return "TargetConstantFP";
            case ISD.TargetGlobalAddress: return "TargetGlobalAddress";
            case ISD.TargetGlobalTLSAddress: return "TargetGlobalTLSAddress";
            case ISD.TargetFrameIndex: return "TargetFrameIndex";
            case ISD.TargetJumpTable:  return "TargetJumpTable";
            case ISD.TargetConstantPool:  return "TargetConstantPool";
            case ISD.TargetExternalSymbol: return "TargetExternalSymbol";

            case ISD.CopyToReg:     return "CopyToReg";
            case ISD.CopyFromReg:   return "CopyFromReg";
            case ISD.UNDEF:         return "undef";
            case ISD.MERGE_VALUES:  return "merge_values";
            case ISD.INLINEASM:     return "inlineasm";
            case ISD.DBG_LABEL:     return "dbg_label";
            case ISD.EH_LABEL:      return "eh_label";
            case ISD.DECLARE:       return "declare";
            case ISD.HANDLENODE:    return "handlenode";

            // Unary operators
            case ISD.FABS:   return "fabs";
            case ISD.FNEG:   return "fneg";
            case ISD.FSQRT:  return "fsqrt";
            case ISD.FSIN:   return "fsin";
            case ISD.FCOS:   return "fcos";
            case ISD.FPOWI:  return "fpowi";
            case ISD.FPOW:   return "fpow";
            case ISD.FTRUNC: return "ftrunc";
            case ISD.FFLOOR: return "ffloor";
            case ISD.FCEIL:  return "fceil";
            case ISD.FRINT:  return "frint";
            case ISD.FNEARBYINT: return "fnearbyint";

            // Binary operators
            case ISD.ADD:    return "add";
            case ISD.SUB:    return "sub";
            case ISD.MUL:    return "mul";
            case ISD.MULHU:  return "mulhu";
            case ISD.MULHS:  return "mulhs";
            case ISD.SDIV:   return "sdiv";
            case ISD.UDIV:   return "udiv";
            case ISD.SREM:   return "srem";
            case ISD.UREM:   return "urem";
            case ISD.SMUL_LOHI:  return "smul_lohi";
            case ISD.UMUL_LOHI:  return "umul_lohi";
            case ISD.SDIVREM:    return "sdivrem";
            case ISD.UDIVREM:    return "udivrem";
            case ISD.AND:    return "and";
            case ISD.OR:     return "or";
            case ISD.XOR:    return "xor";
            case ISD.SHL:    return "shl";
            case ISD.SRA:    return "sra";
            case ISD.SRL:    return "srl";
            case ISD.ROTL:   return "rotl";
            case ISD.ROTR:   return "rotr";
            case ISD.FADD:   return "fadd";
            case ISD.FSUB:   return "fsub";
            case ISD.FMUL:   return "fmul";
            case ISD.FDIV:   return "fdiv";
            case ISD.FREM:   return "frem";
            case ISD.FCOPYSIGN: return "fcopysign";
            case ISD.FGETSIGN:  return "fgetsign";

            case ISD.SETCC:       return "setcc";
            case ISD.VSETCC:      return "vsetcc";
            case ISD.SELECT:      return "select";
            case ISD.SELECT_CC:   return "select_cc";
            case ISD.INSERT_VECTOR_ELT:   return "insert_vector_elt";
            case ISD.EXTRACT_VECTOR_ELT:  return "extract_vector_elt";
            case ISD.CONCAT_VECTORS:      return "concat_vectors";
            case ISD.EXTRACT_SUBVECTOR:   return "extract_subvector";
            case ISD.SCALAR_TO_VECTOR:    return "scalar_to_vector";
            case ISD.VECTOR_SHUFFLE:      return "vector_shuffle";
            case ISD.CARRY_FALSE:         return "carry_false";
            case ISD.ADDC:        return "addc";
            case ISD.ADDE:        return "adde";
            case ISD.SADDO:       return "saddo";
            case ISD.UADDO:       return "uaddo";
            case ISD.SSUBO:       return "ssubo";
            case ISD.USUBO:       return "usubo";
            case ISD.SMULO:       return "smulo";
            case ISD.UMULO:       return "umulo";
            case ISD.SUBC:        return "subc";
            case ISD.SUBE:        return "sube";
            case ISD.SHL_PARTS:   return "shl_parts";
            case ISD.SRA_PARTS:   return "sra_parts";
            case ISD.SRL_PARTS:   return "srl_parts";

            // Conversion operators.
            case ISD.SIGN_EXTEND: return "sign_extend";
            case ISD.ZERO_EXTEND: return "zero_extend";
            case ISD.ANY_EXTEND:  return "any_extend";
            case ISD.SIGN_EXTEND_INREG: return "sign_extend_inreg";
            case ISD.TRUNCATE:    return "truncate";
            case ISD.FP_ROUND:    return "fp_round";
            case ISD.FLT_ROUNDS_: return "flt_rounds";
            case ISD.FP_ROUND_INREG: return "fp_round_inreg";
            case ISD.FP_EXTEND:   return "fp_extend";

            case ISD.SINT_TO_FP:  return "sint_to_fp";
            case ISD.UINT_TO_FP:  return "uint_to_fp";
            case ISD.FP_TO_SINT:  return "fp_to_sint";
            case ISD.FP_TO_UINT:  return "fp_to_uint";
            case ISD.BIT_CONVERT: return "bit_convert";

            case ISD.CONVERT_RNDSAT:
            {
                assert false:"Not supported!";
            }

            // Control flow instructions
            case ISD.BR:      return "br";
            case ISD.BRIND:   return "brind";
            case ISD.BR_JT:   return "br_jt";
            case ISD.BRCOND:  return "brcond";
            case ISD.BR_CC:   return "br_cc";
            case ISD.CALLSEQ_START:  return "callseq_start";
            case ISD.CALLSEQ_END:    return "callseq_end";

            // Other operators
            case ISD.LOAD:               return "load";
            case ISD.STORE:              return "store";
            case ISD.VAARG:              return "vaarg";
            case ISD.VACOPY:             return "vacopy";
            case ISD.VAEND:              return "vaend";
            case ISD.VASTART:            return "vastart";
            case ISD.DYNAMIC_STACKALLOC: return "dynamic_stackalloc";
            case ISD.EXTRACT_ELEMENT:    return "extract_element";
            case ISD.BUILD_PAIR:         return "build_pair";
            case ISD.STACKSAVE:          return "stacksave";
            case ISD.STACKRESTORE:       return "stackrestore";
            case ISD.TRAP:               return "trap";

            // Bit manipulation
            case ISD.BSWAP:   return "bswap";
            case ISD.CTPOP:   return "ctpop";
            case ISD.CTTZ:    return "cttz";
            case ISD.CTLZ:    return "ctlz";

            // Debug info
            case ISD.DBG_STOPPOINT: return "dbg_stoppoint";
            case ISD.DEBUG_LOC: return "debug_loc";

            // Trampolines
            case ISD.TRAMPOLINE: return "trampoline";

            case ISD.CONDCODE:
                switch (((CondCodeSDNode)this).getCondition())
                {
                    default: Util.shouldNotReachHere("Unknown setcc condition!");
                    case SETOEQ:  return "setoeq";
                    case SETOGT:  return "setogt";
                    case SETOGE:  return "setoge";
                    case SETOLT:  return "setolt";
                    case SETOLE:  return "setole";
                    case SETONE:  return "setone";

                    case SETO:    return "seto";
                    case SETUO:   return "setuo";
                    case SETUEQ:  return "setue";
                    case SETUGT:  return "setugt";
                    case SETUGE:  return "setuge";
                    case SETULT:  return "setult";
                    case SETULE:  return "setule";
                    case SETUNE:  return "setune";

                    case SETEQ:   return "seteq";
                    case SETGT:   return "setgt";
                    case SETGE:   return "setge";
                    case SETLT:   return "setlt";
                    case SETLE:   return "setle";
                    case SETNE:   return "setne";
              }
        }
    }

    public static String getIndexedModeName(MemIndexedMode am)
    {
        switch (am)
        {
            default: return "";
            case PRE_DEC:
                return "<pre-inc>";
            case POST_DEC:
                return "<post-inc>";
            case PRE_INC:
                return "<pre-inc>";
            case POST_INC:
                return "<post-inc>";
        }
    }

    public void printTypes(PrintStream os)
    {
        printTypes(os, null);
    }

    public void printTypes(PrintStream os, SelectionDAG dag)
    {
    }

    public void printDetails(PrintStream os, SelectionDAG dag)
    {
    }

    public void print(PrintStream os)
    {
        print(os, null);
    }

    public void print(PrintStream os, SelectionDAG dag)
    {
    }

    public void printr(PrintStream os, SelectionDAG dag)
    {
    }

    public void printr(PrintStream os)
    {
        printr(os, null);
    }

    public void dump()
    {
    }

    public void dumpr()
    {
    }

    public void dump(SelectionDAG dag)
    {

    }

    public void addUse(SDUse use)
    {
        assert use != null;
        useList.add(use);
    }

    public int compareTo(SDNode node)
    {
        return 0;
    }

    @Override
    public void profile(FoldingSetNodeID id)
    {
        SelectionDAG.addNodeToID(id, this);
    }

    static class SDVTList
    {
        EVT[] vts;
        int numVTs;

        public SDVTList()
        {}

        public SDVTList(EVT[] vts)
        {
            this.vts = vts;
            this.numVTs = vts.length;
        }
    }

    protected static SDVTList getSDVTList(EVT vt)
    {
        SDVTList list = new SDVTList();
        list.vts = new EVT[1];
        list.vts[0] = getValueTypeList(vt);
        list.numVTs = 1;
        return list;
    }

    protected SDNode(int opc, SDVTList vts, ArrayList<SDValue> ops)
    {
        this.opcode = opc;
        sublassData = 0;
        nodeID = -1;
        operandList = ops.size() != 0 ? new SDUse[ops.size()]: null;
        valueList = vts.vts;
        for (int i = 0; i < ops.size(); i++)
        {
            operandList[i].setUser(this);
            operandList[i].setInitial(ops.get(i));
        }
    }

    protected SDNode(int opc, SDVTList vts, SDValue[] ops)
    {
        this.opcode = opc;
        sublassData = 0;
        nodeID = -1;
        operandList = ops.length != 0 ? new SDUse[ops.length]: null;
        valueList = vts.vts;
        for (int i = 0; i < ops.length; i++)
        {
            operandList[i].setUser(this);
            operandList[i].setInitial(ops[i]);
        }
    }

    protected SDNode(int opc, SDVTList list)
    {
        opcode = opc;
        sublassData = 0;
        nodeID = -1;
        operandList = null;
        valueList = list.vts;
    }

    protected void initOperands(SDValue op0)
    {
        operandList = new SDUse[1];
        operandList[0] = new SDUse();
        operandList[0].setUser(this);
        operandList[0].setInitial(op0);
    }

    protected void initOperands(SDValue op0, SDValue op1)
    {
        operandList = new SDUse[2];
        operandList[0] = new SDUse();
        operandList[1] = new SDUse();
        operandList[0].setUser(this);
        operandList[0].setInitial(op0);
        operandList[1].setUser(this);
        operandList[2].setInitial(op1);
    }

    protected void initOperands(SDValue op0, SDValue op1, SDValue op2)
    {
        operandList = new SDUse[3];
        operandList[0] = new SDUse();
        operandList[1] = new SDUse();
        operandList[2] = new SDUse();

        operandList[0].setUser(this);
        operandList[0].setInitial(op0);
        operandList[1].setUser(this);
        operandList[1].setInitial(op1);
        operandList[2].setUser(this);
        operandList[2].setInitial(op2);
    }

    protected void initOperands(SDValue op0, SDValue op1, SDValue op2, SDValue op3)
    {
        operandList = new SDUse[4];
        operandList[0] = new SDUse();
        operandList[1] = new SDUse();
        operandList[2] = new SDUse();
        operandList[3] = new SDUse();

        operandList[0].setUser(this);
        operandList[0].setInitial(op0);
        operandList[1].setUser(this);
        operandList[1].setInitial(op1);
        operandList[2].setUser(this);
        operandList[2].setInitial(op2);
        operandList[3].setUser(this);
        operandList[3].setInitial(op3);
    }

    protected void initOperands(ArrayList<SDValue> vals)
    {
        assert vals != null && vals.size() > 0:"Illegal values for initialization!";
        operandList = new SDUse[vals.size()];
        for (int i = 0; i < operandList.length; i++)
        {
            operandList[i] = new SDUse();
            operandList[i].setUser(this);
            operandList[i].setInitial(vals.get(i));
        }
    }

    protected void initOperands(SDValue... vals)
    {
        assert vals != null && vals.length > 0:"Illegal values for initialization!";
        operandList = new SDUse[vals.length];
        for (int i = 0; i < operandList.length; i++)
        {
            operandList[i] = new SDUse();
            operandList[i].setUser(this);
            operandList[i].setInitial(vals[i]);
        }
    }

    protected void dropOperands()
    {
        for (SDUse anOperandList : operandList)
        {
            anOperandList.set(new SDValue());
        }
    }

    public static class UnarySDNode extends SDNode
    {
        public UnarySDNode(int opc, SDVTList vts, SDValue op)
        {
            super(opc, vts);
            initOperands(op);
        }
    }

    public static class BinarySDNode extends SDNode
    {
        public BinarySDNode(int opc, SDVTList vts, SDValue op0, SDValue op1)
        {
            super(opc, vts);
            initOperands(op0, op1);
        }
    }

    public static class TernarySDNode extends SDNode
    {
        public TernarySDNode(int opc, SDVTList vts, SDValue op0, SDValue op1, SDValue op2)
        {
            super(opc, vts);
            initOperands(op0, op1, op2);
        }
    }

    /**
     * SDNode for memory operation.
     */
    public static class MemSDNode extends SDNode
    {
        private EVT memoryVT;
        private Value srcValue;
        private int svOffset;

        public MemSDNode(int opc, SDVTList vts, EVT memVT, Value srcVal, int svOff,
                int alignment, boolean isVolatile)
        {
            super(opc, vts);
        }

        public MemSDNode(int opc, SDVTList vts, SDValue[] ops, EVT memVT,
                Value srcVal, int svOff, int alignment, boolean isVotatile)
        {
            super(opc, vts);
        }

        public int getAlignment()
        {
            return (1 << (sublassData >> 6)) >> 1;
        }

        public boolean isVolatile()
        {
            return ((sublassData >> 5) & 0x1) != 0;
        }

        public int getRawSubclassData()
        {
            return sublassData;
        }

        public Value getSrcValue()
        {
            return srcValue;
        }

        public int getSrcValueOffset()
        {
            return svOffset;
        }

        public EVT getMemoryVT()
        {
            return memoryVT;
        }

        public MachineMemOperand getMemOperand()
        {
            int flags = 0;
            if (this instanceof LoadSDNode)
                flags = MachineMemOperand.MOLoad;
            else if (this instanceof StoreSDNode)
                flags = MachineMemOperand.MOStore;
            else if (this instanceof AtomicSDNode)
                flags = MachineMemOperand.MOLoad | MachineMemOperand.MOStore;
            else
            {
                assert false:"MemIntrinsic not supported!";
            }
            // alignment it in 1 byte.
            int size = (getMemoryVT().getSizeInBits() + 7) >> 3;
            if (isVolatile()) flags |= MachineMemOperand.MOVolatile;

            FrameIndexSDNode fi = getBasePtr().getNode() instanceof FrameIndexSDNode? ((FrameIndexSDNode) getBasePtr().getNode()): null;
            if (getSrcValue() == null && fi != null)
            {
                return new MachineMemOperand(PseudoSourceValue.getFixedStack(fi.getFrameIndex()),
                        flags, 0, size, getAlignment());
            }
            else
                return new MachineMemOperand(getSrcValue(),
                        flags, getSrcValueOffset(), size, getAlignment());
        }

        public SDValue getChain()
        {
            return getOperand(0);
        }

        public SDValue getBasePtr()
        {
            return getOperand(getOpcode() == ISD.STORE ? 2 : 1);
        }
    }

    public static class AtomicSDNode extends MemSDNode
    {
        public AtomicSDNode(int opc, SDVTList vts,
                EVT memVT,
                SDValue chain,
                SDValue ptr,
                SDValue cmp,
                SDValue swp,
                Value srcVal)
        {
            this(opc, vts, memVT, chain, ptr, cmp, swp, srcVal, 0);
        }
        public AtomicSDNode(int opc, SDVTList vts,
                EVT memVT,
                SDValue chain,
                SDValue ptr,
                SDValue cmp,
                SDValue swp,
                Value srcVal,
                int align)
        {
            super(opc, vts, memVT, srcVal, 0, align, true);
            initOperands(chain, ptr, cmp, swp);
        }

        public AtomicSDNode(int opc, SDVTList vts,
                EVT memVT,
                SDValue chain,
                SDValue ptr,
                SDValue val,
                Value srcVal,
                int align)
        {
            super(opc, vts, memVT, srcVal, 0, align, true);
            initOperands(chain, ptr, val);
        }

        @Override
        public SDValue getBasePtr()
        {
            return getOperand(1);
        }

        public SDValue getVal()
        {
            return getOperand(2);
        }

        public boolean isCompareAndSwap()
        {
            return getOpcode() == ISD.ATOMIC_CMP_SWAP;
        }
    }

    public static class MemIntrinsicSDNode extends MemSDNode
    {
        private boolean raedMem;
        private boolean writeMem;

        public MemIntrinsicSDNode(int opc, SDVTList vts, SDValue[] ops,
                EVT memVT, Value srcValue, int svOff,
                int align, boolean isVotatile,
                boolean readMem,
                boolean writeMem)
        {
            super(opc, vts, ops, memVT, srcValue, svOff, align, isVotatile);
            this.raedMem = readMem;
            this.writeMem = writeMem;
        }

        public boolean isRaedMem()
        {
            return raedMem;
        }

        public boolean isWriteMem()
        {
            return writeMem;
        }
    }

    public static class ConstantSDNode extends SDNode
    {
        private ConstantInt value;
        public ConstantSDNode(boolean isTarget, ConstantInt val, EVT vt)
        {
            super(isTarget?ISD.TargetConstant : ISD.Constant, getSDVTList(vt));
            value = val;
        }

        public ConstantInt getConstantIntValue()
        {
            return value;
        }

        public APInt getAPIntValue()
        {
            return value.getValue();
        }

        public long getZExtValue()
        {
            return value.getZExtValue();
        }

        public long getSExtValue()
        {
            return value.getSExtValue();
        }

        public boolean isNullValue()
        {
            return value.isNullValue();
        }

        public boolean isAllOnesValue()
        {
            return value.isAllOnesValue();
        }
    }

    public static class ConstantFPSDNode extends SDNode
    {
        private ConstantFP value;
        public ConstantFPSDNode(boolean isTarget, ConstantFP val, EVT vt)
        {
            super(isTarget?ISD.TargetConstantFP:ISD.ConstantFP, getSDVTList(vt));;
            value = val;
        }

        public APFloat getValueAPF()
        {
            return value.getValueAPF();
        }

        public ConstantFP getConstantFPValue()
        {
            return value;
        }

        public boolean isExactlyValue(double v)
        {
            APFloat tmp = new APFloat(v);
            OutParamWrapper<Boolean> ignored = new OutParamWrapper<>(false);
            tmp.convert(value.getValueAPF().getSemantics(),
                    APFloat.RoundingMode.rmNearestTiesToEven, ignored);
            return isExactlyValue(tmp);
        }

        public boolean isExactlyValue(APFloat v)
        {
            return getValueAPF().bitwiseIsEqual(v);
        }

        public boolean isValueValidForType(EVT vt, APFloat val)
        {
            assert vt.isFloatingPoint():"Can only convert between FP types!";
            APFloat val2 = new APFloat(val);
            OutParamWrapper<Boolean> ignored = new OutParamWrapper<>(false);
            val2.convert(EVTToAPFloatSemantics(vt), APFloat.RoundingMode.rmNearestTiesToEven,
                    ignored);
            return !ignored.get();
        }
    }

    public static class GlobalAddressSDNode extends SDNode
    {
        private GlobalValue gv;
        private long offset;
        private int tsFlags;

        public GlobalAddressSDNode(int opc, EVT vt, GlobalValue gv, long off, int targetFlags)
        {
            super(opc, getSDVTList(vt));
            this.gv = gv;
            this.offset = off;
            this.tsFlags = targetFlags;
        }

        public GlobalValue getGlobalValue()
        {
            return gv;
        }

        public long getOffset()
        {
            return offset;
        }
        public int getTargetFlags()
        {
            return tsFlags;
        }
    }

    public static class FrameIndexSDNode extends SDNode
    {
        private int frameIndex;
        public FrameIndexSDNode(int fi, EVT vt, boolean isTarget)
        {
            super(isTarget?ISD.TargetFrameIndex:ISD.FrameIndex, getSDVTList(vt));
            this.frameIndex = fi;
        }

        public int getFrameIndex()
        {
            return frameIndex;
        }

        public void setFrameIndex(int frameIndex)
        {
            this.frameIndex = frameIndex;
        }
    }

    public static class JumpTableSDNode extends SDNode
    {
        private int jumpTableIndex;
        public JumpTableSDNode(int jit, EVT vt, boolean isTarget)
        {
            super(isTarget?ISD.TargetJumpTable:ISD.JumpTable, getSDVTList(vt));
            jumpTableIndex = jit;
        }

        public int getJumpTableIndex()
        {
            return jumpTableIndex;
        }

        public void setJumpTableIndex(int jumpTableIndex)
        {
            this.jumpTableIndex = jumpTableIndex;
        }
    }

    public static class ConstantPoolSDNode extends SDNode
    {
        private Object val;
        private int offset;
        private int align;
        private int targetFlags;
        public ConstantPoolSDNode(boolean isTarget, Constant cnt, EVT vt, int off, int align, int targetFlags)
        {
            super(isTarget?ISD.TargetConstantPool:ISD.ConstantPool, getSDVTList(vt));
            val = cnt;
            offset = off;
            this.align = align;
            this.targetFlags = targetFlags;
        }

        public ConstantPoolSDNode(boolean isTarget, MachineConstantPoolValue machPoolVal, EVT vt, int off, int align, int targetFlags)
        {
            super(isTarget?ISD.TargetConstantPool:ISD.ConstantPool, getSDVTList(vt));
            val = machPoolVal;
            offset = off;
            this.align = align;
            this.targetFlags = targetFlags;
        }

        public boolean isMachineConstantPoolValue()
        {
            return val instanceof MachineConstantPoolValue;
        }

        public Constant getConstantValue()
        {
            assert !isMachineConstantPoolValue();
            return (Constant)val;
        }

        public MachineConstantPoolValue getMachineConstantPoolValue()
        {
            assert isMachineConstantPoolValue();
            return (MachineConstantPoolValue)val;
        }

        public int getOffset()
        {
            return offset;
        }

        public int getAlign()
        {
            return align;
        }

        public int getTargetFlags()
        {
            return targetFlags;
        }
    }

    public static class BasicBlockSDNode extends SDNode
    {
        private BasicBlock bb;
        public BasicBlockSDNode(BasicBlock bb)
        {
            super(ISD.BasicBlock, getSDVTList(new EVT(MVT.Other)));
            this.bb = bb;
        }

        public BasicBlock getBasicBlock()
        {
            return bb;
        }
    }

    public static class MemOperandSDNode extends SDNode
    {
        private MachineMemOperand mmo;
        public MemOperandSDNode(MachineMemOperand mmo)
        {
            super(ISD.MEMOPERAND, getSDVTList(new EVT(MVT.Other)));
            this.mmo = mmo;
        }

        public MachineMemOperand getMachineMemOperand()
        {
            return mmo;
        }
    }

    public static class RegisterSDNode extends SDNode
    {
        private int reg;
        public RegisterSDNode(EVT vt, int reg)
        {
            super(ISD.Register, getSDVTList(vt));
            this.reg = reg;
        }

        public int getReg()
        {
            return reg;
        }
    }

    public static class LabelSDNode extends SDNode
    {
        private int labelID;
        public LabelSDNode(int nodeTy, EVT vt, SDValue ch, int labelID)
        {
            super(nodeTy, getSDVTList(vt));
            initOperands(ch);
            this.labelID = labelID;
        }

        public int getLabelID()
        {
            return labelID;
        }
    }

    public static class ExternalSymbolSDNode extends SDNode
    {
        private String extSymol;
        private int targetFlags;
        public ExternalSymbolSDNode(boolean isTarget, EVT vt, String sym, int flags)
        {
            super(isTarget? ISD.TargetExternalSymbol:ISD.ExternalSymbol, getSDVTList(vt));
            this.extSymol = sym;
            this.targetFlags = flags;
        }

        public String getExtSymol()
        {
            return extSymol;
        }

        public int getTargetFlags()
        {
            return targetFlags;
        }
    }

    public static class CondCodeSDNode extends SDNode
    {
        private CondCode condition;
        public CondCodeSDNode(CondCode cc)
        {
            super(ISD.CONDCODE, getSDVTList(new EVT(MVT.Other)));
            condition = cc;
        }

        public CondCode getCondition()
        {
            return condition;
        }
    }

    public static class VTSDNode extends SDNode
    {
        private EVT vt;
        public VTSDNode(EVT vt)
        {
            super(ISD.VALUETYPE, getSDVTList(new EVT(MVT.Other)));
            this.vt = vt;
        }

        public EVT getVT()
        {
            return vt;
        }
    }

    public static class LSBaseSDNode extends MemSDNode
    {
        public LSBaseSDNode(int nodeTy, SDValue[] operands, SDVTList vts,
                            MemIndexedMode mode, EVT vt, Value srcVal,
                            int srcOff,
                            int alig,
                            boolean isVolatile)
        {
            super(nodeTy, vts, vt, srcVal ,srcOff, alig, isVolatile);
            assert alig != 0 :"Loads and Stores should have non-zero alignment!";
            sublassData |= mode.ordinal() << 2;
            assert getAddressingMode() == mode;
            initOperands(operands);
            assert getOffset().getOpcode() == ISD.UNDEF || isIndexed() :
                    "Only indexed loads and stores have a non-undef offset operand!";
        }

        public SDValue getOffset()
        {
            return getOperand(getOpcode() == ISD.LOAD ? 2 : 3);
        }

        public MemIndexedMode getAddressingMode()
        {
            return MemIndexedMode.values()[(sublassData >> 2)&7];
        }

        public boolean isIndexed()
        {
            return getAddressingMode() != MemIndexedMode.UNINDEXED;
        }

        public boolean isUnindexed()
        {
            return !isIndexed();
        }
    }

    public static class LoadSDNode extends LSBaseSDNode
    {
        public LoadSDNode(SDValue[] chainPtrOff, SDVTList vts, MemIndexedMode mode,
                          LoadExtType ety, EVT vt, Value sv, int offset, int align,
                          boolean isVolatile)
        {
            super(ISD.LOAD, chainPtrOff, vts, mode, vt, sv, offset, align, isVolatile);
            sublassData |= ety.ordinal();
            assert getExtensionType() == ety :"LoadExtType encoding error!";
        }

        public LoadExtType getExtensionType()
        {
            return LoadExtType.values()[sublassData & 3];
        }

        @Override
        public SDValue getBasePtr()
        {
            return getOperand(1);
        }

        @Override
        public SDValue getOffset()
        {
            return getOperand(2);
        }
    }

    public static class StoreSDNode extends LSBaseSDNode
    {
        public StoreSDNode(SDValue[] chainPtrOff, SDVTList vts, MemIndexedMode mode,
                           boolean isTrunc, EVT vt, Value sv, int offset, int align,
                           boolean isVolatile)
        {
            super(ISD.STORE, chainPtrOff, vts, mode, vt, sv, offset, align, isVolatile);
            sublassData |= isTrunc?1:0;
            assert isTruncatingStore() == isTrunc;
        }

        public boolean isTruncatingStore()
        {
            return (sublassData&1) != 0;
        }

        public SDValue getValue()
        {
            return getOperand(1);
        }

        @Override
        public SDValue getBasePtr()
        {
            return getOperand(2);
        }

        @Override
        public SDValue getOffset()
        {
            return getOperand(3);
        }
    }

    public static class HandleSDNode extends SDNode
    {
        public HandleSDNode(SDValue x)
        {
            super(ISD.HANDLENODE, getSDVTList(new EVT(MVT.Other)));
            initOperands(x);
        }

        public SDValue getValue()
        {
            return getOperand(0);
        }
    }

    public static class CvtRndSatSDNode extends SDNode
    {
        private CvtCode code;

        public CvtRndSatSDNode(EVT vt, CvtCode code, SDValue[] ops)
        {
            super(ISD.CONVERT_RNDSAT, getSDVTList(vt), ops);
            this.code = code;
        }
        public CvtCode getCvtCode()
        {
            return code;
        }
    }

    public static class ShuffleVectorSDNode extends SDNode
    {
        public ShuffleVectorSDNode(int opc, SDVTList vts, ArrayList<SDValue> ops) {
            super(opc, vts, ops);
        }

        public boolean isSplat()
        {
            return false;
        }

        public int getSplatIndex()
        {
            return 0;
        }
    }
}