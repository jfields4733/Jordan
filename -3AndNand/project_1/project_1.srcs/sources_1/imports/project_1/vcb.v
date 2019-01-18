`timescale 1ns / 1ps

module vcb(
   input  sw0,
   input  sw1,
   output tri LED
   );
   tri w;
   bufif1 b1(w, 1, sw0);
   bufif1 b2(w, 1, sw1);
   assign LED=w;
endmodule