`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2019 12:18:28 PM
// Design Name: 
// Module Name: test
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


module test(
input clk,
input rst,
input sw,
input ce,
input load,
input sw4,
output reg LED,
output reg LED2
    );
    
   always @(negedge clk)
      if (!rst) begin
         LED <= 1'b0;
      end else if (load) begin
         LED2 <= sw4;
      end else if (ce) begin
         LED <= sw;
      end
						
									
											
						
endmodule
