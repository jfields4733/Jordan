

# Lab 12 Style and Flip Flops

# 0 Style .. Begin End Labels

This project was not finished. It focuses on the utility of the Begin End Label

![1552419800844](assets/1552419800844.png)

*Is this just another method of commenting?*

No I cannot use begin and end labels to make comments in the code block between the two. But the labels themselves can be used to separate out code especially when given appropriate names. 

*Is it a method of helping identify lots of Begin End pairs?*

You can add an "end : ___" label to find where its counterpart is located. If there is no begin label to match it, it will be underlined in red. If there are too many begin labels, then the begin label will be underlined.

![1552419926389](assets/1552419926389.png)

*Why is statement 11 underlined in red above?*

Because the corresponding end label does not say MUX, but instead it says Mux which means that one of these two statements is wrong. Vivado just chose to underline the begin label because end labels have more freedom. It reads the begin label and assumes there is an "end" to pair with it. Once it reads the "end : Mux" label, it goes back up to find the matching begin label and tells you the begin label is misspelled.

*Why is it ok to not have an end label, but not ok to have a misspelled end label?*

Because the program pairs each begin label with its end pair, so by default the end pair is implied to have the same label as it begin counterpart. When the end label is misspelled, it makes the program think that the begin and end statements are not paired with each other.

![1552419984204](assets/1552419984204.png)

*This looks useful, but why allow a begin to be labeled without forcing it's associated end to be labeled?*

It makes for a way to save time when coding and time is money. The begin and end are paired through implication. It'd be similar to making a journalist write the same sentence twice for his introduction and conclusion. It is implied to be all related and practically useless.

*Do begin-ends really clarify the code or just get in the way?*

With proper spacing and labels, they can clarify the code. For very simple code and one-liners, they can get in the way.

![1552420111635](assets/1552420111635.png)

*For one line of code, is white space and a comment good enough?*

Yes.

![1552420322573](assets/1552420322573.png)

*When are begin end's necessary?*

When you need to block code and have it make several decisions

*Why are many small, always_comb blocks good?*

It easier to separate the different concepts that need to be implemented in the code.

*When do you envision using begin end labels?*

I envision using begin and end labels when I have a task that needs to be implemented in the code with 3+ lines of code. It would make the code block easier to discern what exactly its purpose is.

Don't implement and physically test. Play around in the Vivado code editor.

## 1 Multiple Assign_Comb

*Why would anyone write this sloppy code?*

![1552825165877](assets/1552825165877.png)

*Can you predict what is going to happen?*

No you can't predict which happens first.



![1552825211195](assets/1552825211195.png)

*In a complicated program, under what circumstances will you make this mistake?*

When you are writing your verilog code like a more mainstream language like C, assuming it is default data path. Which makes the the coder think that the one written first will be executed first.

*What is a rule you can make up that will prevent this from happening?* 

Suggested rules:

​	always have a default value for any reg
​	make assignments once within all data_paths in a circuit
​	think parallel first
​	change only one variable per always block
​	look at any variable in any block
​	start all comb blocks with an if (clocked_variable) statement 



## 2 Timing Control

The goal is a simple project involving the 100Mhz clock that follows best practice. *This violates which rule(s) above?*

It violates the rule on assigning a default value to any reg. It doesn't start the comb block with an if (clocked_variable) statement.

![1553433049962](assets/1553433049962.png)

![1552417221913](assets/1552417221913.png)

*How can you tell if the clock was implemented?*

The implementation schematic shows the clock signal connected to the flip flop.

*What screen shot proves that the flip flop was actually implemented?*

The RTL Analysis shows the implementation of the flip flop

*What is best practice in terms of blocking and non-blocking statements?*

Suggested rules:

​	always have a default value for any reg
​	make assignments once within all data_paths in a circuit
​	think parallel first
​	change only one variable per always block
​	look at any variable in any block
​	start all comb blocks with an if (clocked_variable) statement 

*Where is combination logic done?*

Putting an AND gate on a1 and a2 to output b.

*Which variables are changed in the data path?*

variable b

*Which variables are looked at in the data path?*

variable a1 a2 and b

*Which variables are changed in the control path?*

variable q

*Which variables are looked at in the control path?*

variable b and q

*Why is it wrong to change a variable in two different places?* 

Assuming everything happens in parallel, it is impossible to determine which will happen first.

*When visualizing data path circuits, there is a flow from input to output with no loops. What is the flow in this circuit?*

*What is best practice in terms of blocking and non-blocking statements?*

Suggested rules:

​	always have a default value for any reg
​	make assignments once within all data_paths in a circuit
​	think parallel first
​	change only one variable per always block
​	look at any variable in any block
​	start all comb blocks with an if (clocked_variable) statement 

*Why not eliminate b by putting the a1& a2 in the control block?*

Long story short, it wouldn't update as fast or as accurately

## 3 Growth

growth should occur in the asyn data_path, not in the control_path

#### ![1552418907260](assets/1552418907260.png)

![1552418862854](assets/1552418862854.png)

![1552681843404](assets/1552681843404.png)

*Why could begin end be eliminated in the control_path?*

No because it is not an if else statement. The begin end is necessary to confine those two statements to be executed in sequential order.

*Why grow the data_path rather than the control_path?*

Because the portion controlled by the clock has not changed. The data_path runs a lot faster in small chunks of code.

*What is mux selecting between?* 

It is selecting between a1+a2 or a3

*Is it a  2 input, 1 select line mux or a 3 input, 2 select line mux?*

It is a 2 input, 1 select line mux.

*What is growing, the data_path or control_path?*

data path is growing

*Which goes at the speed of light, data_path or control_path?*

The data path goes at the speed of light

*What does the control_path control?*

It controls how many times output q changes.

*Could this data_path be split into two parallel data_paths?*

No.

*There isn't an else for the if command. Why didn't Vivado create a latch?*

Because latches are evil. Also, there is a default state.

*CE and SR are wired up in the device, but not in the RTL Schematic. What do these [inputs mean](https://www.xilinx.com/support/documentation/user_guides/ug474_7Series_CLB.pdf)? Is CE chip enable or clock enable?*

CE is clock enable. CE is an active high allowing the clock to affect the flip flop. The SR is an active low, not allowing the flip flop to be reset.

![1552682322706](assets/1552682322706.png)

## 4 Reset Clock

The development of the anode clock in the 7seg display started off with this code (see Lab8 project 5):

![1552828074458](assets/1552828074458.png)

The code works, but failed many times. The error messages complained about the if commands. The problem was reset.  The posedge(reset) started off negedge(reset). Later while expanding 7seg display to include 0 blanking and adding the option to split into two displays, everything failed. Error messages did not point to the problem again. Out of desperation, inspired only by error messages about timing and clocks,  posedge(reset) was eliminated and the code began to work. (See Lab8 project 6). 

![1552828473955](assets/1552828473955.png)

The goal of this project is to fiddle and figure out what is going on. 

Looking  the most simple clock that can be displayed on LEDs:

![1552840521804](assets/1552840521804.png)

This illustrates the problem with copying sample clock circuits from the internet. Most don't deal with the fact that the clocks on most trainers such as the Nexys4DDR are going at speeds of 100Mhz. This just causes the LED's to glow. To solve the problem there needs to be a clock divider that creates a separate, slower counter.  

Many ways of implementing a slow counter from a fast counter have been tried. Most end up generating a bitstream that ends up displaying nothing.  

The next step is to look carefully to see how reset is attached to the flip flops generated: 

![1552840610940](assets/1552840610940.png)

![1552840627659](assets/1552840627659.png)

The name of the flip flop is RTL_REG_SYNC. It has RST, rst or reset, CE  in the schematics above.  This is the rst signal after it goes through a 2Lut:

![1552835669586](assets/1552835669586.png)

On both sides of the tree, it goes into a SR set reset port of a flip flop.

![1552835794011](assets/1552835794011.png)



*Does it make sense that reset goes into the reset/set input of the FF?*

*What value is the FF reset to?* 

*Does the physical testing of this circuit confirm this?*

![1552836163508](assets/1552836163508.png)

*Is CE tied high or low?*

*Is this true on all flip flops?* 

## 5 Async Reset Clock

This code actually works, but it will cause problems in larger projects because it generates latches (despite having non assign_comb blocks!, Despite having all variables initialized!)

![1552854685928](assets/1552854685928.png)

![1552850800545](assets/1552850800545.png)

![1552850844091](assets/1552850844091.png)

The first thing to notice is that the flip flops have different names: RTL_REG_SYNC and RTL_REG_ASYNC. Second that SR has been replaced by CLR. 

*Why would putting posedge(rst) in the Always_ff sensitivity list cause asynchronous behavior?  We are after all trying to specify the timing.*

There don't appear to be any error messages, other than the normal complaining about clock domains, no specified clock constraints, etc.  We have been ignoring these warnings for a while now. 

Neither [this article](https://www.xilinx.com/support/documentation/white_papers/wp272.pdf) nor [this article](https://forums.xilinx.com/t5/Adaptable-Advantage-Blog/Demystifying-Resets-Synchronous-Asynchronous-other-Design/ba-p/882252) feel like starting points. So we are going to have to create one. 

The flip flops on the device window right side look like this with the inputs back to S

![1552839074720](assets/1552839074720.png)

![1552839168106](assets/1552839168106.png)

The left side appears to have them hooked up also. The SR network appears similar to the above:

![1552851110307](assets/1552851110307.png)

  

The difference seems to be the CE. Groups of FlipFlops are tied together to a common clock enable. But the groups don't span the entire circuit.

![1552851279163](assets/1552851279163.png)



## 6 Best Clock Divider

This clock divider was designed with these rules:

- Only one variable (register or signal) changes within an always_ff block.

- Control (clocked) variables are only looked at in other blocks

- always_comb blocks have at least one control variable that controls the rest of the sequential chain

  ![1553431942939](assets/1553431942939.png)

This should result in a circuit with no latches:

![1553432158388](assets/1553432158388.png)

![1553432191058](assets/1553432191058.png)

![1553432698788](assets/1553432698788.png)

The goal is to follow these rules in the future.

## 7 PUF Beauty

This module illustrates the difference between nonblocking and counting limited by the speed of light. It suggests a do able research project into [PUF](https://en.wikipedia.org/wiki/Physical_unclonable_function) creation. This is an opportunity to get published and attract attention to yourself and HCC. 

![1553428181621](assets/1553428181621.png)

Can see a sync flip flop followed by a async latch:

![1553428573526](assets/1553428573526.png)

![1553428616016](assets/1553428616016.png)

The RTL_LATCH counts as fast as possible while count_clk == divider_counter-1. The RTL_LATCH counts in between the setup of non-blocking and and assignment of non-blocking. On the FPGA being looked at now, it counts through 8 bits during this time. This is a decimal number of 256. But this can't yet be leveraged into meaningful information. There are other patterns that need to be explored first. 

Repeatable oscillations occur when the divider_counter is set at 50,000,000. This indicates that the 8 bit decimal number above, while stable could be greater than the 32 bits of the RTL_Latch. This also indicates residual energy being stored in elements of the FPGA. Questions to explore are ... are all FPGAs displaying the exact same characteristics? Are we seeing an unintended designed feature of the FPGA manufacturing process or are we seeing  non-deal, random impurities  which can lead to individually, uniquely identifying each FPGA manufactured?

*Make two modifications of your choice to the puf code above (fiddle with the divider_counter) and record the resulting patterns here:*

*Why doesn't this code work? It generates a bitstream:*

![1553426398513](assets/1553426398513.png)

*Look up the [RDTSC](https://en.wikipedia.org/wiki/RDTSC) instruction for the Intel CPU. Could that instruction read the output of the above circuit?*





