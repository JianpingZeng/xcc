/*
 * Extremely Compiler Collection
 * Copyright (c) 2015-2020, Jianping Zeng.
 * All rights reserved.
 * This software is subjected to the protection of BSD 3.0 Licence.
 * For more details, please refers to the LICENSE file.
 */

package utils.dis;

import backend.support.LLVMContext;
import backend.value.Module;
import tools.*;
import tools.commandline.CL;
import tools.commandline.FormattingFlagsApplicator;
import tools.commandline.StringOpt;

import java.io.FileOutputStream;

import static tools.commandline.Desc.desc;
import static tools.commandline.FormattingFlags.Positional;
import static tools.commandline.Initializer.init;
import static tools.commandline.OptionNameApplicator.optionName;
import static tools.commandline.ValueDesc.valueDesc;

public class DIS {
    private static final StringOpt InputFilename =
            new StringOpt(new FormattingFlagsApplicator(Positional),
                    desc("<input LLVM Bitcode file>"),
                    init("-"),
                    valueDesc("filename"));
    private static final StringOpt OutputFilename =
            new StringOpt(optionName("o"), desc("Override output filename"),
                    valueDesc("filename"),
                    init(""));
    public static void main(String[] args) {
        String[] temp;
        if (args[0].equals("llvm-dis")) {
            temp = args;
        } else {
            temp = new String[args.length + 1];
            temp[0] = "llvm-dis";
            System.arraycopy(args, 0, temp, 1, args.length);
        }

        new PrintStackTraceProgram(temp);
        CL.parseCommandLineOptions(args, "The LLVM IR Disassembler");

        OutRef<SMDiagnostic> diag = new OutRef<>();
        Module theModule = backend.llReader.Parser.parseAssemblyFile(InputFilename.value, diag,
                LLVMContext.getGlobalContext());
        if (theModule == null) {
            diag.get().print("llvm-dis", System.err);
            System.exit(0);
        }
        FormattedOutputStream os;
        if (OutputFilename.value.equals("-") || (OutputFilename.value.isEmpty() && InputFilename.value.equals("-"))) {
            System.out.println("warning: write LLVM IR to standard out");
            os = new FormattedOutputStream(System.out);
            theModule.print(os);
        } else {
            if (OutputFilename.value.isEmpty()) {
                OutputFilename.value = InputFilename.value.split("\\.")[0] + ".ll";
            }
            try {
                os = new FormattedOutputStream(new FileOutputStream(OutputFilename.value));
                theModule.print(os);
                os.close();
            } catch (Exception e) {
                e.printStackTrace();
                System.err.println("error on write LLVM bitcode to text IR");
            }
        }
    }
}
