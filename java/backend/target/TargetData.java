package backend.target;

import backend.pass.AnalysisResolver;
import backend.pass.ImmutablePass;
import backend.support.LLVMContext;
import backend.type.*;
import backend.value.ConstantInt;
import backend.value.GlobalVariable;
import backend.value.Module;
import backend.value.Value;
import tools.Util;

import java.io.PrintStream;
import java.util.ArrayList;

import static backend.target.TargetData.AlignTypeEnum.*;
import static backend.type.LLVMTypeID.*;

/**
 * @author Jianping Zeng
 * @version 0.4
 */
public class TargetData implements ImmutablePass {
  /**
   * Enum used to categorise the alignment types stored by TargetAlignElem.
   */
  public enum AlignTypeEnum {
    INTEGER_ALIGN('i'),
    VECTOR_ALIGN('v'),
    FLOAT_ALIGN('f'),
    AGGREGATE_ALIGN('a'),
    STACK_ALIGN('s');

    public char name;

    AlignTypeEnum(char name) {
      this.name = name;
    }
  }

  public static class TargetAlignElem {
    public AlignTypeEnum alignType;
    public byte abiAlign;
    public byte prefAlign;
    public int typeBitWidth;

    public static TargetAlignElem get(
        AlignTypeEnum alignType,
        byte abiAlign,
        byte prefAlign,
        int typeBitWidth) {
      Util.assertion(abiAlign <= prefAlign, "Preferred alignment worse than ABI");
      TargetAlignElem elem = new TargetAlignElem();
      elem.alignType = alignType;
      elem.abiAlign = abiAlign;
      elem.prefAlign = prefAlign;
      elem.typeBitWidth = typeBitWidth;
      return elem;
    }

    @Override
    public boolean equals(Object obj) {
      if (obj == null) return false;
      if (this == obj) return true;

      if (getClass() != obj.getClass()) return false;

      TargetAlignElem elem = (TargetAlignElem) obj;
      return alignType == elem.alignType && abiAlign == elem.abiAlign
          && prefAlign == elem.prefAlign && typeBitWidth == elem.typeBitWidth;
    }

    public PrintStream dump(PrintStream os) {
      os.printf("%s%d:%d:%d", alignType.name, typeBitWidth, abiAlign * 8, prefAlign * 8);
      return os;
    }
  }

  /**
   * default to false.
   */
  private boolean littleEndian;
  /**
   * default to 1.
   */
  private int byteAlignment;
  /**
   * default to 2.
   */
  private int shortAlignment;
  /**
   * default to 4.
   */
  private int intAlignment;
  /**
   * default to 8.
   */
  private int longAlignment;
  /**
   * default to 4.
   */
  private int floatAlignment;
  /**
   * default to 8.
   */
  private int doubleAlignment;
  /**
   * Pointer size in bytes by default to 8.
   */
  private int pointerMemSize;

  private int pointerABIAlign;
  /**
   * default to 8.
   */
  private int pointerPrefAlign;

  /**
   * default to "".
   */
  private String targetName;

  private ArrayList<TargetAlignElem> alignments;
  private AnalysisResolver resolver;

  @Override
  public void setAnalysisResolver(AnalysisResolver resolver) {
    this.resolver = resolver;
  }

  @Override
  public AnalysisResolver getAnalysisResolver() {
    return resolver;
  }

  public TargetData(String targetDescription) {
    littleEndian = false;
    pointerMemSize = 8;
    pointerPrefAlign = 8;
    doubleAlignment = 8;
    floatAlignment = 4;
    longAlignment = 8;
    intAlignment = 4;
    shortAlignment = 2;
    byteAlignment = 1;
    alignments = new ArrayList<>();
    init(targetDescription);
  }

  public TargetData(Module m) {
    alignments = new ArrayList<>();
    String dataLayout = m.getDataLayout();
    Util.assertion(dataLayout != null && !dataLayout.isEmpty());
    init(dataLayout);
  }

  /**
   * A TargetDescription string consists of a sequence of hyphen-delimited
   * specifiers for target endianness, pointer size and alignments, and various
   * primitive type sizes and alignments. A typical string looks something like:
   * <br><br>
   * "E-p:32:32:32-i1:8:8-i8:8:8-i32:32:32-i64:32:64-f32:32:32-f64:32:64"
   * <br><br>
   * (note: this string is not fully specified and is only an example.)
   * <p>
   * Alignments come in two flavors: ABI and preferred. ABI alignment (abi_align,
   * below) dictates how a type will be aligned within an aggregate and when used
   * as an argument.  Preferred alignment (pref_align, below) determines a type's
   * alignment when emitted as a global.
   * </p>
   * <p>
   * Specifier string details:
   * <br><br>
   * <i>[E|e]</i>: Endianness. "E" specifies a big-endian target data model, "e"
   * specifies a little-endian target data model.
   * <br><br>
   * <i>p:@verbatim<size>:<abi_align>:<pref_align>@endverbatim</i>: Pointer size,
   * ABI and preferred alignment.
   * <br><br>
   * <i>@verbatim<type><size>:<abi_align>:<pref_align>@endverbatim</i>: Numeric type
   * alignment. Type is
   * one of <i>i|f|v|a</i>, corresponding to integer, floating point, vector, or
   * aggregate.  Size indicates the size, e.g., 32 or 64 bits.
   * </p>
   * The default string, fully specified, is:
   * <br><br>
   * "E-p:64:64:64-a0:0:8-f32:32:32-f64:64:64"
   * "-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64"
   * "-v64:64:64-v128:128:128"
   * <br><br>
   * Note that in the case of aggregates, 0 is the default ABI and preferred
   * alignment. This is a special case, where the aggregate's computed worst-case
   * alignment will be used.
   */
  private void init(String targetDescription) {
    StringBuilder temp = new StringBuilder(targetDescription);

    littleEndian = false;
    pointerMemSize = 8;
    pointerABIAlign = pointerPrefAlign = 8;

    // Default alignments.
    setAlignment(AlignTypeEnum.INTEGER_ALIGN, (byte) 1, (byte) 1, (byte) 1); // i1
    setAlignment(AlignTypeEnum.INTEGER_ALIGN, (byte) 1, (byte) 1, (byte) 8); // i8
    setAlignment(AlignTypeEnum.INTEGER_ALIGN, (byte) 2, (byte) 2, (byte) 16); // i16
    setAlignment(AlignTypeEnum.INTEGER_ALIGN, (byte) 4, (byte) 4, (byte) 32); // i32
    setAlignment(AlignTypeEnum.INTEGER_ALIGN, (byte) 8, (byte) 8, (byte) 64); // i64
    setAlignment(AlignTypeEnum.FLOAT_ALIGN, (byte) 4, (byte) 4, (byte) 32); // f32
    setAlignment(AlignTypeEnum.FLOAT_ALIGN, (byte) 8, (byte) 8, (byte) 64); // f64
    setAlignment(AlignTypeEnum.VECTOR_ALIGN, (byte) 8, (byte) 8, (byte) 64); // v2i32, v1i64
    setAlignment(AlignTypeEnum.VECTOR_ALIGN, (byte) 16, (byte) 16, (byte) 128); // v16i8, v8i16, v4i32,...
    setAlignment(AGGREGATE_ALIGN, (byte) 0, (byte) 8, (byte) 0); // struct

    while (temp.length() != 0) {

      String token = getToken(temp, "-");
      StringBuilder token2 = new StringBuilder(token);
      String arg0 = getToken(token2, ":");
      int i = 0;
      switch (arg0.charAt(i)) {
        case 'E':
          littleEndian = false;
          break;
        case 'e':
          littleEndian = true;
          break;
        case 'p':
          pointerMemSize = Integer.parseInt(getToken(token2, ":")) / 8;
          pointerABIAlign = Integer.parseInt(getToken(token2, ":")) / 8;
          pointerPrefAlign = Integer.parseInt(getToken(token2, ":")) / 8;

          if (pointerPrefAlign == 0)
            pointerPrefAlign = pointerABIAlign;
          break;
        case 'i':
        case 'v':
        case 'f':
        case 's':
        case 'a': {
          AlignTypeEnum alignType = AlignTypeEnum.STACK_ALIGN;
          switch (arg0.charAt(i)) {
            case 'i':
              alignType = AlignTypeEnum.INTEGER_ALIGN;
              break;
            case 'v':
              alignType = AlignTypeEnum.VECTOR_ALIGN;
              break;
            case 'f':
              alignType = AlignTypeEnum.FLOAT_ALIGN;
              break;
            case 's':
              alignType = AlignTypeEnum.STACK_ALIGN;
              break;
            case 'a':
              alignType = AGGREGATE_ALIGN;
              break;
          }

          int size = arg0.length() <= 1 ? 0 :
              Integer.parseInt(String.valueOf(arg0.charAt(1)));
          byte abiAlign = (byte) (Integer.parseUnsignedInt(getToken(token2, ":")) / (byte) 8);
          byte prefAlign = (byte) (Integer.parseUnsignedInt(getToken(token2, ":")) / 8);
          if (prefAlign == 0)
            prefAlign = abiAlign;
          setAlignment(alignType, abiAlign, prefAlign, size);
          break;
        }
        default:
          break;
      }
    }
  }

  private String getToken(StringBuilder str, String delimiters) {
    String src = str.toString();
    if (src.isEmpty()) return "0";

    int start = Util.findFirstNonOf(src, delimiters);
    int end = Util.findFirstOf(src, delimiters, start);
    if (end < 0)
      end = src.length();

    String result = str.substring(start, end);
    str.delete(0, end);
    return result;
  }

  private void setAlignment(AlignTypeEnum alignType, byte abiAlign, byte prefAlign, int bitWidth) {
    Util.assertion(abiAlign <= prefAlign, "Preferred alignment worse than abi alignemnt.");
    for (int i = 0, e = alignments.size(); i < e; ++i) {
      if (alignments.get(i).alignType == alignType
          && alignments.get(i).typeBitWidth == bitWidth) {
        // Update the abi, prefered alignments.
        alignments.get(i).abiAlign = abiAlign;
        alignments.get(i).prefAlign = prefAlign;
        return;
      }
    }
    alignments.add(TargetAlignElem.get(alignType, abiAlign, prefAlign, bitWidth));
  }

  public TargetData(String targetName, boolean isLittleEndian, int ptrSize,
                    int ptrAlign, int doubleAlign, int floatAlign, int longAlign, int intAlign,
                    int shortAlign, int byteAlign) {
    this.targetName = targetName;
    littleEndian = isLittleEndian;
    pointerMemSize = ptrSize;
    pointerPrefAlign = ptrAlign;
    doubleAlignment = doubleAlign;
    Util.assertion(pointerPrefAlign == doubleAlignment);
    floatAlignment = floatAlign;
    longAlignment = longAlign;
    intAlignment = intAlign;
    shortAlignment = shortAlign;
    byteAlignment = byteAlign;
  }

  public TargetData(TargetData td) {
    targetName = td.getTargetName();
    littleEndian = td.isLittleEndian();
    pointerMemSize = td.pointerMemSize;
    pointerPrefAlign = td.pointerPrefAlign;
    doubleAlignment = td.doubleAlignment;
    floatAlignment = td.floatAlignment;
    longAlignment = td.longAlignment;
    intAlignment = td.intAlignment;
    shortAlignment = td.shortAlignment;
    byteAlignment = td.byteAlignment;
    alignments = new ArrayList<>(td.alignments);
    resolver = td.resolver;
  }

  public IntegerType getIntPtrType() {
    return IntegerType.get(getPointerSizeInBits());
  }

  public int getPointerSizeInBits() {
    return pointerMemSize * 8;
  }

  public int getPointerSize() {
    return pointerMemSize;
  }

  public long getTypeSizeInBits(Type type) {
    Util.assertion(type.isSized(), "Can not getTypeInfo for unsized type");

    switch (type.getTypeID()) {
      case Type.VoidTyID:
        return 8;
      case Type.IntegerTyID:
        return ((IntegerType) type).getBitWidth();
      case Type.FloatTyID:
        return 32;
      case Type.DoubleTyID:
        return 64;
      case X86_FP80TyID:
        return 80;
      case FP128TyID:
        return 128;

      case LabelTyID:
      case Type.PointerTyID:
        return getPointerSizeInBits();
      case Type.ArrayTyID: {
        ArrayType aty = (ArrayType) type;
        return getTypeAllocSize(aty.getElementType()) * aty.getNumElements() * 8;
      }
      case Type.StructTyID: {
        // Get the struct layout annotation, which is createed lazily on demand.
        return getStructLayout((StructType) type).getSizeInBits();
      }
      default: {
        Util.assertion(false, "Bad type for getTypeInfo!");
        break;
      }
    }
    return 0;
  }

  public long getTypeSize(Type type) {
    return getTypeSizeInBits(type) / 8;
  }

  public int getTypeAlign(Type type) {
    return getAlignment(type, true);
  }

  public boolean isLittleEndian() {
    return littleEndian;
  }

  public boolean isBigEndidan() {
    return !littleEndian;
  }

  public int getByteAlignment() {
    return byteAlignment;
  }

  public int getShortAlignment() {
    return shortAlignment;
  }

  public int getIntAlignment() {
    return intAlignment;
  }

  public int getLongAlignment() {
    return longAlignment;
  }

  public int getFloatAlignment() {
    return floatAlignment;
  }

  public int getDoubleAlignment() {
    return doubleAlignment;
  }

  public int getPointerMemSize() {
    return pointerMemSize;
  }

  public int getPointerPrefAlign() {
    return pointerPrefAlign;
  }

  public int getPointerABIAlign() {
    return pointerABIAlign;
  }

  public String getTargetName() {
    return targetName;
  }

  public StructLayout getStructLayout(StructType ty) {
    return new StructLayout(ty, this);
  }

  @Override
  public String getPassName() {
    return "Target Data pass!";
  }

  /**
   * This class is used to lazily compute structure layout information for
   * a backend.target machine, based on this TargetData structure.
   */
  public static class StructLayout {
    public ArrayList<Long> memberOffsets;
    public long structSize;
    int structAlignment;

    private StructLayout(StructType st, TargetData td) {
      structAlignment = 0;
      structSize = 0;
      memberOffsets = new ArrayList<>();
      // Loop over each element in struct type, placing them in memory.
      for (int i = 0, e = st.getNumOfElements(); i != e; i++) {
        Type eltTy = st.getElementType(i);
        long tySize = td.getTypeSize(eltTy);
        int tyAlign = td.getTypeAlign(eltTy);

        // Add padding if necessary to make the data alignment properly.
        if (structSize % tyAlign != 0) {
          // add padding.
          structSize = Util.roundUp(structSize, tyAlign);
        }

        // Keep track of maximum alignment constraints.
        structAlignment = Math.max(tyAlign, structAlignment);

        memberOffsets.add(structSize);
        structSize += tySize;
      }

      // Empty structure has one alignment
      if (structAlignment == 0) structAlignment = 1;

      // Add padding to the end of struct so that it could be put in an array
      // and all array element all be aligned correctly.
      if (structSize % structAlignment != 0)
        structSize = Util.roundUp(structSize, structAlignment);
    }

    public int getAlignment() {
      return structAlignment;
    }

    public long getSizeInBits() {
      return structSize * 8;
    }

    public long getSizeInBytes() {
      return structSize;
    }

    public long getElementOffset(long idx) {
      Util.assertion(idx >= 0 && idx < memberOffsets.size());
      return memberOffsets.get((int) idx);
    }

    public long getElementOffsetInBits(long idx) {
      Util.assertion(idx >= 0 && idx < memberOffsets.size());
      return memberOffsets.get((int) idx) * 8;
    }

    /**
     * Given a valid offset into the structure,
     * return the structure index that contains it.
     *
     * @param offset
     * @return
     */
    public int getElementContainingOffset(long offset) {
      int index = 0;
      for (int e = memberOffsets.size(); index < e; ++index) {
        if (memberOffsets.get(index) >= offset)
          continue;
        break;
      }
      Util.assertion(index != 0, "offset isn't in this structure!");
      ;
      --index;
      Util.assertion(memberOffsets.get(index) <= offset,
          "Upper bound search didn't work!");
      Util.assertion(index == 0 || memberOffsets.get(index - 1) <= offset,
          "Upper bound search didn't work!");
      return index;
    }
  }

  /**
   * Return the maximum number of bytes that may be
   * overwritten by storing the specified type.  For example, returns 5
   * for i36 and 10 for x86_fp80.
   *
   * @param ty
   * @return
   */
  public long getTypeStoreSize(Type ty) {
    return (getTypeSizeInBits(ty) + 7) / 8;
  }

  public int getAlignment(Type ty, boolean abiOrPref) {
    AlignTypeEnum alignType = null;
    Util.assertion(ty.isSized(), "Cannot getTypeInfo() on a type that is unsized");
    switch (ty.getTypeID()) {
      case LabelTyID:
      case PointerTyID:
        return abiOrPref ? getPointerABIAlign() : getPointerPrefAlign();
      case ArrayTyID:
        return getAlignment(((ArrayType) ty).getElementType(), abiOrPref);
      case StructTyID: {
        StructType st = (StructType) ty;
        if (st.isPacked() && abiOrPref)
          return 1;

        StructLayout layout = getStructLayout(st);
        int align = getAlignmentInfo(AGGREGATE_ALIGN, 0, abiOrPref, ty);
        return Math.max(align, layout.getAlignment());
      }
      case IntegerTyID:
      case VoidTyID:
        alignType = INTEGER_ALIGN;
        break;
      case FloatTyID:
      case DoubleTyID:
      case X86_FP80TyID:
      case FP128TyID:
        alignType = FLOAT_ALIGN;
        break;
      default:
        Util.shouldNotReachHere("Bad type for getAlignemnt!");
        break;
    }
    return getAlignmentInfo(alignType, (int) getTypeSizeInBits(ty), abiOrPref, ty);
  }

  private int getAlignmentInfo(
      AlignTypeEnum alignType,
      int bitwidth,
      boolean abiInfo,
      Type ty) {
    int bestMatchIdx = -1;
    int largestInt = -1;
    for (int i = 0, e = alignments.size(); i < e; i++) {
      if (alignments.get(i).alignType == alignType
          && alignments.get(i).typeBitWidth == bitwidth)
        return abiInfo ? alignments.get(i).abiAlign : alignments.get(i).prefAlign;

      if (alignType == INTEGER_ALIGN && alignments.get(i).alignType == INTEGER_ALIGN) {
        if (alignments.get(i).typeBitWidth > bitwidth
            && (bestMatchIdx == -1 || alignments.get(i).typeBitWidth
            < alignments.get(bestMatchIdx).typeBitWidth))
          bestMatchIdx = i;

        if (largestInt == -1 || alignments.get(i).typeBitWidth > alignments.get(largestInt)
            .typeBitWidth)
          largestInt = i;
      }
    }

    if (bestMatchIdx == -1) {
      if (alignType == INTEGER_ALIGN) {
        bestMatchIdx = largestInt;
      } else {
        Util.assertion(false, "Unknown alignment type!");
      }
    }
    return abiInfo ? alignments.get(bestMatchIdx).abiAlign : alignments.get(bestMatchIdx).prefAlign;
  }

  public int getABITypeAlignment(Type ty) {
    return getAlignment(ty, true);
  }

  public static long roundUpAlignment(long val, long aligment) {
    Util.assertion((aligment & (aligment - 1)) == 0, "Alignment must be power of 2!");
    return (val + aligment - 1) & ~(aligment - 1);
  }

  public long getTypeAllocSize(Type ty) {
    return roundUpAlignment(getTypeStoreSize(ty), getABITypeAlignment(ty));
  }

  public long getTypeAllocSizeInBits(Type ty) {
    return getTypeAllocSize(ty) * 8;
  }

  public int getPrefTypeAlignment(Type type) {
    return getAlignment(type, false);
  }

  public int getPreferredAlignment(GlobalVariable gv) {
    Type eleType = gv.getType().getElementType();
    int alignment = getPrefTypeAlignment(eleType);
    if (gv.getAlignment() > alignment)
      alignment = gv.getAlignment();

    if (gv.hasInitializer()) {
      if (alignment < 16) {
        // If the global is not external, see if it is large.  If so, give it a
        // larger alignment.
        if (getTypeSizeInBits(eleType) > 128)
          alignment = 16; // 16 byte alignment
      }
    }
    return alignment;
  }

  public long getTypePaddedSize(Type ty) {
    return roundUpAlignment(getTypeStoreSize(ty), getABITypeAlignment(ty));
  }

  public int getCallFrameTypeAlignment(Type ty) {
    for (TargetAlignElem elt : alignments) {
      if (elt.alignType == STACK_ALIGN)
        return elt.abiAlign;
    }
    return getABITypeAlignment(ty);
  }

  public long getIndexedOffset(Type ty, ArrayList<Value> indices) {
    Util.assertion(ty.isPointerType(), "Illegal argument for getIndexedOffset");
    long result = 0;

    for (int idx = 0, e = indices.size(); idx < e; ++idx) {
      if (ty instanceof StructType) {
        StructType sty = (StructType) ty;
        Util.assertion(indices.get(idx).getType().equals(LLVMContext.Int32Ty));
        long fieldNo = ((ConstantInt)indices.get(idx)).getZExtValue();
        StructLayout layout = getStructLayout(sty);
        result += layout.getElementOffset(fieldNo);

        ty = sty.getElementType((int) fieldNo);
      }
      else {
        ty = ((SequentialType)ty).getElementType();
        long arrayIdx = ((ConstantInt)indices.get(idx)).getSExtValue();
        result += arrayIdx * getTypeAllocSize(ty);
      }
    }
    return result;
  }
}
