// Verilog model of circuit of Figure 3.35 in Digital Systems 5th ed. 

module triState(A, B, C, D);
   
   output D;
   input  A, B, C; //A & B are the inputs, C is the select line and D is the output
   tri D;

   bufif1 nb0(D, A, C);
   bufif0 nb1(D, B, C);


endmodule

     
