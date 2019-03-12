`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2012 08:23:06 PM
// Design Name: 
// Module Name: always_ff_example
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
//  always_ff.sv : top level module
//
//This example covers the following SystemVerilog structures:
//1. always_ff procedural block
//////////////////////////////////////////////////////////////////////////////////

module always_ff_example(
    input wire data,
    input wire clk,
    input wire reset,
    output reg q
    );
    
always_ff @ (posedge clk)   //always_ff is a way to create flip-flops, a sensitivity list is required
if (~reset) begin
q <= 1'b0;
end else begin
q <= data;
end
      
endmodule
