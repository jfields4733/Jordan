# MuxOfMux
Vivado turns all circuits into the primitives of a CLB Slice: LUTs, muxes, carry-logic, xor gates, d flip flops. Understanding these is the goal of this course. We have covered XOR gates and LUTs. The goal now is to cover muxes. 

## m2x1Mux

#### Port Diagram

#### RTL Schematic Screen shot

#### Synthesis Schematic Screen shot

#### Implementation Device screen shot zoomed in on something interesting

#### Testing

This mux is implemented both with gates, tristate and RTL. 

*What are the differences between the three at after RTL Analysis?* 

*What are the differences between the three when implemented in the FPGA?*

*What are the differences after synthesis in the schematic?*

*What happened in the Device implementation to these three? are they all the same or different?*

*Is the RTL implementation in your opinion too cryptic?* 

*Harmonize the ? : with the description of these assign conditional symbols in this  [ut](https://www.utdallas.edu/~akshay.sridharan/index_files/Page5212.htm) manual.* 

*Can you leverage any of these to make a m4x2 mux? Describe what you tried here before looking at the m4x2 mux project.* 

## m16x4Mux

#### Port Diagram

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
Exhaust 10 minutes trying to find it. List off the keywords you used to search for an explanation and URL's that you find that are closer than these:

This presentation from [Standford](https://web.stanford.edu/class/archive/ee/ee371/ee371.1066/tools/verilog_tips.pdf) talks about how to build arrays of wires but not this command.  This is a lab from [University of Maryland College Park](https://ece.umd.edu/class/enee245.S2015/Lab7.pdf) very similar to this lab, but doesn't mention this technique.  This is a [link](http://electrosofts.com/verilog/mux.html) that inspired the instructor to start playing around with this command.  [Cliff Cummings](http://www.sunburst-design.com/papers/)  is an engineer that has been at the forefront of driving Verilog and System Verilog evolution.

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

It is impossible to test thousands inputs combinations and state transitions by hand. This problem coupled with the chaos of subsets of a superset make searching the internet for verilog solutions problematic. The reasons for this chaos involve testing.  This is discussed below. But first we must look at the ethics of change. 

Engineers are professionals like doctors and lawyers. They are by law allowed, protected and encouraged to experiment/improve at every opportunity. Engineers make new versions. Doctors improve treatment and surgery techniques.  Lawyers find new ways to interpret laws and dream up new ones. This constant change creates a chaos. 

Technicians, nurses and paralegals & judges are the anchors, the experts, the people that build walls around this change. They extract from the chaos what works, complain about what doesn't and become the conservative force that captures what is good for society. **In the process technicians, nurses and paralegals become experts.**  Engineers, doctors and lawyers are merely artists. There is lots of research showing that once the human species captures some knowledge, it never forgets .. even if the number of individuals knowing a very small piece of it becomes much smaller than during the technology's growth period. 

This part of society works. But there is a down side. A barrier, a Catch22 starts growing for those trying to become Engineers or Technicians, Doctors or Nurses. Specialization, complexity, pre-requisite knowledge starts growing. A new generation has trouble getting a job. They ask "How can I get the experience the job says I need without getting the job?" An old generation creates a bubble around themselves. The younger generation sees this as a barrier to entry. The older generation retires. Society in general get's scared.  Standing still, repeating success is a disaster for any organization. 

*So how does a younger generation pop a generation bubble or climb over the experience barrier and get a job?*

*What does the younger generation have to do on their resume, while in college where the complexity, the accumulated knowledge, the expertise, the experience required seems not-humanly possible?* 

*How does a young generation serve the world, the human species by their choices popping this bubble?*

#### Ethics of Testing

Vivado supports **VHDL** or **System Verilog** for testing. See the Run Simulation tab. In general, no engineer is happy with these tools. Some Verilog engineers began using VHDL rather than System Verilog for testing. 

There are commands that run in Vivado "Run Simulation" yet cause error messages in RTL Analysis, Synthesis, or Implementation. These are called [Verilog Constructs Not Supported in Synthesis](https://www.google.com/search?q=verilog+Constructs+Not+Supported+in+Synthesis&rlz=1C1CHBF_enUS809US809&oq=verilog+Constructs+Not+Supported+in+Synthesis&aqs=chrome..69i57.1895j0j7&sourceid=chrome&ie=UTF-8).  The problem is that there are no standards, and different FPGA vendors Synthesize a different subset of Verilog commands. 

Some engineers built their own testing framework outside of Vivado in languages such as [python](https://forums.xilinx.com/t5/Simulation-and-Verification/cocotb-Anyone-hear-of-it/td-p/837551). Today testing distinguishes digital design companies.  These companies (and their engineers) compete with in-house designed test tools (software). Time is money. The more efficient your testing, the lower your engineering design costs. The commercial world, by itself, has no incentive to Standardized Testing. 

There are many companies and open source products ([EDAplayground](https://www.edaplayground.com/)) that stop after simulation testing.  Using one of these tools can falsely make you think that there are testing standards. It falsely makes the education community think that after passing a simulation test, the physical implementation in FPGA vendors hardware will work.  But code that passed simulation testing, often **fails**. 

Vivado describes some does and don'ts in [ch3](https://www.xilinx.com/support/documentation/sw_manuals/xilinx2016_3/ug901-vivado-synthesis.pdf) of this pdf for all HDL languages, not specifically Verilog. So the [catch22](https://en.wikipedia.org/wiki/Catch-22_(logic)) is having to know verilog well enough to read this chapter to know what part of Verilog not to use.  

##### Testing with second test circuit

Putting a special test circuit in the FPGA along with the primary circuit is possible without any special tools. This is why there was no clear boundary between the original, 1980's verilog used for testing during simulation and verilog used for building circuits.

##### Testing with data collected in FPGA's RAM

In the 1980's it was easy to purchase a logic analyzer. They were expensive and ran faster than any circuit you wanted to test. They had voltage probes that could spy on what was going on inside any wire/net of the circuit. They had probes that could replace any chip and look at the rest of the circuit from that chips point of view. You could program the logic analyzer to behave as that chip .. to see what was working and not working. 

The biggest logic analyzers were custom built for a circuit. They had probes for every net/wire in the circuit. There were so many wires, 24 gauge wire cross sections could fill up more than a foot square space, take  200 man hours to physically wire up, and a fork lift to move.  Today the market for the  [voltage probes](https://ect-cpg.com/welcome) still exists, but they are just checking circuit boards at various stages in the manufacturing process. They are not connected to a logic analyzer. They are connected to a computer that checks connectivity.

Now the circuits run faster than any external piece of equipment with logic probes attached to the circuit.  But all is not lost. 

Vivado allows you to place virtual logic probes inside your FPGA with an Xilinx intellectual property (IP) core called  [ILA](https://www.xilinx.com/support/documentation/sw_manuals/xilinx2015_4/ug936-vivado-tutorial-programming-debugging.pdf) "Integrated Logic Analyzer." Data collected from ILA logic probes is stored in the FPGA and analyzed after the real circuit is physically operated. 

*What is the best way to teach a digital design course when most of the verilog code, advice and guides found on the internet seem inconsistent, contradictory, and generate nothing but error messages?*

*What is a solution to the internet collecting bad, not-modern, misleading, not-useful verilog code?*  

*How is root cause of this verilog chaos related to testing?* 

*What solutions do you predict will emerge from the [DARPA Electronics Resurgence Initiative](https://www.darpa.mil/news-events/2018-07-24a)?* 

*How will this impact your career?* 

*How will it impact this course?*

### Ethics of Different Institutional Objectives

There are three groups of Engineers with different objectives:

1. Engineers work for vendors .. For example Engineers work to improve Xilinx hardware FPGAs and Xilinx Vivado software to use them.

2. Engineers work for commercial/defense companies. Some use Xilinx. Others use Xilinx's competition. 
3. Engineers work for educational institutions. They teach and create open source, public, free tools for their doctorate degrees. Their students build circuits with a variety of tools. 

*Describe one area where these three different institutions conflict.* 

*Describe where the FPGA companies like Xilinx and the open source world conflict.*

*In what way are engineers removed from their employer's competing goals and more free to work together in standards committees?*

*What does an engineer represent ... like a lawyer representing clients, doctors representing patients?*

*What motivates all three groups of engineers to start cooperating and working together building a common standard such as the next version of Verilog?*

*Why has the [US supreme court](https://supreme.justia.com/cases/federal/us/435/679/) ruled that engineers from competing companies meeting and forming organizations is not price fixing, is **not** [anti-competitive collusion](https://caselaw.findlaw.com/us-supreme-court/435/679.html)?* 



