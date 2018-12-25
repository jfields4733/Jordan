`timescale 1ns / 1ps
module m2x1Mux(a,b,select,f);
  input a,b,select;
  output f;
  wire invsel,asel,bsel;
  not U_inv (invsel,select);
  and U_anda (asel,a,invsel),U_andb (bsel,b,select);
  or U_or (f,asel,bsel);
endmodule
