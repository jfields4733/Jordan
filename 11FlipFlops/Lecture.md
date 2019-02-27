[How do I initialize a wire with a constant?](https://stackoverflow.com/questions/36383980/how-to-initialize-a-wire-with-constant-in-verilog)

State in Verilog, like flip-flop value, is usually kept in `reg` type, where the value can be initialized using `initial`. However, in the simple flip-flop made of gates there are only wires, which can't be initialized.

The design with the crossed NAND gates will in an hardware implementation lead to a stable value at start up, even when the wires are initially undefined `1'bX`. You can emulate this in the circuit using conversion from `1'X` to `1'b0` or `1'b1` at `q` and `q_bar` using assign as:

```
assign w = q !== 1'b0;  // 1'bX => 1
assign z = q_bar === 1'b1;  // 1'bX => 0
```

The Verilog implementation will however give a race condition, since the clock pulse will always be too long for the immediate change that occur if this design is simulated. This is typically shown as an infinite iteration during simulation, thereby reaching iteration limits with resulting error.