`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: HCC
// Engineer: Scott Foerster
// 
// Create Date: 11/14/2018 10:32:01 AM
// Design Name: Switches connected to LEDs
// Module Name: switchLED
//////////////////////////////////////////////////////////////////////////////////

module switchLED(
    input [1:0] SW,
    output [15:0] LED
    );
    assign LED[15] = SW[1];
    assign LED[14] = SW[1];
    assign LED[13] = SW[1];
    assign LED[12] = SW[1];
    assign LED[11] = SW[1];
    assign LED[10] = SW[1];
    assign LED[9] = SW[1];
    assign LED[8] = SW[1];
    assign LED[7] = SW[0];
    assign LED[6] = SW[0];
    assign LED[5] = SW[0];
    assign LED[4] = SW[0];
    assign LED[3] = SW[0];
    assign LED[2] = SW[0];
    assign LED[1] = SW[0];
    assign LED[0] = SW[0];
    
endmodule
