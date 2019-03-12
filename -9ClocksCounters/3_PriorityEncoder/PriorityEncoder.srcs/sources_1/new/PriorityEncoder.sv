`timescale 1ns / 1ps


module PriorityEncoder(
    input [7:0] y,
    output reg [2:0] abc1,
    output reg [2:0] abc2,
    output reg [2:0] abc3
    );
	
    integer i;
    
	always_comb begin //priority encoder #1
        abc1=0;
        for (i=7; i>=0; i = i-1) if (y[i]==1) abc1=7-i;
    end
	
	always_comb begin  //priority encoder #2
	   abc2=0;
       for (i=0; i<8; i = i+1) if (y[i]==1) abc2=i;
    end   
	
    always_comb begin //priority encoder #3 .. more general using casez
        abc3=0;
        casez (y)
             8'b1???????: abc3 = 7;
             8'b01??????: abc3 = 6;
             8'b001?????: abc3 = 5;
             8'b0001????: abc3 = 4;
             8'b00001???: abc3 = 3;
             8'b000001??: abc3 = 2;
             8'b0000001?: abc3 = 1;            
        endcase
    end
endmodule
