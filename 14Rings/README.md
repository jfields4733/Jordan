# 14 Rings

# 1 Rings

Ring circuits are those where the output is driven by the state. The only inputs are enable, and reset(s). The example here is a complicated ring. Your goal is to predict the output before looking at the implemented circuit. Make this prediction in your lab notebook. Create a Rant, particularly if your prediction was wrong. Go back to the code and try again. Don't bounce back and forth staring at the code and then the actual circuit working before writing. You want to design, not troubleshoot. You want to engineer, not repair. The goal here is design engineering. 

*What was your initial hypothesis from reading the code?*

*What does the actual circuit do?* 

*This project includes a more simple clock. It is not as flexible as the previous clocks you have seen. In what way is it "not as flexible?"*

## 2 Mod 
Computer science algorithms include an integer math called Modular Arithmetic. Very simple circuits can be built that do this.  Read this [Khan Academy introduction to Modular Arithmetic](https://www.khanacademy.org/computing/computer-science/cryptography/modarithmetic/a/what-is-modular-arithmetic) and go through the first practice.  Then start inspecting these circuits. 

Mod 2 is also called [parity](https://en.wikipedia.org/wiki/Parity_bit) the most simple form of error detection possible. 

Here is the statemachine version:![1553876787138](assets/1553876787138.png)

![1553880787836](assets/1553880787836.png)

## 3 CRC

A **cyclic redundancy check** (**CRC**) is an [error-detecting code](https://en.wikipedia.org/wiki/Error_detection_and_correction) commonly used in digital [networks](https://en.wikipedia.org/wiki/Telecommunications_network) and storage devices to detect accidental changes to raw data. We are interested in its [computation](https://en.wikipedia.org/wiki/Computation_of_cyclic_redundancy_checks) as illustrated by these graphics:

![CRC8-gen](assets/CRC8-gen.gif)

![CRC8-rx](assets/CRC8-rx.gif)

Start at these graphics. The upper one is the sending circuit. Data is moving right to left. The data enters first, followed by an equal number of zeros. What follows the data is the CRC.

The lower one is the receiving circuit. The data enters first, then the CRC. If the final result is zero, the receiver is confident the data was stored, transmitted and received correctly.

How would you go about [implementing this CRC](https://www.easics.com/webtools/crctool)? Would you start at the gate level like this diagram shows or would you by drawing a finite state machine? 

## 4 Hamming Codes

