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
    input [15:0] SW,
    output [15:0] LED
    );
    assign LED = SW;
endmodule
