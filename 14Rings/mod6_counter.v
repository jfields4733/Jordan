module jkff(
  input J,
  input clk,
  input K,
  output Q,
  output Qnot
);

	reg state;

    assign Q = state;
    assign Qnot = ~state;

    always @ (posedge clk) begin
        if (~J & K)
            state <= 1'b0;
         else if (J & ~K)
            state <= 1'b1;
         else if (J & K)
            state <= ~state;
    end
	
endmodule

module mod6_jkff (
  input clk,
  output Qa,
  output Qb,
  output Qc
);
  wire s0, s1,s2,s3;
  wire Qa_temp,Qb_temp,Qc_temp;
  
  jkff i0 ( s0, clk,s1,Qa_temp,s2); //a 
  jkff i1 ( s3,clk,Qa_temp,Qb_temp, s1 ); //b
  jkff i2 (Qb_temp,clk,s2,Qc_temp ,s3); //c
   
   assign s0 = (Qc_temp & Qb_temp);
   assign Qa = Qa_temp;
   assign Qb = Qb_temp;
   assign Qc = Qc_temp;

   endmodule