`timescale 1ns / 1ps

module m4x2Mux(b, select, segOut);
  input [3:0] b;
  input [1:0] select;
  output segOut;
  wire m2x1muxOuta, m2x1muxOutb;
  m2x1Mux I1 (b[0],b[1],select[0],m2x1muxOuta);
  m2x1Mux I2 (b[2],b[3],select[0],m2x1muxOutb);
  m2x1Mux I3 (m2x1muxOuta,m2x1muxOutb,select[1],segOut);
endmodule