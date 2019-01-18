# Buffers

The goal of this lecture to verbalize words, hear words, set expectations, build context while looking at examples of work to be done.  

## Sources: Verilog code

module switchLED(
​    input [15:0] SW,
​    output [15:0] LED
​    );
​    assign LED = SW;
endmodule

## RTL Analysis ScreenShot

Notice that it has been cropped.  This is the RTL Analysis of the Verilog Code. It  shows 4 buffers when really there are 16. The RTL analysis  tries to focus on patterns, not the number of patterns.

![1545222932529](1545222932529.png)

## Module

[15:0] pronounced "Fifteen down to zero"
[15:0] represents 16 wires individually named like an array
Buffers are the yellow triangles. 
Inputs are on the left (switches or SW are on the left)
Outputs are on the right (light emitting diode or LED)
SW has energy/power to **drive** the LED. 

## Circuit 

16 identical independent circuits operating in parallel
SW **drives** the input_buffer.
Input_buffer **drives** the output_buffer.
Output_buffer **drives** the LED.

![1546095137405](1546095137405.png)

## 48 Nets (Wires) 

16 SWs or Leaf Cells or **inputs**
 input is **moved** by human hand  
16 wires  or Nets connect the SWs to input buffers vivado added     
vivado added input buffer because the power source behind the switch was unknown
16  input buffer **drive** output 16 output buffers

SW *output* **connects** to input_buffer *input*
Input_buffer *output* **connects** to output_buffer *input*
Output_buffer *output* **connects** to the LED *input*

## Messages

*The  goal is no warnings, no errors.* 
A project has one top module which is connected to the external world through a constraints file.
Inputs and outputs to all other modules flow through this module. 
Here there is just one module. When there are more than one module, this message will disappear. 

![1546097566288](1546097566288.png)

## Synthesis

![1546096637289](1546096637289.png)

![1546099265638](1546099265638.png)

Constraints limit Vivado. Vivado is designed to make circuits run fast. Otherwise projects can usually be done more economically using C, python, or a programming language. We are going to have to constrain Vivado in the future just so we can do simple, logical things that normally would never be done with this software ... such as using our fingers  and a switch as a clock rather than a clock that runs very very fast.

## Logic

**Active High**
​	Logical zero
​		SW output is zero when off
​		LED is off when SW output is 0
​	Logical one
​		SW output is one when on
​		LED is on when SW output is 1

**Active Low**
​	Logical zero
​		SW output is zero when on
​		LED is on when SW output is 0
​	Logical one
​		SW output is one when off
​		LED is off when SW output is 1

## #######################################









