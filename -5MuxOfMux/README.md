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

#### Port Diagram

#### RTL Schematic Screen shot

#### Synthesis Schematic Screen shot

#### Implementation Device screen shot zoomed in on something interesting

#### Testing

## m4x2Mux

#### Port Diagram

#### RTL Schematic Screen shot

#### Synthesis Schematic Screen shot

#### Implementation Device screen shot zoomed in on something interesting

#### Testing

## m16x4Mux

#### Port Diagram

#### RTL Schematic Screen shot

#### Synthesis Schematic Screen shot

#### Implementation Device screen shot zoomed in on something interesting

#### Testing

## mux7_7

#### Port Diagram

#### RTL Schematic Screen shot

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



