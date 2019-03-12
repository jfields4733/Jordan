`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2012 08:23:06 PM
// Design Name: 
// Module Name: latch_example
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
//  always_latch.sv : top level module
//
//This example covers the following SystemVerilog structures:
//1. always_latch procedural block
//////////////////////////////////////////////////////////////////////////////////

module latch_example(
    input wire data,
    input wire en,
    input wire reset,
    output reg q
    );
    
always_latch   //always_latch provides a quick way to create a latch, you must specify a control signal for the latch enable
if (~reset) begin
q <= 1'b0;
end else if (en) begin
q <= data;
end
      
endmodule
