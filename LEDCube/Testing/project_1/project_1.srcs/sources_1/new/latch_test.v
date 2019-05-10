`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2019 02:17:15 PM
// Design Name: 
// Module Name: latch_test
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


module latch_test(
input [7:0] pwm,
input pwmLatch,
input address,
input clk,
output reg LEDBlue,
output [15:0] LED
);

wire gate1, gate3, gate4, gate5;

reg [7:0] gate2;

integer clock_counter = 0;
reg [7:0] count_up = 0;

reg [31:0] clock_divider = 50000000; 

assign gate1 = pwmLatch * address;
//assign gate2[7] = pwm[7] ~^ count_up[7];
//assign gate2[6] = pwm[6] ~^ count_up[6];
//assign gate2[5] = pwm[5] ~^ count_up[5];
//assign gate2[4] = pwm[4] ~^ count_up[4];
//assign gate2[3] = pwm[3] ~^ count_up[3];
//assign gate2[2] = pwm[2] ~^ count_up[2];
//assign gate2[1] = pwm[1] ~^ count_up[1];
//assign gate2[0] = pwm[0] ~^ count_up[0];
assign gate3 = gate2[7] * gate2[6] * gate2[5] * gate2[4] * gate2[3] * gate2[2] * gate2[1] * gate2[0];
assign gate4 = !(count_up[7] + count_up[6] + count_up[5] + count_up[4] + count_up[3] + count_up[2] + count_up[1] + count_up[0]);
assign gate5 = gate1 + gate4;

assign LED[7:0] = count_up;
assign LED[15:8] = gate2;

always @ (posedge clk) begin
    if(count_up == 255) begin
        count_up <= 0;
    end else if(clock_counter == clock_divider-1) begin
        clock_counter <= 0;
        count_up <= count_up + 1;
    end else begin
        clock_counter <= clock_counter + 1;
        end
end

always @ (posedge gate1) begin
    //q_in[7:0] <= !(count_up[7:0] ^ pwm[7:0]);
    gate2[7] <= pwm[7] ~^ count_up[7];
    gate2[6] <= pwm[6] ~^ count_up[6];
    gate2[5] <= pwm[5] ~^ count_up[5];
    gate2[4] <= pwm[4] ~^ count_up[4];
    gate2[3] <= pwm[3] ~^ count_up[3];
    gate2[2] <= pwm[2] ~^ count_up[2];
    gate2[1] <= pwm[1] ~^ count_up[1];
    gate2[0] <= pwm[0] ~^ count_up[0];
end

always @ (posedge gate5) begin
    LEDBlue <= gate3;
    end

endmodule