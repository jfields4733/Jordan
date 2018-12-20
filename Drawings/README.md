# Drawings

The purpose of drawings is to create the documents that explain the verilog code you are going to write or have written. Typically, you create the drawings, write the code, and then match them backup with the verilog code that was written.  There are three types of drawings in this class:

​	&#09;[Port Interfaces](https://en.wikipedia.org/wiki/Computer_port_(hardware))
​	&#09;[State Diagrams](https://en.wikipedia.org/wiki/State_diagram)
​	&#09;Finite State Machines (FSM):  [Moore](https://en.wikipedia.org/wiki/Moore_machine) and [Mealy](https://en.wikipedia.org/wiki/Mealy_machine)
​	&#09;[Algorithmic State Machines ](https://en.wikipedia.org/wiki/Algorithmic_state_machine) (ASM)

In this class, you will be asked to make drawings of different types. What follows are svg graphics of xml drawings that can be uploaded and edited at [draw.io](https://www.draw.io/).

Modules are circuits. Ports are where wires plug in, like a harbor port where ships dock. 

![PortInterface](PortInterface.svg)

Asynchronous is how the world works. Events drive what happens, not a clock. Synchronous has a clock that orchestrates movement of data between circuits.  The registers remember or output the previous input while the input async data module makes up its mind about what the next input is going to be.

![MoorePortInterface](MoorePortInterface.svg)



The Mealy causes inputs to bypass the registers and directly influence the output. This is used primarily in serial communications such as USB, Ethernet, CanBus, wifi, xbee, bluetooth, etc. Without this there would be more video with sound out of sync with the video because of different compression and error correction techniques. 

![MealyPortInterface](MealyPortInterface.svg)