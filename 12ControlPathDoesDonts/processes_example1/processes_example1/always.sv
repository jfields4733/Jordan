`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2012 08:23:06 PM
// Design Name: 
// Module Name: always_example
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
//  always.sv : top level module
//
//This example covers the following SystemVerilog structures:
//1. always procedural block
//2. always_ff procedural block
//3. operator: &
//4. procedural timing control
//////////////////////////////////////////////////////////////////////////////////

module always_example(
    input wire a1,
    input wire a2,
    input wire clk,
    output reg q
    );

reg b;

always @(a1 or a2) begin //always statement can be used with procedural timing control
b = a1 & a2;
end

always_ff @(posedge clk) begin
q <= b;
end
      
endmodule