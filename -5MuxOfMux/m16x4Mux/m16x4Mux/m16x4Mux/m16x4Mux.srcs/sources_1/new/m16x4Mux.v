`timescale 1ns / 1ps

module m16x4Mux(tTC,ABCD,anodeControl,m16x4MuxOutput);
 input [15:0] tTC;
 input [3:0] ABCD;
 input anodeControl;
 output m16x4MuxOutput;
 wire [3:0] wInternal;
 wire muxOut;
 m4x2Mux m1(tTC[3:0], ABCD[1:0], wInternal[0]);
 m4x2Mux m2(tTC[7:4], ABCD[1:0], wInternal[1]);
 m4x2Mux m3(tTC[11:8], ABCD[1:0], wInternal[2]);
 m4x2Mux m4(tTC[15:12], ABCD[1:0], wInternal[3]);
 m4x2Mux m5(wInternal, ABCD[3:2], muxOut);
 vcb v1(muxOut,anodeControl,m16x4MuxOutput);
endmodule

