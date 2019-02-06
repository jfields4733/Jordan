`timescale 1ns / 1ps

module vcb(
   input  sw0,
   input  sw1,
   output tri LED
   );
   tri w;
   bufif1 b1(w, sw0, 1);
   bufif1 b2(w, sw1, 1);
   assign LED=w;
endmodule