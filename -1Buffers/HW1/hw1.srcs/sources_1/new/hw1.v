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
    wire ab,cb,abc;
    assign ab = a&b;
    assign cb= c|b;
    assign abc= !(!(a&b)&c);
    assign x = abc ^ cb;
    assign y = !cb;
    
endmodule
