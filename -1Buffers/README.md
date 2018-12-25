# Buffers and Voltage Controlled Buffers 
There are two vivado projects already created and 3 projects to design. Show your instructor all  5  circuits (not working or working) to your instructor.  Answer the questions in 

## Buffers

Create a markdown file with Typora with screen shots of the RTL, Synthesis and Implementation schematics. 

What is a net?
What is a cell?
What is an IO port?
What do the yellow triangles labeled OBUF do?

Send the bit file to the Nexys4DDR board and show it working to your instructor.

## Two switches can not drive one LED  
Look at the verilog code and the constraints file.    
Make modifications so that two switches try to drive one LED.  

What are the vivado error messages?   
How do the net, cell, IO ports change? 

Does vivado fail at RTL Analysis, Synthesis, Implementation or Bit File Generation?  

## One switch can drive multiple LED's  
Look at the verilog code and the constraints file.  
Make modifications so that one switch drives mutliple LED's.  
How many LED"s can one switch drive? .. all 16?  
If vivado fails, where does it fail (RTL. Synthesis, Implementation or Bit File Generation), what is the error message?  

## Voltage Controlled Buffer

A buffer can be turned off and on.  

But what is the difference between 0 and off? 
The wire coming out of the Voltage Controlled Buffer is 



