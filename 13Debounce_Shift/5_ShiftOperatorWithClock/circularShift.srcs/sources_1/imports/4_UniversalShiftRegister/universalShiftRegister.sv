`timescale 1ns / 1ps

module clkDivider(
    input clk, //100Mhz clock
    input rst, //button labeled cpu reset on Nexys 4 DDR
    input In, // sw[0]
    input [7:0] parallelIn, //sw8]-[1]
    input leftRightDirection, //sw[15]
    output [7:0] parallelOut, //LED[15]-[8]
    output reg [4:0] LED //LED[5-0]
    );
     
    // clock divider ---------------------------------------------------------------------------------------------
    reg [31:0] divider_counter = 50000000; // 100,000,000/200,000,000 => 20 counts per second 
    
    integer count_up = 100000000; //this is a 32 but counter that add's 1, initialized to this large number so can see more LED's on 
    integer count_clk = 0;
    
    always_ff @ (posedge(clk)) 
        if (rst==0) count_up <= 0;
        else if (count_clk == divider_counter-1) count_up <= count_up + 1; 
           
    always_ff @ (posedge(clk)) 
        if (rst == 0 || count_clk == divider_counter-1 ) count_clk <= 0;
        else count_clk <= count_clk+1;
      
    assign LED = count_up[4:0];

  //shiftOperator module call --------------------------------------------------------------
  shiftOperator i1 (
        .In(In), // sw[0]
        .parallelIn(parallelIn), //sw[8]-sw[1]
        .leftRightDirection(leftRightDirection), //sw[15]
        .numberOfBitsToShift(1), //fills vacated spots with In
        .parallelOut(parallelOut) //led[8]-led[1] 
    );
endmodule  