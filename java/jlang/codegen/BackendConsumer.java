package jlang.codegen;
/*
 * Xlous C language CompilerInstance
 * Copyright (c) 2015-2016, Xlous
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

import backend.hir.BasicBlock;
import backend.hir.Module;
import backend.pass.*;
import backend.target.TargetData;
import backend.target.TargetMachine;
import backend.target.TargetMachine.CodeGenOpt;
import jlang.ast.ASTConsumer;
import jlang.basic.BackendAction;
import jlang.basic.CompileOptions;
import jlang.basic.LangOptions;
import jlang.diag.Diagnostic;
import jlang.sema.ASTContext;
import jlang.sema.Decl;
import tools.Context;
import tools.Log;
import tools.Options;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.function.Function;

import static backend.target.TargetMachine.CodeGenFileType.AssemblyFile;
import static backend.target.TargetMachine.CodeGenOpt.*;
import static jlang.basic.BackendAction.*;

/**
 * <p>
 * This class is responsible for transforming external declaration in a
 * translation unit, like global variable declaration and function definition
 * , into implementation corresponding to Higher Level Representation.
 * </p>
 * <p>
 * For function definition, each statement contained in it would be lowered into
 * HIR instruction contained in {@linkplain BasicBlock}.
 * For the same methodology, global variable declaration would be viewed as
 * Constant value in HIR.
 * </p>
 * <p>
 * As the consequence, a {@linkplain Module} would be obtained which holds many
 * element, for example, Functions in HIR perspective, global Constants.
 * </p>
 * @see ASTConsumer
 * @see ASTContext
 * @author Xlous.zeng
 * @version 0.1
 */
public class BackendConsumer extends ASTConsumer
{
    private CompileOptions compileOptions;
    private BackendAction action;
    private Diagnostic diags;
    private LangOptions langOpts;
    private Module theModule;
    private HIRModuleGenerator gen;
    private OutputStream asmOutStream;
    private TargetData theTargetData;
    private TargetMachine theTargetMachine;
    private ASTContext context;

    private FunctionPassManager perFunctionPasses;
    private PassManager perModulePasses;
    private FunctionPassManager perCodeGenPasses;

    public BackendConsumer(
            BackendAction act,
            Diagnostic diags,
            LangOptions langOpts,
            CompileOptions opts,
            String moduleName,
            OutputStream os,
            Function<Module, TargetMachine> targetMachineAllocator)
    {
        action = act;
        this.diags = diags;
        this.langOpts = langOpts;
        compileOptions = opts;
        theModule = new Module(moduleName);
        gen = new HIRModuleGenerator(theModule);
        asmOutStream = os;
        theTargetMachine = targetMachineAllocator.apply(theModule);
        theTargetData = theTargetMachine.getTargetData();
    }

    public static ASTConsumer createBackendConsumer(
            BackendAction act,
            Diagnostic diags,
            LangOptions langOpts,
            CompileOptions compOpts,
            String moduleID,
            OutputStream os,
            Function<Module, TargetMachine> targetMachine)
    {
        return new BackendConsumer(act, diags, langOpts, compOpts, moduleID, os, targetMachine);
    }

    /**
     * This method is invoked for initializing this ASTConsumer.
     *
     */
    @Override
    public void initialize(ASTContext ctx)
    {
        context = ctx;

        gen.initialize(ctx);

        theModule = gen.getModule();
        theTargetData = new TargetData(ctx.getTargetDescription());
    }

    /**
     * Handle the specified top level declaration.
     * This method is called by {@linkplain Compiler} to process every top-level
     * decl.
     * <b>Note that</b> decls is a list that chained multiple Declaration, like
     * <code>'int a, b'</code>, there are two declarator chained.
     *
     * @param decls
     */
    @Override
    public void handleTopLevelDecls(ArrayList<Decl> decls)
    {
        for (Decl d : decls)
        {
            // Make sure that emits all elements for each decl.
            gen.emitTopLevelDecl(d);
        }
    }

    /**
     * This method is called when the parsing file for entire translation unit
     * was parsed.
     *
     */
    @Override
    public void handleTranslationUnit()
    {
        // Emits assembly code or hir code for backend.target.
        emitAssembly();

        // force to close and flush output stream.
        if (asmOutStream != null)
        {
            try
            {
                asmOutStream.close();
            }
            catch (IOException e)
            {
                e.printStackTrace();
            }
        }
    }

	/**
     * Handle to interactive with backend to generate actual machine code
     * or assembly code.
     */
    private void emitAssembly()
    {
        // Silently ignore generating code, if backend.target data or module is null.
        if (theTargetData == null || theModule == null)
            return;

        assert theModule == gen.getModule()
                :"Unexpected module change when IR generation";

        // creates some necessary pass for code generation and optimization.
        createPass();
        StringBuilder error = new StringBuilder();
        if (!addEmitPasses(error))
        {
            System.err.println("UNKNOWN: " + error.toString());
            System.exit(-1);
        }

        // Run passes. For now we do all passes at once.
        if (perFunctionPasses != null)
        {
            for (backend.value.Function f : theModule.getFunctionList())
                if (!f.isDeclaration())
                    perFunctionPasses.run(f);
        }

        if (perModulePasses != null)
        {
            perModulePasses.run(theModule);
        }

        // performing a serial of code gen procedures, like instruction selection,
        // register allocation, and instruction scheduling etc.
        if (perCodeGenPasses != null)
        {
            for (backend.value.Function f : theModule.getFunctionList())
                if (!f.isDeclaration())
                    perCodeGenPasses.run(f);
        }
    }

    private FunctionPassManager getPerFunctionPasses()
    {
        if (perFunctionPasses == null)
        {
            perFunctionPasses = new FunctionPassManager();
            perFunctionPasses.add(new TargetData(theTargetData));
        }
        return perFunctionPasses;
    }

    private PassManager getPerModulePasses()
    {
        if (perModulePasses == null)
        {
            perModulePasses = new PassManager();
            perModulePasses.add(new TargetData(theTargetData));;
        }
        return perModulePasses;
    }

    private FunctionPassManager getCodeGenPasses()
    {
        if (perCodeGenPasses == null)
        {
            perCodeGenPasses = new FunctionPassManager();
            perCodeGenPasses.add(new TargetData(theTargetData));;
        }
        return perCodeGenPasses;
    }

    private void createPass()
    {
        // The optimization is not needed if optimization level is -O0.
        if (compileOptions.optimizationLevel > 0)
            PassCreator.createStandardFunctionPasses(getPerFunctionPasses(),
                    compileOptions.optimizationLevel);

        // todo:add inline pass to function pass manager.

        Pass inliningPass = null;
        switch (compileOptions.inlining)
        {
            case NoInlining: break;
            case NormalInlining:
            {
                // inline small function.
                int threshold = (compileOptions.optimizeSize ||
                                compileOptions.optimizationLevel<3)?50:200;

                inliningPass = PassCreator.createFunctionInliningPass(threshold);
                break;
            }
            case OnlyAlwaysInlining:
            {
                inliningPass = PassCreator.createAlwaysInliningPass();
                break;
            }
        }

        // creates a module pass manager.
        PassManager pm = getPerModulePasses();
        PassCreator.createStandardModulePasses(pm,
                compileOptions.optimizationLevel,
                compileOptions.optimizeSize,
                compileOptions.unrollLoops,
                inliningPass);
    }

    private boolean addEmitPasses(StringBuilder buffer)
    {
        if (action == Backend_EmitNothing)
            return true;

        if (action == Backend_EmitAssembly)
        {
            boolean fast = compileOptions.optimizationLevel == 1;
            FunctionPassManager pm = getCodeGenPasses();

            CodeGenOpt optLevel = Default;
            switch (compileOptions.optimizationLevel)
            {
                default:break;
                case 1: optLevel = None;break;
                case 3: optLevel = Aggressive;break;
            }

            if (theTargetMachine.addPassesToEmitFile(pm, fast,
                    asmOutStream, AssemblyFile, optLevel))
            {
                buffer.append("Unable to interface with backend.target machine!\n");
                return false;
            }

            // TODO add passes to emit .s file. 2017.3.26 by xlous.zeng
            return true;
        }
        else if (action == Backend_EmitIr)
        {
            getPerModulePasses().add(new PrintModulePass(asmOutStream));
            buffer.append("Unsupport to emit hir code currently!");
            return false;
        }
        else
        {
            assert action == Backend_EmitObj;
            buffer.append("Unsupport to emit object file currently!");
            return false;
        }
    }

    public Module getModule() {return theModule;}
}
