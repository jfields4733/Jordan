# Buffers and Voltage Controlled Buffers 
## Buffers

Create a markdown file with Typora with screen shots of the RTL, Synthesis and Implementation schematics. 

What is a net?
What is a cell?
What is an IO port?
What do the yellow triangles labeled OBUF do?

Send the bit file to the Nexys4DDR board and show it working to your instructor.

## MultipleLEDs  
Look at the verilog code and the constraints file.  
Make modifications so that one switch drives mutliple LED's.  
How many LED's can one switch drive?  

If vivado fails, where does it fail (RTL. Synthesis, Implementation or Bit File Generation), what is the error message?  What does the error message mean in your own words?

Instead of 16 lines of verilog code, everything can be put in one line. What is this one line?

## MultipleSwitches

This project or circuit fails. Two switches can not drive one LED.  

What are the vivado error messages?  Guess what each means in your own words. 

How do the net, cell, IO ports change? 

Does vivado fail during RTL Analysis, Synthesis, Implementation or Bit File Generation? 

What is a multi-driven net?

## VoltageControlledBuffer

Why doesn't Vivado allow two switches to control one LED? 



![1545961610045](1545961610045.png)

How is the above different from the two state situation? 

When sw0 is 0, the tristate buffer doesn't try to ground the LED. It outputs nothing. What is the difference between 0 (false) and nothing? 

Nothing means not hooked up. Nothing means the tristate  buffer output wire is logically cut.  Open. Infinite output impedance.  Off.  If sw=0 and sw1=1 there will not be a fight.  Switch1 (sw1)  will win. Switch2 (sw2) has checked out of the game.   

So what is the difference between 0 and off? There is not difference in a two state circuit. There is a difference in a tristate buffer circuit. Off means disconnected. 0 means remove all energy from the wire. 

What is the difference between 0 and 1? 0 means remove all energy from the wire. Stop it from acting like an  antenna. 1 means flood the wire with energy. Build up the pressure.

So what if both sw1 and sw2 are both 0?  Can a blue tooth wireless transmission cause the wire to fill up with electromotive force EMF and cause the LED to glow? Yes! This is the drawback.  

Is this something a designer should be worried about? Yes! When working with tristate wires, have to make sure that the wire is driven by some input at all times. Could be driven to 1 or driven to a 0.

Why emphasis on tristate in this lab? Three reasons:

1. What does the error message multi-driven net mean? What would you look for as an error in your circuit design?
2. An entire computer can be built with tristate buffers. Printers from the 1970's by HP were sometimes built entirely with tristate buffers. Nothing else. 
3. Seven segment displays and RAM use tristate to cut down on the number of wires or nets required by using tristate.

## BeCreative!

Hook the switches to the LED's in some creative way of your choice using the concepts you learned in this lab.

Many people are replacing light bulbs with LED's that last forever. Most are 12 volt DC.  They are being connected to AC through wall warts that waste energy. Some are running 12 volt systems in parallel with the AC. Some are using AC to switch the 12 volt. Others are using smart phones and circuits to control lighting within the home. There is a transition, a business opportunity, a standards opportunity here.  Compare the "3 way" switch at Home Depot or Lowes (that supports 2 switches controlling one light) with the voltage controlled buffer. Does the voltage controlled buffer reduce the amount of copper needed?