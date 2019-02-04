`timescale 1ns / 1ps

module vcb(
   input  sw0,
   input  sw1,
   output tri LED
   );
   bufif1 b1(LED, sw0, sw0);
   bufif1 b2(LED, sw1, sw1);
endmodule