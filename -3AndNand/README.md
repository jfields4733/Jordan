# AndNand
The goals of this lab are to begin looking at the ways **Vivado** modifies our code.   

**Vivado** tires to get rid of constants.   

**Vivado** looks at different verilog abstractions of the same circuit and builds the same circuit or different circuits.   

**Vivado** simplifies circuits we tell it to build, freeing us from trying to build efficient circuits.

## project_1 constants

*Project_1 is playing with voltage controlled buffers just like the previous lab, except it is using constants. A logical 1 is visible in the verilog code (vcb.v) and yet the RTL analysis schematic gets rid of the logical constant and is identical to the previous lab. Why? Draw a diagram similar to the RTL analysis with containing the design intent of the verilog code.*

#### Port Diagram

#### Testing

*What happens if one switches the order of 1 and sw0 (and the order of 1 and sw1) in the verilog code?*

Uncomment the lines:

set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

in the xdc file. 

*What error messages are generated?*   

*Which (RTL, Synthesis, Implement or Generate Bitstream) causes failure?* 

*Which starts complaining first about these two lines?*

#### Port Diagram

#### RTL Screen Shot

#### Synthesis Screen Shot

#### Implementations Screen shot

#### Testing

## project_2 andGates

In this project an "And" gate is created four different ways. Test it. Show your instructor all four ways working. 

*Which of the four ways is the most attractive way to code?*

#### Port Diagram

#### RTL Screen Shot

#### Synthesis Screen Shot

#### Implementations Screen shot

#### Testing

*At what level of verilog code abstraction does the **assign** command emerge?*

## project_3 XOR and Nand Gates

Use the "[assign](https://www.utdallas.edu/~akshay.sridharan/index_files/Page5212.htm)" command, 3 switches, and 2 LEDs to create a three input Nand gate and a three input XOR gate. Put them all in one project. 

#### Port Diagram

#### RTL Screen Shot

#### Synthesis Screen Shot

#### Implementations Screen shot

#### Testing

*XOR gates have evolved with [two different implementations](https://en.wikipedia.org/wiki/XOR_gate#More_than_two_inputs) with three or more inputs.  Which does the verilog assign command implement?*



