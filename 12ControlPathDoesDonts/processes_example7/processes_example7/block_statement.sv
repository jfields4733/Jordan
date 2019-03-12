`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2012 08:23:06 PM
// Design Name: 
// Module Name: block_example
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
//  block_statement.sv : top level module
//
//This example covers the following SystemVerilog structures:
//1. block statement
//2. operator : &
//////////////////////////////////////////////////////////////////////////////////

module block_example(
    input wire a1,
    input wire a2,
    input wire a3,
    output reg q1,
    output reg q2
    );

always begin : first_block //begin first block
q1 <= a1 & a2;
end : first_block  //end of first block (optional but increases readability)

always begin : second_block   //begin second block
q2 <= a2 & a3;
end : second_block  //end of second block
      
endmodule