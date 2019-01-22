# LotsOfGates
Vivado turns all circuits into the primitives of a CLB Slice: LUTs, muxes, carry-logic, xor gates, d flip flops. Understanding these is the goal of this course. We have covered XOR gates.  The goal of this lab is to understand LUTs. 

The goal here is to predict [LookUpTables](https://en.wikipedia.org/wiki/Lookup_table) (LUTS) values.
Then find their contents in Vivado and compare.
Then look at how Vivado deals with identical circuits. 

## Project_1

Here is a gate diagram done in [logisim](https://sourceforge.net/projects/circuit/) that builds [two identical circuits](https://github.com/ENES-246DigitalElectronics/ENES246/blob/master/-4LotsOfGates/TwoIdenticalCircuits.circ) .. one is efficient ... and one uses lots of gates.  This is what was being stared at when the verilog code for project one was written. 

![1548098400293](1548098400293.png)

One might expect that Vivado would reduce these to a single circuit and reuse the circuit. There have been software packages that do this.  In logisim, go to project, analyze the circuit, minimize, set as expression for output x, set as expression for output y, ok, yes sure. *What happens?*

*Add screen shot of logisim of the resulting circuit.*  

Now explore what Vivado does. Clearly Vivado could see two identical circuits. *What does Vivado do instead?*

To see Vivado LUT's truth tables, click on schematic, right click on the LUT and choose cell properties, move the tab from General to truth table. *Add screen shots of the Vivado LUT truth tables.* 

Obviously Vivado understands the verilog code. *How are the truth tables the same?* 

*How are the truth tables different? What did Vivado do to make the circuits different?* 

#### Port Diagram

#### RTL Schematic Screen shot

#### Synthesis Schematic Screen shot

#### Implementation Device screen shot zoomed in on something interesting

#### Testing

## Project_2

Develop two identical circuits. Build the first circuit with 3 inputs, 2 outputs and at least 5 gates. The second circuit can be a simple version of the first.  Then repeat the instructions of project 1.  Just answer this  one question: *Does anything change?*

#### Port Diagram

#### RTL Schematic Screen shot

#### Synthesis Schematic Screen shot

#### Implementation Device screen shot zoomed in on something interesting

#### Testing

## Ethics

EDIM captures a battle between engineers trying to use tools like Vivado and engineers designing Vivado. They both have to make money. *Read this wikipedia article on [EDIF](https://en.wikipedia.org/wiki/EDIF) and summarize in less than 200 words:*

This course is asking you to document circuits first with the port diagram and then screen shots of Vivado and finally a discussion of testing. You are in the role of an engineering using Vivado on a project. *Which verilog version of the project_1 circuit (simple or complex) should be entered into Vivado?  When is a more complex circuit a good thing and a simplified, reduced circuit a bad thing?*

Suppose you are engineer designing the Vivado software. You get the question from a customer, a fellow engineer using Vivado: "Why doesn't Vivado see one circuit?" Read this [forum post](https://forums.xilinx.com/t5/Synthesis/Question-about-LUT-usage-in-a-very-very-simple-combinatorial/td-p/221143).  *What is your answer to this question?*

You are student at a university. *Why would professors demand in the first course on digital circuit design that you learn  [Karnaugh Maps,](https://en.wikipedia.org/wiki/Karnaugh_map)  [Quine McCluskey Algorithm](https://en.wikipedia.org/wiki/Quine%E2%80%93McCluskey_algorithm), and  [Petrick Cover](https://en.wikipedia.org/wiki/Petrick%27s_method)* ?

Engineers develop conspiracy theories when trying to predict the future. *Given the above chaos, what do you expect to happen as you try to cram larger and larger circuits into an FPGA?* 



