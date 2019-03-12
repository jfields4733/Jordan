`timescale 1ns / 1ps

module split16to32Display(
    input clk,
    input [7:0] SW, //so can change display a bit
    input reset,
    input hexBCD,
    input [2:0] dp_selector,
    input bankSwitch,
    input split,
    output [7:0] anodes,
    output [7:0] abcdefgdp,
    output [15:0] display_o
    );
    wire [31:0] display;
    assign display = {8'b0000_0000,{SW[7:0]},16'b0000_0000_1011_1101};

    Eight7SegDisplay instanciation(
        .clk(clk), //normal 100Mhz clock .. causes anodes to cycle 400 times a second
        .display(display), //these are the 32 bits to display .. coming from counter in this example
        .reset(reset), //starts anode counter over again .. part of good design .. really doesn't impact the module
        .hexBCD(hexBCD), //switches the display from 32 bits binary to 28 bits BCD
        .dp_selector(dp_selector), //three bits tell which decimal place dot to turn on
        .abcdefgdp(abcdefgdp), //tells which decimal place to display
        .anodes(anodes), //which of the eight segments is being updated at the moment with abcdefgdp
        .display_o(display_o), // output of the module that feeds back lower or upper 16 bits for display on LEDs
        .split(split), // split up BCD calculation and 0 blanking between the two groups of 4 displays
        .bankSwitch(bankSwitch) // tells eight seg display which of the upper or lower 16 bits to display on LEDs
                                // enables showing of BCD counting versus hex counting
    ); 

endmodule