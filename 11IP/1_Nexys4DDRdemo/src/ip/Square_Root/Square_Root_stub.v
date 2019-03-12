// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Sun May 14 17:24:26 2017
// Host        : Brendan-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub D:/Vivado_Labs/User_Demo/src/ip/Square_Root/Square_Root_stub.v
// Design      : Square_Root
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "cordic_v6_0_11,Vivado 2016.4" *)
module Square_Root(aclk, s_axis_cartesian_tvalid, 
  s_axis_cartesian_tdata, m_axis_dout_tvalid, m_axis_dout_tdata)
/* synthesis syn_black_box black_box_pad_pin="aclk,s_axis_cartesian_tvalid,s_axis_cartesian_tdata[31:0],m_axis_dout_tvalid,m_axis_dout_tdata[15:0]" */;
  input aclk;
  input s_axis_cartesian_tvalid;
  input [31:0]s_axis_cartesian_tdata;
  output m_axis_dout_tvalid;
  output [15:0]m_axis_dout_tdata;
endmodule
