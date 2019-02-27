

module case_parallel(
   input [1:0] select, //3 SW on the extreme left
   input [3:0] c, // 4 SW on the right
   output reg [2:0] LED // 2 LED's on the right
);

    //circuit 1 identical to if
    always_comb begin
		case (select)
			2'b00 : LED[0] = c[0];
			2'b01 : LED[0] = c[1];
			2'b10 : LED[0] = c[2];
			2'b11 : LED[0] = c[3];
			default : LED[0] = c[0];
		endcase
    end 
    
    // circuit 2 
    assign LED[1] = 
        select==2'b00 ? c[0] :
        select==2'b01 ? c[1] :
        select==2'b10 ? c[2] :
        select==2'b11 ? c[3] :
        c[0];      
    
    // circuit 3 .. this does the same thing
    assign LED[2] = c[select];
    
endmodule
        