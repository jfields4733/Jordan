# MuxOfMux
Vivado turns all circuits into the primitives of a CLB Slice: LUTs, muxes, carry-logic, xor gates, d flip flops. Understanding these is the goal of this course. We have covered XOR gates and LUTs. The goal now is to cover muxes. 

## m2x1Mux

#### Port Diagram

#### Verilog Code

#### RTL Schematic Screen shot

#### Synthesis Schematic Screen shot

#### Implementation Device screen shot zoomed in on something interesting

#### Testing

This mux is implemented both with gates, tristate and RTL. 

*How is the RTL example related to a tri-state buffer?*

*What are the differences between the three at after RTL Analysis?* 

*What are the differences between the three when implemented in the FPGA?*

*What are the differences after synthesis in the schematic?*

*What happened in the Device implementation to these three? are they all the same or different?*

*Is the RTL implementation in your opinion too cryptic?* 

*Harmonize the ? : with the description of these assign conditional symbols in this  [ut](https://www.utdallas.edu/~akshay.sridharan/index_files/Page5212.htm) manual.* 

*Can you leverage any of these to make a m4x2 mux? Describe what you tried here before looking at the m4x2 mux project.* 

## m16x4Mux

#### Port Diagram

#### Verilog Code

#### RTL Schematic Screen shot

#### Synthesis Schematic Screen shot

#### Implementation Device screen shot zoomed in on something interesting

#### Testing

How is manually testing this circuit different?*

*Put a screen shot of the exploded design sources here:*

*Put a screen shot of the exploded RTL schematic here:*

*How many port diagrams are necessary for this project?*

*How many modules are there?*

*How many implemented or instantiated modules are there?*

*In the RTL schematic, what is Vivado trying to communicate to us with the colors yellow and blue?*

*How many lines of verilog code are there in this design?*

*At what workflow stage (RTL, Synthesis, Implementation, Generate Bitstream) is the schematic started?*

*At what workflow stage (RTL, Synthesis, Implementation, Generate Bitstream) is the schematic finished?*

*What typically changes between the schematic start and finish?*

*At what workflow stage (RTL, Synthesis, Implementation, Generate Bitstream) is the device or FPGA usage diagram started?*

*At what workflow stage (RTL, Synthesis, Implementation, Generate Bitstream) is the device or FPGA usage diagram finished?*

*At what workflow stage (RTL, Synthesis, Implementation, Generate Bitstream) is the XDC file last checked?*

## m16x4MuxRTL

#### Port Diagram

#### Verilog Code

#### RTL Schematic Screen shot

#### Synthesis Schematic Screen shot

#### Implementation Device screen shot zoomed in on something interesting

#### Testing

*Go through each line of the code and comment on it .. explain the variables .. explain what is happening. Paste the commented verilog code here.*  

*This is the first program to use registers. Why are registers needed?* 

*What drives [15:8] LED?*

*MuxInput gets information from where?*

*Why is enter necessary?*

*What is the difference between initial and reset?*

*Why is initial and reset necessary for muxInput, but not LED?*

*How many lines of verilog code were necessary to create the 16x4 mux?*

*How many lines of verilog code were necessary to manually test the 16x4 mux with the nexys4ddr board?*

*How many verilog modules were used in this Vivado project?*

*Where is the original documentation for this command that creates muxes?* 
It is impossible to prove a negative, such as "it is impossible" .. "It is not on the internet." The appropriate response is to **document exhaustion**.  This means writing a list of places tried, URL's tried, experiments performed that were close but not answer the question. The goal of  **documented exhaustion** is to provide a starting point for someone else to take a stab at answering the question.  Read the below and either answer the question or add to the **documented exhaustion**. 

Search terms tried: verilog bit width

URL's read that are close but don't answer the question:
This stackexchange article talks about [verilog width concatenation](https://electronics.stackexchange.com/questions/282357/what-is-supposed-to-happen-in-verilog-if-a-signal-of-one-width-is-assigned-to-an) ... which is a similar topic.    
This presentation from [Standford](https://web.stanford.edu/class/archive/ee/ee371/ee371.1066/tools/verilog_tips.pdf) talks about how to build arrays of wires but not this command.    
This is a lab from [University of Maryland College Park](https://ece.umd.edu/class/enee245.S2015/Lab7.pdf) very similar to this lab, but doesn't mention this technique.    
This is the [link](http://electrosofts.com/verilog/mux.html) that inspired playing around with this command.    
[Cliff Cummings](http://www.sunburst-design.com/papers/)  is an engineer that has been at the forefront of driving Verilog and System Verilog evolution and maybe in his writing somewhere there is an answer. 

## Ethics

The ethics questions below are more important than your answers. The goal in answering them is to remember the question. So the best answers are a non-trivial, thoughtful, relevant hypothesis. 

#### Ethics of Change

The simplicity of the RTL versions of the mux command raises the question of what is possible with the assign command? Where is the manual that goes over all this? Where can we discover what is possible? The problem is that there are many manuals with complete backwards compatibility to the dawn of verilog history in the 1980's.  These are the official Verilog standards.  They are all supersets .. meaning some vendors (Vivado) **don't** implement everything. 

​	IEEE 1364-1995 (Verilog 1995)  
​	IEEE  1364-2001 (Verilog 2001)   
​	IEEE  1364-2005 (Verilog 2005)  
​	IEEE  1800-2005 (SystemVerilog)  
​	IEEE  1800-2009 (SystemVerilog)  
​	IEEE  1800-2012 (SystemVerilog)   
​	IEEE  1364-2014 ([Verilog-AMS 2.4](http://www.accellera.org/downloads/standards/v-ams))    

It is impossible to test thousands inputs combinations and state transitions by hand. This problem coupled with the chaos of Verilog subsets of a superset make searching the internet for verilog solutions problematic. The reasons for this chaos involve testing.  This is discussed below. But first we must look at the ethics of change. 

Engineers are professionals like doctors and lawyers. They are by law allowed, protected and encouraged to experiment/improve at every opportunity. Engineers make new versions. Doctors improve treatment and surgery techniques.  Lawyers find new ways to interpret laws and dream up new ones. This constant change creates a chaos. 

Technicians, nurses and paralegals & judges are the anchors, the experts, the people that build walls around this change. They extract from the chaos what works, complain about what doesn't and become the conservative force that captures what is good for society. **In the process technicians, nurses and paralegals become experts.**  Engineers, doctors and lawyers are merely artists. There is lots of research showing that once the human species captures some knowledge, it never forgets .. even if the number of individuals knowing a very small piece of it becomes much smaller than during the technology's growth period. 

This part of society works. But there is a down side. A barrier, a Catch22 starts growing for those trying to become Engineers or Technicians, Doctors or Nurses. Specialization, complexity, pre-requisite knowledge starts growing. A new generation has trouble getting a job. They ask "How can I get the experience the job says I need without getting the job?" An old generation creates a bubble around themselves. The younger generation sees this as a barrier to entry. The older generation retires. Society in general get's scared.  Standing still, repeating success is a disaster for any organization. 

*So how does a younger generation pop a generation bubble or climb over the experience barrier and get a job?*

*What does the younger generation have to do on their resume and while in college ... when the complexity, the accumulated knowledge, the expertise, the experience required seems impossible to accumulate?*

*How does a young generation serve the world, the human species popping this generational bubble?*



