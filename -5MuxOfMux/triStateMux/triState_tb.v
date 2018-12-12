// Verilog test bench for triState
`timescale 1ns/100ps
`include "triState.v"

module triState_tb;

   wire A, B, C, D;
   integer k=0;

   assign {A,B,C} = k;
   triState the_circuit(A, B, C, D);

   initial begin

      $dumpfile("triState.vcd");
      $dumpvars(0, triState_tb);

      for (k=0; k<8; k=k+1)
        #10 $display("done testing case %d", k);

      $finish;

   end

endmodule
