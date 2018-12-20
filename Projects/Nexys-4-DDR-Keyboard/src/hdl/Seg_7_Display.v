`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc.
// Engineer: Thomas Kappenman
// 
// Create Date:    03/03/2015 09:08:33 PM 
// Design Name: 
// Module Name:    seg7decimal 
// Project Name: Nexys4DDR Keyboard Demo
// Target Devices: Nexys4DDR
// Tool Versions: 
// Description: 7 segment display driver
// 
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module seg7decimal(

	input [31:0] x, // 32 bits of input to be displayed 4 at a time on 8 seven seg displays
    input clk, // the clock
    output reg [6:0] seg, // the 7 leds on a seven seg display
    output reg [7:0] an, // which of the 8 seven seg displays is being displayed at the moment 
    output wire dp //decimal place .. another led (like seg) on one of the 8 seven seg displays
	 );
	 
	 
	wire [2:0] s;	// segments 
	reg [3:0] digit; // 4 bits describing what segment is going to display
	wire [7:0] aen; // anode enable, enable one of the 8 7 segment displays of the nexys4ddr board
	reg [19:0] clkdiv; // counter used to divide the clock (slow down the clock)

	assign dp = 1;
	assign s = clkdiv[19:17];
	assign aen = 8'b11111111; // all anodes initially disabled (active low), one on at a time

// quad 4to1 MUX.


	always @(posedge clk)// or posedge clr)
		
		case(s)
		0:digit = x[3:0]; // s is 00 -->0 ;  digit gets assigned 4 bit value assigned to x[3:0]
		1:digit = x[7:4]; // s is 01 -->1 ;  digit gets assigned 4 bit value assigned to x[7:4]
		2:digit = x[11:8]; // s is 10 -->2 ;  digit gets assigned 4 bit value assigned to x[11:8
		3:digit = x[15:12]; // s is 11 -->3 ;  digit gets assigned 4 bit value assigned to x[15:12]
		4:digit = x[19:16]; // s is 00 -->0 ;  digit gets assigned 4 bit value assigned to x[3:0]
		5:digit = x[23:20]; // s is 01 -->1 ;  digit gets assigned 4 bit value assigned to x[7:4]
		6:digit = x[27:24]; // s is 10 -->2 ;  digit gets assigned 4 bit value assigned to x[11:8
		7:digit = x[31:28]; // s is 11 -->3 ;  digit gets assigned 4 bit value assigned to x[15:12]

		default:digit = x[3:0];
		
		endcase
	
	//decoder or truth-table for 7seg display values
	always @(*)

		case(digit)

		//////////<---MSB-LSB<---
		//////////////gfedcba////////////////////////////////////////////           a
		0:seg = 7'b1000000;////0000												   __					
		1:seg = 7'b1111001;////0001												f/	  /b
		2:seg = 7'b0100100;////0010												  g
		//                                                                       __	
		3:seg = 7'b0110000;////0011										 	 e /   /c
		4:seg = 7'b0011001;////0100										       __
		5:seg = 7'b0010010;////0101                                            d  
		6:seg = 7'b0000010;////0110
		7:seg = 7'b1111000;////0111
		8:seg = 7'b0000000;////1000
		9:seg = 7'b0010000;////1001
		'hA:seg = 7'b0001000; 
		'hB:seg = 7'b0000011; 
		'hC:seg = 7'b1000110;
		'hD:seg = 7'b0100001;
		'hE:seg = 7'b0000110;
		'hF:seg = 7'b0001110;

		default: seg = 7'b0000000; // U

		endcase


	always @(*)begin
		an=8'b11111111;
		if(aen[s] == 1)
		an[s] = 0;
		end


//clkdiv

	always @(posedge clk) begin
		clkdiv <= clkdiv+1;
	end


endmodule
