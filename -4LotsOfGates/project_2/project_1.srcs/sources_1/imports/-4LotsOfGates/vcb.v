`timescale 1ns / 1ps

module vcb(
   input  [2:0] SW,
   output [3:0] LED
   );
   assign LED[0] = ~SW[0]|SW[1];
   assign LED[1] = ~SW[1]|SW[2];
   assign LED[2] = ~((SW[0]^SW[1])&~SW[1]);
   assign LED[3] = ~SW[1]|SW[2];
   
//   wire w1,w2,w3,w4;
//   and a1(w1,SW[0],SW[1]);
//   nor  o1(w2,~SW[1],~SW[2]);
//   nand a2(w3,SW[1],SW[2]);
//   or   o2(w4,w1,w2);
//   and  a3(LED[0],w3,w4);
//   assign LED[1] = SW[0] && SW[1] && !SW[2];
endmodule