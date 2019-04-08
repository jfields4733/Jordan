`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Howard Community College
// Engineer: Scott Foerster
// 
// Create Date: 12/12/2018 11:40:43 AM
// Design Name: mul4bits 
// Module Name: manual multiply
//////////////////////////////////////////////////////////////////////////////////


module mul4bits(
    input [3:0] a,
    input [3:0] b,
    output [7:0] x
    );
    assign x = a*b;
    
endmodule
