`timescale 1ns / 1ps
module m2x1Mux(
  input a,
  input b,
  input select,
  output f,
  output g,
  output h);
  
  //gate implementation
  wire invsel,asel,bsel;
  not U_inv (invsel,select);
  and U_anda (asel,b,invsel),U_andb (bsel,a,select);
  or U_or (f,asel,bsel);
  
  //tristate implementation
  bufif1 nb0(g, a, select);
  bufif0 nb1(g, b, select);
  
  //rtl implementation
  assign h = select ? a : b; //if select then a else b .. cryptic notation
  
endmodule
