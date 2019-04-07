# AndNand
The goals of this lab are to begin looking at the ways **Vivado** modifies our code.   

**Vivado** tires to get rid of constants.   

**Vivado** looks at different verilog abstractions of the same circuit and does what?   

**Vivado** simplifies circuits we tell it to build, freeing us from trying to build efficient circuits.

## project_1 constants

Project_1 is playing with voltage controlled buffers just like the previous lab, except it is using constants.

#### Port Diagram

![1549483949140](1549483949140.png)

#### Verilog Code

![1547913933708](1547913933708.png)

#### RTL Schematic Screen shot

![1549483730776](1549483730776.png)

#### Synthesis Schematic Screen shot

![1549484158635](1549484158635.png)

#### Implementation Device screen shot zoomed in on something interesting

![1549486444822](1549486444822.png)

#### Testing

LED0 should act as an OR gate for sw[1:0]



I will flip both the switches to see if they act as an OR gate for the LED

*A logical 1 is visible in the verilog code (vcb.v) and yet the RTL analysis schematic gets rid of the logical constant and is identical to the previous lab. Why? Draw a diagram similar to the RTL analysis with containing the design intent of the verilog code.*

It gets rid of the constant because it wastes the board's resources.

![1554666659208](1554666659208.png)

*What happens if the order of 1 and sw0  are switched (and the order of 1 and sw1) in the verilog code?*

An error appears during the implementation stage of building the circuit. 

Comment out the lines:

​	set_property CFGBVS VCCO [current_design]
​	set_property CONFIG_VOLTAGE 3.3 [current_design]

in the xdc file. 

*What error messages are generated?*   

The error says the program now sees the design having a multi-driven net. When the constant is ignored as the second input, then the program turns the buffer into a two-state buffer.

*Which (RTL, Synthesis, Implement or Generate Bitstream) causes failure?* 

The implementation causes failure.

*Which starts complaining first about these two lines?*

The synthesis starts complaining first.

*What technology is in the Xilinx FPGA we are using TTL, CMOS, etc. ? Provide a link to the web site where you looked up the answer.*

The FPGA uses a flexible logic type called gate array or uncommitted array (UCA) logic technology.

Websites: https://en.wikipedia.org/wiki/Gate_array https://www.fpga4student.com/2016/12/what-is-fpga-five-reasons-why-i-love-fpga.html

*What is w in the verilog code? Is it necessary?* 

The w is a variable in the verilog code. It is not necessary if you do not mind retyping LED every time it is needed in the code.

## project_2 andGates

In this project an "And" gate is created four different ways. Test it. Show your instructor all four ways working. 

#### Port Diagram

![1549487923947](1549487923947.png)

#### Verilog Code

`timescale 1ns / 1ps

module vcb(
   input  sw0,
   input  sw1,
   output [3:0] LED
   );
   wire nand1;
   and a1(LED[0],sw0,sw1);
   bufif1 b1(LED[1], sw0, sw1);
   nand n1(nand1,sw0,sw1);
   nand n2(LED[2],nand1,nand1);
   assign LED[3] = sw0 && sw1;

endmodule

#### RTL Schematic Screen shot

![1549487791306](1549487791306.png)

#### Synthesis Schematic Screen shot

![1549487956102](1549487956102.png)

#### Implementation Device screen shot zoomed in on something interesting

![1549488119894](1549488119894.png)

#### Testing

Checking to see if both switch 0 and switch 1 causes all 4 LED to come on, signaling all 4 AND gates are working.



*Which of the four ways is the most attractive way to code?*

The assign command is the most attractive way to code.

*At what level of verilog code abstraction is the **assign** command?*

This is at the gate and switch level. It is performed in gate level verification.

*Does order of the verilog commands (sequence of commands) change anything?*

The order of the commands does not change anything.

*What are a1,b1,n1,n2 associated with the gate names called in Verilog?*

a1 is associated with a1_i

n1 is associated with n1_i

n2 is associated with n2_i and n2_i_0

b1 is associated with the tri state buffer.

*In the language C, the names between () look like variables passing data to some kind of function, object or subroutine. What do the represent in verilog?* 

They represent the inputs to a gate.

*At what step (RTL, Synthesis, Implementation, BitFile) did Vivado figure out that most of the LED's were doing the same thing?* 

The implementation stage.

*Implement each and gate one at a time. List any differences between them at the RTL or Synthesis states here. Take screen shots if you want or describe them verbally.* 

![1549489035077](1549489035077.png)

![1549489096060](1549489096060.png)

![1549489138084](1549489138084.png)



![1549489209301](1549489209301.png)

## project_3 XOR and Nand Gates

You create this from scratch.

Use the "[assign](https://www.utdallas.edu/~akshay.sridharan/index_files/Page5212.htm)" command, 3 switches, and 2 LEDs to create a three input Nand gate and a three input XOR gate. Put them all in one project. 

#### Port Diagram

![1549489795854](1549489795854.png)

#### Verilog Code

`timescale 1ns / 1ps

module vcb(
   input  sw0,
   input  sw1,
   input  sw2,
   output [1:0] LED
   );
   assign LED[0] = ~(sw0 & sw1 & sw2);
   assign LED[1] = ((sw0 ^ sw1) ^ sw2);

endmodule

#### RTL Schematic Screen shot

![1549648135633](1549648135633.png)

#### Synthesis Schematic Screen shot

![1549648245448](1549648245448.png)

#### Implementation Device screen shot zoomed in on something interesting

![1549648391562](1549648391562.png)

#### Testing

Check to make sure that LED 0 is on for all possible switch combinations except when all three switches are on. Check to make sure LED 1 acts as an Odd detector for the three switches.

*XOR gates have evolved with [two different implementations](https://en.wikipedia.org/wiki/XOR_gate#More_than_two_inputs) with three or more inputs.  Which does the verilog assign command implement?*

The assign command implements the odd detector.

## Ethics

The ethics questions below are more important than your answers. The goal in answering them is to remember the question. So the best answers are a non-trivial, thoughtful, relevant hypothesis. 

#### Ethics of EDIF

EDIF (Electric Design Interchange Format)  captures a battle between engineers trying to use tools like Vivado and engineers designing Vivado. They both have to make money. *Summarize this wikipedia article  on the death of [EDIF](https://en.wikipedia.org/wiki/EDIF) standards in less than 200 words:*

There was an inherent challenge in coming up with a standard for naming netlists and schematics in order to offer the bests products from each of the EDA companies. The companies did not want to put forth the resources in order to standardize the practice because it would hurt their bottom line due to the fact that they would lose the forced loyalty and consistency of their longtime costumers. Customers were upset because they were unable to use the best features from each company, rather they were forced to prioritize the feature they wanted most and live with the mediocrity of the company's other features. Over time, the EDA companies worked with the consumers enough to create EDIF, but not enough to make it well. Most problems stemmed from the ambiguity in EDIF making it hard to either convert your designs into or out of EDIF. EDIF gave way to some descendants after it became too large to handle.

This course is asking you to document circuits first with the port diagram and then screen shots of Vivado and finally a discussion of testing. You are in the role of an engineering using Vivado on a project. *Which verilog version of the project_1 circuit (simple or complex) should be entered into Vivado?  When is a more complex circuit a good thing and a simplified, reduced circuit a bad thing?*

The simple version of the circuit should be entered into Vivado so that it can save resources. A complex circuit is a good thing when there is a specific way the circuit must be constructed that Vivado will not understand and potentially cut purposeful parts of the circuit design.



