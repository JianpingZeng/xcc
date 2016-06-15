# Overview
This is a C-like language compiler just for researching and studying data flow analysis 
and backend optimization. It combines so many features derived from Java and C rather 
than excluding many complicated type declaration from C language and class supported from Java.

## Purpose
The purpose of this design is that minimizing labor-consuming of front-end, and takes attention to IR's designing and TAC data flow analysis, further, making use of the  
advanced features of modern processor, like ILP (Instruction-level parallel), SIMD instruction, multi-level cache etc, in the future. 

## Completed works
First, The scanner and parser have finished for C-like language, in the same time, there 
are other works involved, like  semantic analysis that consists of type checking and etc.

Then, HIR(High level Intermediate Representation) have been generated by HIRGenerator class, and large amount of machine-independence optimization have been performed in HIR.

Last, we design a LIR(*Low Immediate Representation*) elaborative which is simpler variant of LIR of [Java HotSpot VM](http://openjdk.java.net/), and designated easily to operating upon it. Furthermore, the purpose of designation of LIR is for register allocation. Currently, there are two mainstream register allocation approaches yet, [linear scanning](http://web.cs.ucla.edu/~palsberg/course/cs132/linearscan.pdf) or [graph coloring](http://cs.gmu.edu/~white/CS640/p98-chaitin.pdf). For sake of simple and easy to implement, the linear scanning regsiter allocation was chosen for us and we implement it.  

## Optimization Introduction
In this compiler for studying, the optimization is the main point, consequently, [Constant folding](https://en.wikipedia.org/wiki/Constant_folding) have been down well and constant propagation as subtask. In the same time, the introduction of [Strength reduction]() is appropriate. Then [Dead Code Elimination](https://en.wikipedia.org/wiki/Dead_code_elimination) should not be ignoreed which performed in HIR by taking advantage of sparse traits of HIR in [SSA form](https://en.wikipedia.org/wiki/Static_single_assignment_form) for reducing the cost of time and space. Also, [Useless Control Flow Elimination](https://www.cs.rice.edu/~keith/512/2011/Lectures/L05Clean-1up.pdf) is desired according to Keith D. Cooper & Linda Torczon. Moreover, [Global Common Subexpression Elimination](https://en.wikipedia.org/wiki/Common_subexpression_elimination) should be involved in the modern compiler, so it have been accomplished througth [Global Value Numbering](https://en.wikipedia.org/wiki/Global_value_numbering) which references to [HotSpot Client Compiler](https://www.complang.tuwien.ac.at/andi/java-hotspot.pdf).

##Future
We will accomplish a x86 assembler based JIT compiler in simpler level instead of high performance to avoid greatly complexity, since lack of sufficient time.

