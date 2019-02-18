`timescale 1ns / 1ps

module vcb(
   input  [2:0] SW,
   output [3:0] LED
   );
   assign LED[0] = ~SW[0]|SW[1];
   assign LED[1] = ~SW[1]|SW[2];
   assign LED[2] = ~((SW[0]^SW[1])&~SW[1]);
   assign LED[3] = ~SW[1]|SW[2];
   
endmodule