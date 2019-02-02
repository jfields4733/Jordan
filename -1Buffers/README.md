# Buffers and Voltage Controlled Buffers 
There are three folders containing three vivado projects.  In this lab and all other labs, you will be asked to demonstrate each circuit to an instructor, answer the questions (look up the answer online or make a hypothesis). Suggest you edit this readme file. 

## Buffers

#### Port Diagram

#### Verilog Code

#### RTL Schematic Screen shot

#### Synthesis Schematic Screen shot

#### Implementation Device screen shot zoomed in on something interesting

#### Testing

#### Prompts

What is a net?     
*What is a cell?*  
*What is an IO port?*  
*What do the yellow triangles labeled OBUF do?*  
*What physically is a zero?*  
*What logically is a zero?*  
*What physically is a one?*  
*What logically is a one?*   

## MultipleLEDs  
#### Port Diagram

#### Verilog Code

#### RTL Schematic Screen shot

#### Synthesis Schematic Screen shot

#### Implementation Device screen shot zoomed in on something interesting

#### Testing

#### Prompts

Look at the verilog code and the constraints file.  *Describe the changes to the constraints file from the first project.* 

A typical circuit built has power flowing through the switch and then a bunch of LED's fan out from the switch, splitting up the current and getting dimmer and dimmer. *Is that happening in this project?*

Read this [stack exchange article](https://electronics.stackexchange.com/questions/282357/what-is-supposed-to-happen-in-verilog-if-a-signal-of-one-width-is-assigned-to-an). Instead of 16 lines of verilog code, everything can be put in one line: 

LED=SW  

as in the first project. But this time there is only one switch. *What happens?* 

The bigger question is why? 

A deep dive into the detail requires finding confirmation of the stack exchange article. Confirmation was found on slides 14 and 15 of this [Stu Sutherland article](http://www.sutherland-hdl.com/papers/2006-SNUG-Boston_standard_gotchas_presentation.pdf).  Information in the article describes what happens. 

The next step is to ask "Why this chaos?" which requires diving into even more detail. This was found  [here](https://www.electronics-tutorials.ws/binary/signed-binary-numbers.html) comparing unsigned and signed with 1's compliment and 2's complement.  This is traditional, old school digital design information. 

The most relevant information was found in the [IEEE 2012 System Verilog standard](https://drive.google.com/open?id=0B65fOszQEMiVU2d1NXBqcmVPSFk) on page 222, but  confusing information is scattered everywhere. This is just math! Verilog does math. Why all this chaos? 

This leads to searching [Xilinx vivado](https://forums.xilinx.com/t5/Synthesis/verilog-math/td-p/205895) for advice on math.  Summarize this. *Why does the Xilinx representative dance around the ignorance of the person answering the question?* 

This is your instructor diving deeper and trying to hit bottom of a detail well. But is no bottom, just underground tunnels. 

Read enough of the prompts below to answer the above question. 

#### -------------------------------Prompts Stop Here for this circuit -----------------------------------

There is some verilog math code here in [openCores](https://opencores.org/projects/verilog_fixed_point_math_library). The next question is will that verilog code synthesize in vivado? 

*Given that Xilinx sells [Math IP for their FPGAs](https://www.xilinx.com/products/intellectual-property/nav-dsp-and-math/nav-math.html), what do think the chances of the open core solution working?*

*What do you think the chances of the open core solution being slower, or implemented differently by Vivado in the FPGA are?*

If you really need math, Xilinx provides a CPU for you called [MicroBlaze](https://www.xilinx.com/products/design-tools/microblaze.html). You write C code, with [Xilinx libraries](https://www.xilinx.com/support/documentation/sw_manuals/xilinx2017_1/oslib_rm.pdf), and vivado translates the normal C libraries into what?

*What does [RTOS](https://en.wikipedia.org/wiki/Real-time_operating_system) stand for?* 

*What does [bare metal](https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842463/3rd+Party+Operating+Systems) mean ?* 

*How is an RTOS different from [linux for the MicroBlaze](http://xilinx.wikidot.com/microblaze-linux)?* 

*Why go through this trouble when the [raspberry pi](https://www.makeuseof.com/tag/different-uses-raspberry-pi/) exists?* 

## MultipleSwitches

This project or circuit fails. Two switches can not drive one LED.  Take screen shots until you reach an error message:

#### Port Diagram

#### Verilog Code

#### RTL Schematic Screen shot

#### Synthesis Schematic Screen shot

#### Implementation Device screen shot zoomed in on something interesting

#### Testing

#### Prompts

*What are the vivado error messages?  Guess what each means in your own words.* 

*How do the net, cell, IO ports change?* 

*Does vivado fail during RTL Analysis, Synthesis, Implementation or Bit File Generation?* 

*What does the error message **multi-driven net** mean? What would you look for as an error in your circuit design? What is a **multi-driven net**?*

****

## BeCreative!

Hook the switches to the LED's in some creative way of your choice using the concepts you learned in this lab. You can start a vivado project from scratch or copy one of the folders above to create your own circuit.

#### Port Diagram

#### Verilog Code

#### RTL Schematic Screen shot

#### Synthesis Schematic Screen shot

#### Implementation Device screen shot zoomed in on something interesting

#### Testing



