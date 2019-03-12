`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2019 07:08:47 AM
// Design Name: 
// Module Name: FourWideMux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module wobblyRing(
 input clk,
 input rst,
 output [15:0] LED
 );

parameter DELAY = 1000;
wire [DELAY-1:0] delay_line /* synthesis keep */;

reg [31:0] cntr;
reg sync0;
reg wobble;

// unstable ring oscillator
genvar i;
generate
for (i=1; i<DELAY; i=i+1)
  begin : del
    assign delay_line [i] = delay_line[i-1];
  end
endgenerate
assign delay_line [0] = !delay_line [DELAY-1];

// sync it over to the input clock
always_ff @(posedge clk) begin
  sync0 <= delay_line[0];
  wobble <= sync0;
end

// count when the wobbly oscillator is high
always_ff @(posedge clk or posedge rst) begin
  if (rst) cntr <= 0;
  else if (wobble) cntr <= cntr + 1;
end

assign LED = cntr[31:16];

endmodule
