`timescale 1ns / 1ps

module SquareRoot(
    input clk, 
    input [13:0] data_i, //SW[7:0]
    output [7:0] abcdefgdp, //common cathods of 7seg displays
    output [7:0] AN, //which of the 8 7seg displays abcdefgdp is focused upon
    output [15:0] LED
    );
    wire [15:0] readyData;
    wire ready;
    reg enter=1;
    
    //always_comb if (ready) LED=readyData; else LED=0; 
    reg [31:0] c_input;
    assign LED = c_input[31:16];
         
    cordic_0 instan1(
        .aclk(clk),
        .s_axis_cartesian_tvalid(enter),
        .s_axis_cartesian_tdata(data_i),
        .m_axis_dout_tvalid(ready),
        .m_axis_dout_tdata(readyData)
        );
    
    assign c_input = {data_i,readyData};
    reg reset=0; //no way to clear the display
    reg hexBCD=1; //want display in BCD .. only works when all 32 bits are one hex number
    reg [2:0] dp_selector = 0; //no decimal place in this project
    wire display_o; // 7seg display can output 16 bits to display on LED's if desired, ignoring this, nothing going to the LEDs
    reg bankSwitch = 0; //tells 7seg to put on display_o either upper or lower of 32 bits .. we are not using the display
    reg split = 1; //tells 7seg to split up the displays into two numbers, separately converted to BCD, separately leading zero blanked
    
    Eight7SegDisplay instantiation(
        .clk(clk), //normal 100Mhz clock .. causes anodes to cycle 400 times a second
        .display(c_input), //these are the 32 bits to display .. coming from counter in this example
        .reset(reset), //starts anode counter over again .. part of good design .. really doesn't impact the module
        .hexBCD(hexBCD), //switches the display from 32 bits binary to 28 bits BCD
        .dp_selector(dp_selector), //three bits tell which decimal place dot to turn on
        .abcdefgdp(abcdefgdp), //tells which decimal place to display
        .anodes(AN), //which of the eight segments is being updated at the moment with abcdefgdp
        .display_o(display_o), // output of the module that feeds back lower or upper 16 bits for display on LEDs
        .split(split), // split up BCD calculation and 0 blanking between the two groups of 4 displays
        .bankSwitch(bankSwitch) // tells eight seg display which of the upper or lower 16 bits to display on LEDs
                                // enables showing of BCD counting versus hex counting
    ); 
    
         
endmodule
