# Lots of Gates

## Digital Design Goals

Digital design goals in the 1970 and 80's involved reducing chip count (number of gates) to reduce cost,  reduce power consumed and increase speed. 

The second digital design goal was to reuse circuits. Is this still the case? The goal is to see if Vivado randomly sprinkles circuits within an FPGA or reuses circuits. 

#### Wires

Today wires are the focus. How long wires are, how close they are to each other has evolved into a set of electrical engineering design rules called "[microstrip](https://en.wikipedia.org/wiki/Microstrip)." Fortunately, the wires are permanently placed in the FPGA and the design rules are built into Vivado Implement.  So like all the other detail that develops rules/standards and grows very slowly if at all, this knowledge has become part of the technical expertise world. Because engineers focus on "the" one of a kind " or "the rapidly changing world", a modern digital design class doesn't focus on this. 

#### 5 building blocks: LUTs, muxes, xor, carry-logic and D flip flops

Everything use to be about gates: software that simulate gates, algorithms and math that reduce gate counts, typical circuits that are built with gates, drawings of gates, gate testing, etc. 

Today in RTL verilog coding of gates looks like a math equation or the logic of loops, if, while , case or other programming constructs. The Vivado code may display pictures of gates in the RTL analysis, but synthesis and implementation describe the circuit in terms of the CLB, slices, and contents of slices in terms of just these devices: LUTs, muxes, xor, carry-logic and D flip flops. 

#### Workflow .. code .. test .. deploy

Digital design has been simplified. What now consumes an engineers time is an enlarged workflow that includes testing and deployment. Today "firmware" upgrades can include reprogramming FPGA chips and redesigning circuits. Satellites are remotely repaired by reprograming FPGA chips to use spare parts that are launched with the satellite.  This is why the rapidly changing agile software development techniques today impact circuit design.

#### Programming in Parallel

What makes programming an FPGA different than C is that the learning curve starts off assuming all lines of code execute in parallel. Learning to read music and play a song on the piano where four notes are played at once while another note is held and two fingers trill as fast as possible is more similar to FPGA programming . Csound , a python based synthesizer from MIT multimedia labs uses the term "Non-blocking" in exactly the same context as Verilog.  More on this later.

