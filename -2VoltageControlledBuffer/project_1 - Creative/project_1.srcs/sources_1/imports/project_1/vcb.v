`timescale 1ns / 1ps

module vcb(
   input  sw0,
   input  sw1,
   input  sw2,
   input  sw3,
   output tri LED,
   output tri LED1
   );
   bufif1 b1(LED, sw0, sw0);
   bufif1 b2(LED, sw1, sw1);
   bufif1 b3(LED1, sw2, sw2);
   bufif1 b4(LED1, sw3, sw3);
endmodule