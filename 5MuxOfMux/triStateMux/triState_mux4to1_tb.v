// Verilog test bench for triState_mux4to1
`timescale 1ns/100ps
//`include "triState_mux4to1.v"

module triState_mux4to1_tb;

   wire A, B, C, D, I, J, Y;
   integer k=0;

   assign {A,B,C,D,I,J} = k;
   triState_mux4to1 the_circuit(A, B, C, D, I, J, Y);

   initial begin

      $dumpfile("triState_mux4to1.vcd");
      $dumpvars(0, triState_mux4to1_tb);

      for (k=0; k<64; k=k+1)
        #10 $display("done testing case %d", k);

      $finish;

   end

endmodule
