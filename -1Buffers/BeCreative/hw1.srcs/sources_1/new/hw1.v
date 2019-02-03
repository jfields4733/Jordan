`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2019 12:12:20 PM
// Design Name: 
// Module Name: hw1
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
// 
//////////////////////////////////////////////////////////////////////////////////


module hw1(
    input a,
    input b,
    input c,
    output x,
    output y
    );
    wire A,Ab,cb,cbb;
    assign A = ~a;
    assign Ab= A|b;
    assign cb= b^c;
    assign cbb = b&cb;
    assign x = Ab;
    assign y = Ab|cbb;
    
endmodule
