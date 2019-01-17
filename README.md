# ENES-246 Digital Design Course Overview

This course is primarily about Electronic Design Automation [EDA](https://en.wikipedia.org/wiki/Electronic_design_automation) . This is what digital design has evolved into. There are [indications](https://www.darpa.mil/work-with-us/electronics-resurgence-initiative) that analog design is going to be taken over by the same techniques.  The goal of this course is to program in verilog at the RTL abstraction level.

## Register Transfer Level (***RTL***). 

​	Think of a **Register** as a memory element storing a bit.
​	**Transfer** means separating data circuits (we study first), from control circuits  (we study second).
​	Verilog has various abstraction **Level**s starting with transistors, gates, circuits, RTL and behavioral.

## Verilog is like C

​	Verilog was intentionally designed to leverage experience with C.
​	Verilog **gate level** abstractions run in **parallel**, similar to playing four notes at once on a keyboard. 
​	Verilog **circuit level** abstractions are a mixture of parallel and sequential. 
​	Verilog **RTL** indirectly references memory storage, letting software (Vivado in this course) make the actual register implementation decisions. 
​	C is a **behavioral level** programming language meaning **sequential** algorithms.

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
​	For those who exhibit independent work, [pair programming](https://en.wikipedia.org/wiki/Pair_programming) will be allowed.
​	Is self_paced, competency based meaning classroom attendance is not required for those working ahead of schedule.
​	For those falling behind, attendance is mandatory.  Those not attending will have their work penalized 20% per day 	late. 

​	The official syllabus and schedule is in Canvas. 

## General Instructions For all Labs

Lab instructions are in the README.md file in the lab folder.  Within the lab folder, there are folders for each vivado project or circuit. Each must be self contained meaning that all files necessary for the vivado project have been copied into the that project. Projects don't contain links to files in other project folders. 

There may be multiple vivado projects already designed you are to look at and multiple vivado projects for you to design in one lab.  

You are to create an electronic **LabWriteUp** file containing circuit design drawings and screenshots, plus answers to the questions associated with the existing vivado projects. 

You are required to **demonstrate** each circuit physically to the instructor (no video) at which time your **notebook** will be inspected. This can be done all at once or after each circuit has been physically implemented in the Nexys4 DDR. 

## LabWriteUp  

Lab write up has to be done electronically in markDown (md) format. Suggest using the Typora editor to create this. Must write in this as you do the lab. Is going to contain screen shots from vivado.  The following must be done for each circuit/vivado project and put into one electronic file. 

LabWriteUp Grading is done after the lab is due. The grade is merely about completeness. Have the necessary drawings been made? Have the screenshots been captured and comments made about them? Do both the questions and answers exist? Do they look original? How many GITHub commits were made?

### Drawings  

The design documents are diagrams. Within the one LabWriteUp.md file, each vivado project or circuit has to start with a port interface diagram.  Other diagrams will be added later. Draw diagrams with a package that produces svg files to put in the md format. Save the files in a format that you can edit later. Suggest using draw.io and saving in xml format. Look in the drawing folder for more extensive examples of these diagrams.

### Screenshots  

Continue in the LabWriteUp for each project or circuit by adding a RTL, Synthesis and Implementation screenshot of something new you have figured out.  Screenshots must be cropped. Suggest using paint. Next to each diagram, write in english something new you figured out.  Often it is vivado interpreting your verilog code and building a circuit completely different than you intended. 

### Questions  

Existing circuits have questions associated with them. Copy and paste the questions into your LabWriteUp and then answer them. Your notebook will or a description of the circuit to build. Questions are found in the lab itself. 

### Testing  

The LabWriteUp for each project or circuit ends with a section on testing. This will always include the manual testing you did do, the manual testing you did not do but could have, suggested testing that can be automated by writing scripts, and testing that will be impossible. 

## Demonstration-Notebook  

Notebook should describe conceptual failures including web search keywords that didn't work, xlinix documentation that wasn't relevant, experimental circuits that failed, and vivado messages that you are trying to guess the meaning of.  Notebook should continue the goingToDo, Doing, RANT style learned in ENES-100. Your notebook should describe what you did to arrive at the answers, not the questions and answers themselves. 

Each lab demonstration will be accompanied by an inspection of the notebook. After the last circuit is demonstrated, your instructor will pick a frustration from your notebook and ask that you post it in the knowledge base. 

If a lab has 5 circuits already made and 1 to be built, then you will need to physically demonstrate all 6 to your instructor. Labs can be done at home, but have to be physically demonstrated to your instructor.  Video of the labs working will not be allowed.

The physical demonstration is documented in the testing section of the labwriteup. 

They all have to be done by the lab due date at the time at the end of lab. Labs can be done at home.

### Demo-Notebook Grading

Each lab results in a demo-notebook grade. Circuits are graded. There is no partial credit per circuit. Either you demonstrate the circuit or you don't. Either you are using your notebook appropriately to work through frustrations, or you are not. Either you use your frustrations to improve the world (entry in knowledge base) or you don't. The knowledge base entries will be graded by counting them at the end of the semester and dividing by 24 .. the number of labs. 

You can't redo or make up labs after the due date. If you don't demonstrate all the circuits, you will get partial credit for the lab. At the beginning, most of the circuits already exist. Towards the end, there may be no existing circuits to demonstrate.  
