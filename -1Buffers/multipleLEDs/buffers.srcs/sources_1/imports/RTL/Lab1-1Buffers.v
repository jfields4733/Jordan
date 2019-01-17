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
    input SW,
    output [15:0] LED
    );
    assign LED[0] = SW;
    assign LED[1] = SW;
    assign LED[2] = SW;
    assign LED[3] = SW;
    assign LED[4] = SW;
    assign LED[5] = SW;
    assign LED[6] = SW;
    assign LED[7] = SW;
    assign LED[8] = SW;
    assign LED[9] = SW;
    assign LED[10] = SW;
    assign LED[11] = SW;
    assign LED[12] = SW;
    assign LED[13] = SW;
    assign LED[14] = SW;
    assign LED[15] = SW;

endmodule
