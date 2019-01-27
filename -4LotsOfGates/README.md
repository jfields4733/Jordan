# LotsOfGates
Vivado turns all circuits into the primitives of a CLB Slice: LUTs, muxes, carry-logic, xor gates, d flip flops. Understanding these is the goal of this course. We have covered XOR gates.  The goal of this lab is to understand LUTs. 

The goal here is to predict [LookUpTables](https://en.wikipedia.org/wiki/Lookup_table) (LUTS) values.
Then find their contents in Vivado and compare.
Then look at how Vivado deals with identical circuits. 

## Project_1

Below is a diagram of a circuit with two outputs. The outputs are identical. The bottom part with two input gates reduces to the top circuit of one three input Nand gate. The circuit was built in  [logisim](https://sourceforge.net/projects/circuit/) which is a java runtime program free to download. The logisim circuit called [two identical circuits](https://github.com/ENES-246DigitalElectronics/ENES246/blob/master/-4LotsOfGates/TwoIdenticalCircuits.circ), can also be downloaded.  The top circuit uses one gate. The bottom circuit uses 5 gates.  The question is what does Vivado do with these circuits?

![1548098400293](1548098400293.png)

#### Port Diagram

#### Verilog Code

#### RTL Schematic Screen shot

#### Synthesis Schematic Screen shot

#### Implementation Device screen shot zoomed in on something interesting

#### Testing

One might expect that Vivado would reduce these to a single circuit and reuse the circuit. There have been software packages that do this.  The logisim software can do this. Download logisim and the circuit above, and with this circuit open in logisim, go to project, analyze the circuit, minimize, set as expression for output x, set as expression for output y, ok, yes sure. *What happens?*

*Add screen shot of logisim of the resulting circuit.*  

Now explore what Vivado does in your screen shots above. Clearly Vivado could see two identical circuits. *What does Vivado do instead?*

To see Vivado LUT's truth tables, click on schematic, right click on the LUT and choose cell properties, move the tab from General to truth table. *Add screen shots of the Vivado LUT truth tables.* 

Obviously Vivado understands the verilog code. *How are the truth tables the same?* 

*How are the truth tables different? What did Vivado do to make the circuits different?* 

## Project_2

Repeat project_1 with your own design. Develop two identical circuits. Build the first circuit with 3 inputs, 2 outputs and at least 5 gates. The second circuit can be a simple version of the first.  Then repeat the instructions of project 1.  Document your circuit with the port diagram and screen shots. 

#### Port Diagram

#### Verilog Code

#### RTL Schematic Screen shot

#### Synthesis Schematic Screen shot

#### Implementation Device screen shot zoomed in on something interesting

#### Testing

*Is anything different?* 

# Ethics of choosing which Algorithms to Teach

You are student at a university. *Why would professors demand in the first course on digital circuit design that you learn  [Karnaugh Maps,](https://en.wikipedia.org/wiki/Karnaugh_map)  [Quine McCluskey Algorithm](https://en.wikipedia.org/wiki/Quine%E2%80%93McCluskey_algorithm), and  [Petrick Cover](https://en.wikipedia.org/wiki/Petrick%27s_method), which seems unrelated to the labs, doesn't predict Vivado behavior and is at best buried in the Vivado software?*

Suppose you are engineer designing the Vivado software. You get the question from a customer, a fellow engineer using your companies product and paying your salary: "Why doesn't Vivado see one circuit?" Read this [forum post](https://forums.xilinx.com/t5/Synthesis/Question-about-LUT-usage-in-a-very-very-simple-combinatorial/td-p/221143).  *What is your answer to this question?*

Engineers develop conspiracy theories when trying to predict the future. *Given the above chaos discovered in Vivado while doing the labs above, what do you expect to happen as you try to cram larger and larger circuits into an FPGA?* 

