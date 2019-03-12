`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2012 08:23:06 PM
// Design Name: 
// Module Name: always_ff_counter
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
//  always_ff_counter.sv : top level module
//
//This example covers the following SystemVerilog structures:
//1. always_ff procedural block
//2. operators : ++
//////////////////////////////////////////////////////////////////////////////////

module always_ff_counter    (
output reg [7:0] out     ,  
input  wire      enable  ,  
input  wire      clk     ,  
input  wire      reset      
);

always_ff @(posedge clk)
if (reset) begin
  out <= 8'b0 ;
end else if (enable) begin
  out ++;
end

endmodule 