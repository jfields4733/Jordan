`timescale 1ns / 1ps

module EveryOther(
    input x,
    output reg z,
    output reg [1:0] state
    );
    always_ff @ (posedge x) begin
        state=state+1;
        if (state==0) z=1; else z=0;
    end
endmodule
