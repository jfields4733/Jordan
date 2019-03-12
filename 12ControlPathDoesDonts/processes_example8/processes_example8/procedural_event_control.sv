`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2012 08:23:06 PM
// Design Name: 
// Module Name: procedural_timing_control
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
// This example contains two files:
//  procedural_event_control.sv : top level module
//
//This example covers the following SystemVerilog structures:
//1. Event Control: @(*), @(a or b)
//2. Delay Control : #delay
//3. operator : &
//////////////////////////////////////////////////////////////////////////////////

module procedural_timing_control(
    input wire a1,
    input wire a2,
    input wire a3,
    input wire a4,
    input wire a5,
    input wire clk,
    input wire enable,
    input wire reset,
    output reg q1,
    output reg q2,
    output wire q3
    );

always @(*)     //Event control which avoids incorrect sensitivity list
if (enable) begin
q1 <= a1 & a2;
end

always @(clk or reset or a2 or a3) begin     //Event control with sensitivity list
if (reset) begin
q2 <= a2 & a3;
end else if (clk) begin
q2 <= a1;
end
end

assign #10 q3 = a4 & a5;   //Delay control. This is not useful for synthesis, and Vivado synthesis ignores the time statement while still creating logic for the assignment

endmodule