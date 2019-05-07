`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2019 12:24:23 PM
// Design Name: 
// Module Name: posedge2
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


module posedge2(
input clk,
input rst,
input sw,
input sw4,
input load,
output reg LED2,
output reg LED
    );
    

   always @(negedge clk)
      if (!rst) begin
         LED <= 1'b0;
      end else if (load) begin
         LED2 <= sw4;
      end else begin
         LED <= sw;
      end
      
						
								
						
										
						
endmodule
