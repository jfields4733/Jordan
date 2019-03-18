`timescale 1ns / 1ps

module always_comb_example(
    input wire a1,
    input wire a2,
    input wire a3,
    input wire clk,
    input wire mux,
    output reg q
    );

reg b;

always_comb begin 
    b = a1 & a2;
    if (mux) b = a3;
end

always_ff @ (posedge clk) q <= b;
      
endmodule