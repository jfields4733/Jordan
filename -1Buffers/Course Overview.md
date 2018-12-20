# ENES-246 Digital Design Course Overview

This course is primarily about Electronic Design Automation [EDA](https://en.wikipedia.org/wiki/Electronic_design_automation) . This is what digital design has evolved into. There are [indications](https://www.darpa.mil/work-with-us/electronics-resurgence-initiative) that analog design is going to be taken over by the same techniques.  The goal of this course is to program in verilog at the RRL abstraction level.

## Register Transfer Level (***RTL***). 

​	Think of a **Register** as a memory element storing a bit.
​	**Transfer** means separating data circuits (we study first), from control circuits  (we study second).
​	Verilog has various abstraction **Level**s starting with transistors, gates, circuits, RTL and behavioral.

## Verilog is like C

​	Verilog was intentionally designed to leverage experience with C.
​	Verilog **gate level** abstractions run in **parallel**, similar to playing four notes at once on a keyboard. 
​	Verilog **circuit level** abstractions are a mixture of parallel and sequential. 
​	Verilog **RTL** indirectly references memory storage, letting software (Vivado in this course) make the actual register, flipflop implementation decisions. 
​	C is a **behavioral level** programming language meaning **sequential** algorithms.

## Course Outline

​	Gates .. tristate buffers, nand, and, or, xor
​	Registers .. shift, count, compare, slice
​	Data Circuits .. modules, manual operation
​	Control Circuits .. automatically operate data circuits
​	[Sprint](https://en.wikipedia.org/wiki/Scrum_(software_development)#Sprint) -- individual tasks given in a  2 week group project

## Workflow, Deliverables

​	24 Lectures .. this is not a lecture, read markdown files for writeup instructions
​	24 Labs .. some labs will repeat the writeup, demonstration, repository cycle more than once
​		write in engineering notebook when frustrated more than 10 minutes	
​		writeup (hw) on engineering paper and with a markdown file like this
​		demonstration .. manually testing synthesized verilog on Nexys4 DDR
​		repository . start with given GITHub repository and then add to it
​	Sprint -- presentation to the class of your task and it's completion, best presents at projects night

## Tools

​	Verilog (a programming language, very messy, lots of misleading internet references)
​	[Vivado](https://www.xilinx.com/support/download.html) (free software from Xilinx)
​	[Nexys4 DDR](https://store.digilentinc.com/nexys-4-ddr-artix-7-fpga-trainer-board-recommended-for-ece-curriculum/) (circuit board containing a Xilinx FPGA will be checked out from HCC by you)
​	[Typora](https://typora.io/) (free markdown editor to create documents like this)
​	Screen shot cropping software like paint .. your choice
​	[GITHub Desktop](https://desktop.github.com/)) (free software to manage GITHub repositories used in this class)
​	draw.io  is an html5 web site that produces xml files that will be drawing

## Computers

​	All the software is installed and running on computers in the clossrooms SET-165 and SET-253
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

