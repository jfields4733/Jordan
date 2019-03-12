-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Sun May 14 17:24:18 2017
-- Host        : Brendan-PC running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub D:/Vivado_Labs/User_Demo/src/ip/ClkGen/ClkGen_stub.vhdl
-- Design      : ClkGen
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ClkGen is
  Port ( 
    clk_100MHz_o : out STD_LOGIC;
    clk_200MHz_o : out STD_LOGIC;
    reset_i : in STD_LOGIC;
    locked_o : out STD_LOGIC;
    clk_100MHz_i : in STD_LOGIC
  );

end ClkGen;

architecture stub of ClkGen is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_100MHz_o,clk_200MHz_o,reset_i,locked_o,clk_100MHz_i";
begin
end;
