# ENES-246 Digital Design Course Overview

Current status: Spring 2019. Working through a rough draft of the course. Just trying to get lots of working  (or not working to make a point) projects built. 

Educational Philosophy: Don't talk about the code, focus on what it does. Look at the code of many examples, predict the output. Slowly introduce projects and build up to them one small piece at a time. (This is a mess right now .. the first big project is driving a 7seg display). Projects with names slowly start to emerge once control paths are introduced that include parity, mod math, CRC and Hamming error correction.  

Prereq: A background in a programming language that included if/then, case, for loops .. preferably C and an elementary knowledge of binary and truth tables. 

This course is focused on the Electronic Design Automation [EDA](https://en.wikipedia.org/wiki/Electronic_design_automation) industry. There are [indications](https://www.darpa.mil/work-with-us/electronics-resurgence-initiative) that analog design is going to be taken over by the same techniques. The goal of this course is to program in RTL SystemVerilog, close to the behavioral abstraction level. This means forgoing many of the non-ASIC/FGPA design techniques that were associated with minimizing gates or flip flops.The goals of this course are to:

- test manually with an fpga trainer to focus on physically synthesizable/implementable rather than stopping at logically correct circuits
- design focused on splitting a project up into many tiny code blocks that create circuits running in parallel
- prepare for understanding clock domain rather than races and metastability
- experiment with example test benches and integrating logic analyzers into circuits

This will require looking at many examples of SystemVerilog projects implemented with Xilinix Vivado 2018.3, Nexys4DDR trainer and SystemVerilog 1800 2017, logisim, and fizzim.  All the software is free. All projects in this repository should be easily convertible to the latest Nexys trainer. 

What is not in this course: Karnaugh, Quinn McClusky, Petrik Cover, Implicant Tables. 

In the drawings folder are the design documents of port maps, state tables, finite state machines, algorithm state machines and algorithmic state machines with data. 

## Register Transfer Level (***RTL***). 

A **Register** or **reg** is type of programming variable that drives an output high or low.  A register is not a flip flop that remembers. A register is not a CPU concept like a [stack](https://en.wikipedia.org/wiki/Stack_register). **Reg** is a SystemVerilog programming abstraction that may or may not result in a flip flop when implemented. 

**Transfer** means separating data circuits (we study first), from control circuits  (we study second). These concepts first appeared in the 1945 First Draft of a Report on the EDVAC by John von Neumann. In RTL terms, **transfer** means learning to block code into chunks that run in parallel. **Transfer** means learning to identify which code blocks are async data paths (running at close to the speed of light) and which are control paths (slowed down by a synchronous, rhythmic clock). **Transfer** means keeping track of which varaibles are modified in which code block and predicting how the synthesizing process is going to string async data paths into one long async data path. 

SystemVerilog has various abstraction **Level**s starting with transistors, tri-state buffers, gates, RTL and behavioral. Gate **level** abstractions are very hard to [sustain](https://www.amazon.com/Sustainable-Software-Development-Agile-Perspective/dp/0321286081) because they are so disconnected from the desired, digital circuit behavior. SystemVerilog was designed to work at both the RTL and behavioral abstraction boundaries. Some of the circuits in this course would take years to design and be almost impossible to manually build if students were only working at the gate **level**. 

## SystemVerilog is like C

​	Verilog was intentionally designed to leverage experience with C.  
​	Verilog **gate level** abstractions can run in **parallel**, similar to playing four notes at once on a keyboard.   
​	Verilog **gate level** sequential abstractions become very complicated quickly.   
​	Verilog **RTL** abstractions are mainly concepts that evolved up from the gate world or down from behavioral. They are represented by RTL schematics, produced by Vivado software. They are an interpretation of Verilog RTL coding. They are concepts like adding, shifting, mux, D flip flops, LUT, or priority encoder from the gate world. They are concepts such as arrays and loops from the behavioral world.   
​	C is a **behavioral level** programming language meaning **sequential** algorithms. While C is clocked, Verilog is not necessarily. Think of Verilog as a parallel/sequential/non-blocking version of C.   

## Documents to Become Familiar With

IEEE 1800 2017 SystemVerilog standard  
Xilinx Configuration Logic Block CLB ug574  
Vivado 7Series FPGA Libraries of Primitives found in the CLB ug953  
Verilog and System Verilog commands that Vivado will Synthesize ug901  
Nexys4DDR_Master.xdc file .. how all the switches, displays, Input/Output connect to the FPGA.   
Nexys4DDR_Restore_Demo.bit .. for troubleshooting Nexys4DDRboard    

## Course Outline

​	Gates .. tristate buffers, constants, nand, and, or, xor  
​	Registers .. shift, count, compare, slice  
​	Data Circuits .. modules, manual operation  
​	Control Circuits .. automatically operate data circuits  
​	[Sprint](https://en.wikipedia.org/wiki/Scrum_(software_development)#Sprint) -- individual tasks given in a  2 week group project

## Tools

​	Verilog (a programming language, very messy, lots of misleading internet references)  
​	[Vivado](https://www.xilinx.com/support/download.html) (free software from Xilinx)  
​	[Nexys4 DDR](https://store.digilentinc.com/nexys-4-ddr-artix-7-fpga-trainer-board-recommended-for-ece-curriculum/) (circuit board containing a Xilinx FPGA will be checked out from HCC by you)  
​	[Typora](https://typora.io/) (free markdown editor to create documents like this)  
​	Screen shot cropping software like paint .. your choice  
​	[GITHub Desktop](https://desktop.github.com/)) (free software to manage GITHub repositories used in this class)  
​	[draw.io](https://www.draw.io/)  is an html5 web site that produces design document drawings (xml files)   

## Computers

​	All the software is installed and running on computers in the classrooms SET-165 and SET-253  
​	All the software is installed and running on the laptop carts in SET-163 and SET-403  
​	Laptops are available for a loan up to 24 hours from [HCC](http://howardcc.smartcatalogiq.com/en/2015-2016/Catalog/General-Information/Computer-Services/Laptop-Loans)  
​	Ideally you own your own laptop and install the software yourself and bring both it and the Nexys4 DDR board to every lab and every class  

## Classroom

​	The goal is agile development. There is no difference between classroom and lab.  
​	This means that normally the classroom is quiet.  
​	Questions are allowed only after 10 minutes of frustration that is documented in an engineering notebook.  
​	Questions must flow initially through the instructor.  
​	Is self_paced, competency based meaning classroom attendance is not required for those working ahead of schedule.  
​	For those falling behind, attendance is mandatory.  Those not attending will have their work penalized 20% per day late.   
​	The official syllabus and schedule is in Canvas. 

## General Instructions For all Labs

Lab instructions are in the README.md file in the lab folder.  Within the lab folder, there are folders for each vivado project or circuit.   

The README.md file will ask questions about the existing project in italics that are to be answered within the README.md file.  

You will document existing projects and create projects with in the same README.md file. Projects will start off with this documentation workflow following pattern:   

​	Drawings starting with Port Interface, then FSM, ASM and later ASMD  
​	Verilog Code  
​	RTL Schematic screen shot  
​	Synthesis screen shot  
​	Implementation Device screen zoomed in on something interesting screen shot  
​	Manual Testing Instructions   
​	Prompts   

This workflow is in a README.md file you are to edit. It may be partially completed. Prompts are questions that dive into more detail. You are to fill in the missing sections of this workflow and submit your own version of this repository. At the end of the course you should be creating your own prompts in your lab notebook and taking screen shots that are relevant to the project, not an arbitrary workflow.   

Suggest using the drawings.io site for creating the drawings. Suggest using typora to edit the README.md file. Screen shots must be properly cropped.   

You are required to **demonstrate** each circuit physically to the instructor (no video) at which time your **notebook** will be inspected. This can be done all at once or after each circuit has been physically implemented in the Nexys4 DDR.   


