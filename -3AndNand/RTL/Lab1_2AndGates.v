`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Howard Community College
// Engineer: Scott Foerster
// 
// Create Date: 11/14/2018 04:26:17 PM
// Module Name: AndGates
//////////////////////////////////////////////////////////////////////////////////


module AndNandGates(
    input [1:0] SW,
    output [1:0] LED
    );
    assign LED[0] = (SW[0] & SW[1]);
    assign LED[1] = ~(SW[0] & SW[1]);
    
endmodule
