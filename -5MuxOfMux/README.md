# MuxOfMux
Vivado turns all circuits into the primitives of a CLB Slice: LUTs, muxes, carry-logic, xor gates, d flip flops. Understanding these is the goal of this course. We have covered XOR gates and LUTs. The goal now is to cover muxes. 

## triStateMux

There are 5 projects in this lab. The goal is to see what Vivado does with the verilog code for a mux.  

#### Port Diagram

#### RTL Schematic Screen shot

#### Synthesis Schematic Screen shot

#### Implementation Device screen shot zoomed in on something interesting

#### Testing

## m2x1Mux

This mux is made out of gates. Does it do anything different than the triStateMux?

Add assign x = a ? b : c;

In above case a, b, c are monitored continuously and whenever any of the three signals changes, x gets updated instantaneously (Above assign will synthesize to a 2x1 Multiplexer with “b, c” as inputs, “a” as select signal and “x” as output). Ask questions about ? and : after the assign command. Can they be replaced by if else? Is this too cryptic? Look up in [ut](https://www.utdallas.edu/~akshay.sridharan/index_files/Page5212.htm) manual. 



College Park discussion: https://ece.umd.edu/class/enee245.S2015/Lab7.pdf

#### Port Diagram

#### RTL Schematic Screen shot

#### Synthesis Schematic Screen shot

#### Implementation Device screen shot zoomed in on something interesting

#### Testing

Add mux7_7 to 4by2Mux so one file. 

## mux7_7

#### Ethics

The simplicity of this mux command raises the question of what is possible with the assign command? Where is the manual that goes over all this? Where can we discover what is possible? The problem is that there are many manuals with complete backwards compatibility to the dawn of verilog history in the 1980's.  These are the official Verilog standards.  They are all supersets .. meaning some vendors (Vivado) **don't** implement everything. 

​	IEEE 1364-1995 (Verilog 1995)  
​	IEEE  1364-2001 (Verilog 2001)   
​	IEEE  1364-2005 (Verilog 2005)  
​	IEEE  1800-2005 (SystemVerilog)  
​	IEEE  1800-2009 (SystemVerilog)  
​	IEEE  1800-2012 (SystemVerilog)   
​	IEEE  1364-2014 ([Verilog-AMS 2.4](http://www.accellera.org/downloads/standards/v-ams))    

#### System Verilog

The first problem is that verilog testing (testing manually 10M possibilities is impossible) ends up requiring writing a separate program that turns out to be more complicated than the circuit. At first, the goal was to create a separate circuit that tested the DUT (device under test) .. one circuit testing another. Eventually a boundary evolved between verilog code that is synthesizable and verilog code that is **not** synthesizable. 

​	IEEE 1364-1995 (Verilog 1995)
​	IEEE  1364-2001 (Verilog 2001)
​	IEEE  1364-2005 (Verilog 2005)
​	IEEE  1800-2005 (SystemVerilog)
​	IEEE  1800-2009 (SystemVerilog)
​	IEEE  1800-2012 (SystemVerilog) 

Test Circuits in the FPGA or Testing during Simulation?

In 2005 an attempt was made to create a new version of verilog called SystemVerilog. This was a failure. Engineers stopped using verilog for testing and began using VHDL (a competitor of verilog), and other languages such as [python](https://forums.xilinx.com/t5/Simulation-and-Verification/cocotb-Anyone-hear-of-it/td-p/837551).  This represented a significant departure from building test circuits inside the FPGA for testing in the real hardware and software tests using python before RTL, synthesis, and implementation. 

This is the current situation. In 2014, Verilog was officially expanded to handle [FPAAs](http://www.rh.gatech.edu/news/508791/configurable-analog-chip-computes-1000-times-less-power-digital) (Field Programmable Analog Arrays) when the IEEE announced the 1364-2014 standard.  

Combing through Verilog Manuals

The IEEE standards document is difficult to read. All other manuals have been developed based upon it. Viviado describes some does and don'ts  in [ch3](https://www.xilinx.com/support/documentation/sw_manuals/xilinx2016_3/ug901-vivado-synthesis.pdf) of this pdf for all languages. 

RTL Schematic Screen shot

#### Synthesis Schematic Screen shot

#### Implementation Device screen shot zoomed in on something interesting

#### Testing

## mux32x5Mux

Design a 32 data input, 5 select line mux.

#### Port Diagram

#### RTL Schematic Screen shot

#### Synthesis Schematic Screen shot

#### Implementation Device screen shot zoomed in on something interesting

#### Testing

## Ethics

Muxes were a central digital design device in digital engineering.  And the symbol for them can be found in the explanation of CLB's and Slices. However we can't directly tell Vivado to use them.  Vivado often takes our request for a mux and puts it in a LUT. Here is the ethical question. 

How much of the old ways need to be taught .. given the new (RTL) is so much better?











## 









## 









## 









## 









## Ethics

EDIM captures a battle between engineers trying to use tools like Vivado and engineers designing Vivado. They both have to make money. *Read this wikipedia article on [EDIF](https://en.wikipedia.org/wiki/EDIF) and summarize in less than 200 words:*

This course is asking you to document circuits first with the port diagram and then screen shots of Vivado and finally a discussion of testing. You are in the role of an engineering using Vivado on a project. *Which verilog version of the project_1 circuit (simple or complex) should be entered into Vivado?  When is a more complex circuit a good thing and a simplified, reduced circuit a bad thing?*

Suppose you are engineer designing the Vivado software. You get the question from a customer, a fellow engineer using Vivado: "Why doesn't Vivado see one circuit?" Read this [forum post](https://forums.xilinx.com/t5/Synthesis/Question-about-LUT-usage-in-a-very-very-simple-combinatorial/td-p/221143).  *What is your answer to this question?*

You are student at a university. *Why would professors demand in the first course on digital circuit design that you learn  [Karnaugh Maps,](https://en.wikipedia.org/wiki/Karnaugh_map)  [Quine McCluskey Algorithm](https://en.wikipedia.org/wiki/Quine%E2%80%93McCluskey_algorithm), and  [Petrick Cover](https://en.wikipedia.org/wiki/Petrick%27s_method)* ?

Engineers develop conspiracy theories when trying to predict the future. *Given the above chaos, what do you expect to happen as you try to cram larger and larger circuits into an FPGA?* 



