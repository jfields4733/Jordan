`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2012 08:23:06 PM
// Design Name: 
// Module Name: always_comb_mux_example
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// This example contains two files:
//  always_comb_mux.sv : top level module
//
//This example covers the following SystemVerilog structures:
//1. always_comb procedural block
//2. operator: ==
//3. block statement
//////////////////////////////////////////////////////////////////////////////////

module  always_comb_mux_example(
input  wire  din_0      , 
input  wire  din_1      , 
input  wire  sel        , 
output reg   mux_out      
);

always_comb
begin : MUX  //Start of Block Statement
  if (sel == 1'b0) begin
      mux_out = din_0;
  end else begin
      mux_out = din_1 ;
  end
end   //End of Block Statement

endmodule 