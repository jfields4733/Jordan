// Verilog model of circuit of Figure 3.35 in Digital Systems 5th ed. 

module triState_mux2to1(A, B, C, D);
   
   output D;
   input  A, B, C; //A & B are the inputs, C is the select line and D is the output
   tri D;

   bufif1 nb1(D, A, C); //selects A when C is 1
   bufif0 nb0(D, B, C); //selects B when C is 0


endmodule

     
module triState_mux4to1(A,B,C,D,I,J,Y);
	output Y;
	input A,B,C,D,I,J;
	tri W,X; // these become input to the last tristate that creates the answer
	
	triState_mux2to1 tris1(A,C,I,W);// one of two wires
	triState_mux2to1 tris2(B,D,I,X);// one of two wires
	triState_mux2to1 tris3(W,X,J,Y);// Y contains the final output
	
endmodule