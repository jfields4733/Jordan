module simpleRing (
  output [15:0] LED,
  input clock, reset, reset1, reset2, enable
);
	reg [2: 0] currentState, nextState;
    reg [31:0] ClockCounter;
    reg [7:0] YY;
   
	parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101, S6 = 3'b110, S7 = 3'b111;

    always @ (posedge clock)
       if (reset == 1) ClockCounter = 0;
       else ClockCounter =  ClockCounter + 1;
	
	always @ ( posedge ClockCounter[24], negedge reset) 
		if (reset == 1) currentState <= S0;
		else if (enable == 0) currentState <= nextState;
		
	always @ (currentState) begin	
		  case(currentState)
			S0: begin nextState = S1; YY = 8'b00000001; end
			S1: begin nextState = S2; YY = 8'b00000010; end
			S2: begin nextState = S4; YY = 8'b00000100; end
			S3: begin nextState = S4; YY = 8'b11111111; end
			S4: begin nextState = S5; YY = 8'b00001000; end
			S5: begin nextState = S6; YY = 8'b00010000; end
			S6: begin nextState = S0; YY = 8'b00100000; end
			S7: begin nextState = S0; YY = 8'b10111111; end
		  endcase
		  if (reset1 == 1) nextState = S3;
		  if (reset2 == 1) nextState = S7;
	end
	
    assign LED[7:0] = YY;
    assign LED[15] = reset;
    assign LED[14] = reset1;
    assign LED[13] = reset2;
    assign LED[12] = enable;
    assign LED[11] = clock;
	assign LED[10] = currentState[2];
    assign LED[9] = currentState[1];
    assign LED[8] = currentState[0];
	
endmodule