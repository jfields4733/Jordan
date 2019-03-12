module simpleRing (
  output [8:0] LED,
  output [5:0] Y,
  input clock, reset, reset1, reset2, enable
);
	reg [2: 0] currentState, nextState;
    reg [24:0] ClockCounter;
    reg [5:0] YY;
	parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101, S6 = 3'b110, S7 = 3'b111;

    always @ (posedge clock)
       if (reset == 1) ClockCounter = 25'b0000000000000000000000000;
       else ClockCounter =  ClockCounter + 1;
	
	always @ ( posedge ClockCounter[24], negedge reset) 
		if (reset == 1) currentState <= S0;
		else if (enable == 0) currentState <= nextState;
		
	always @ (currentState) begin	
		  case(currentState)
			S0: begin nextState = S1; YY = 6'b000001; end
			S1: begin nextState = S2; YY = 6'b000010; end
			S2: begin nextState = S4; YY = 6'b000100; end
			S3: begin nextState = S4; YY = 6'b000000; end
			S4: begin nextState = S5; YY = 6'b001000; end
			S5: begin nextState = S6; YY = 6'b010000; end
			S6: begin nextState = S0; YY = 6'b100000; end
			S7: begin nextState = S0; YY = 6'b000000; end
		  endcase
		  if (reset1 == 1) nextState = S3;
		  if (reset2 == 1) nextState = S7;
	end
	
    assign LED[0] = reset1;
    assign LED[1] = reset2;
    assign LED[2] = enable;
	assign LED[5:3] = currentState;
    assign LED[8:6] = ClockCounter[24:22];
	assign Y = YY;
	
endmodule