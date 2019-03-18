`timescale 1ns / 1ps


module  always_comb_mux_example(
input  wire  din_0      , 
input  wire  din_1      , 
input  wire  sel        , 
output reg   mux_out      
);

always_comb //a mux
  if (sel == 1'b0) mux_out = din_0;
  else mux_out = din_1;

endmodule 