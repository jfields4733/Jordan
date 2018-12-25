# Buffers

module switchLED(
​    input [15:0] SW,
​    output [15:0] LED
​    );
​    assign LED = SW;
endmodule

![1545222932529](1545222932529.png)

## Module 

[15:0] pronounced "Fifteen down to zero"
[15:0] represents 16 wires individually named like an array
Buffers are the yellow triangles. 
Inputs are on the left (SW are on the left)
Outputs are on the right (LED)
SW has energy/power to **drive** the LED. 

## Circuit 

16 identical independent circuits operating in parallel
SW **drives** the input_buffer.
Input_buffer **drives** the output_buffer.
Output_buffer **drives** the LED.

## Wire 

SW input is **moved** by human hand
SW output **connects** to input_buffer input
Input_buffer output **connects** to output_buffer input
Output_buffer output **connects** to the LED

## Logic

**Active High**
​	Logical zero
​		SW output is zero when off
​		LED is off when SW output is 0
​	Logical one
​		SW output is one when on
​		LED is on when SW output is 1

In addition there is paper homework. Start off with Gate Level truth tables. Then boolean behavior level. Then deMorgan's, then K-maps, then QMC, then FSM, then ASM then control/data … all in the context of RTL.

## Your Task

Modify all 16 wires to connect to other LED's in some pattern of your choice.
Hint: going to need 16 lines, that look something like this:
​	assign LED[2] = SW[7];

Name your project after the pattern you choose. Do not modify this project. 
Show your instructor the manual testing of this modification with your hands touching switches.
Show your instructor your verilog code in vivado. 
Push the code into your personal, GITHub course repository.

## Questions

Need to answer these questions by modifying the verilog code in vivado:

What is a net?
What is a cell?
What is an IO port?
Under what conditions could two switches driving one LED damage the Nexys4DDR?
How many LED's can one switch drive?





