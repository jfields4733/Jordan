`timescale 1ns / 1ps

module vcb(
   input  sw0,
   input  sw1,
   input  sw2,
   output [1:0] LED
   );
   assign LED[0] = ~(sw0 & sw1 & sw2);
   assign LED[1] = ((sw0 ^ sw1) ^ sw2);
   
endmodule