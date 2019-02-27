`timescale 1ns / 1ps


module PriorityEncoder(
    input [7:0] y,
    output reg [2:0] abc,
    output reg [0:0] d
    );
    integer i;
    always_comb begin
        abc=0;
        d = | y;
        for (i=7; i>=0; i = i-1) if (y[i]==1) abc=7-i;
    end
endmodule
