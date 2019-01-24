`timescale 1ns / 1ps

module m16x4Mux(
 input [15:0] tTC,
 input [3:0] ABCD,
 output muxOut);
 wire [3:0] wInternal;
 m4x2Mux m1(tTC[3:0], ABCD[1:0], wInternal[0]);
 m4x2Mux m2(tTC[7:4], ABCD[1:0], wInternal[1]);
 m4x2Mux m3(tTC[11:8], ABCD[1:0], wInternal[2]);
 m4x2Mux m4(tTC[15:12], ABCD[1:0], wInternal[3]);
 m4x2Mux m5(wInternal, ABCD[3:2], muxOut);
endmodule

