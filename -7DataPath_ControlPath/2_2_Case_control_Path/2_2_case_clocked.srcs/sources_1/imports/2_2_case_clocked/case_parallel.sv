

module case_parallel(
   input [1:0] select,
   input clk,
   input [3:0] c,
   output reg [2:0] LED
);

    // circuit 1 identical to if
    always_ff @ (posedge clk)
		case (select)
			2'b00 : LED[0] <= c[0];
			2'b01 : LED[0] <= c[1];
			2'b10 : LED[0] <= c[2];
			2'b11 : LED[0] <= c[3];
		endcase
    
    // circuit 2 
    always_ff @ (posedge clk) 
      LED[1] = 
        select==2'b00 ? c[0] :
        select==2'b01 ? c[1] :
        select==2'b10 ? c[2] :
        select==2'b11 ? c[3] :
        c[0];   
            
    //circuit 3 .. this does the same thing
    always_ff @ (posedge clk) LED[2] <= c[select];
    
endmodule
        