`timescale 1ns / 1ps


module always_example(
    input wire a1,
    input wire a2,
    input wire clk,
    output reg q
    );

reg b;

always_comb //always statement can be used with procedural timing control
    b = a1 & a2;

always_ff @(posedge clk) 
    q <= b;

endmodule
