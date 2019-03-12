`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2012 08:23:06 PM
// Design Name: 
// Module Name: always_comb_example
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
//  always_comb.sv : top level module
//
//This example covers the following SystemVerilog structures:
//1. always_comb procedural block
//2. always_ff procedural block
//3. operator: &
//////////////////////////////////////////////////////////////////////////////////

module always_comb_example(
    input wire a1,
    input wire a2,
    input wire a3,
    input wire clk,
    input wire mux,
    output reg q
    );

reg b;

always_comb begin //For always_comb statement a sensitivity list is inferred by the logic driving the always_comb statement
b = a1 & a2;
if (mux)
b = a3;
end

always_ff @ (posedge clk)
begin
q <= b;
end
      
endmodule