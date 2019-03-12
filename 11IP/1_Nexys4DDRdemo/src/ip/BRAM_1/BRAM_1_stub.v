// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Sun May 14 17:25:38 2017
// Host        : Brendan-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub D:/Vivado_Labs/User_Demo/src/ip/BRAM_1/BRAM_1_stub.v
// Design      : BRAM_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_5,Vivado 2016.4" *)
module BRAM_1(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[16:0],douta[11:0]" */;
  input clka;
  input [16:0]addra;
  output [11:0]douta;
endmodule
