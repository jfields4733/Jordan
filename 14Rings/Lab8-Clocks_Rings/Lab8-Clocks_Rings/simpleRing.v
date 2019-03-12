module simpleRing (
  output [8:0] LED,
  input clock, reset, reset1, reset2, enable
);
	reg [1: 0] currentState, nextState;
    reg [24:0] ClockCounter;
	parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101, S6 = 3'b110, S7 = 3'b111;

    always @ (posedge clock)
       if (reset == 1) ClockCounter <= 25'b0000000000000000000000000;
       else ClockCounter <=  ClockCounter + 1;
	
	always @ ( posedge ClockCounter[24], negedge reset) 
		if (reset == 1) currentState <= S0;
		else begin
          currentState <= nextState;
		  case (currentState)
			S0: nextState = S1;
			S1: nextState = S2;
			S2: nextState = S4;
			S3: nextState = S4;
			S4: nextState = S5;
			S5: nextState = S6;
			S6: nextState = S0;
			S7: nextState = S0;
		  endcase
        end	
		
	always @ (posedge reset1) nextState <= S3;
	always @ (negedge reset2) nextState <= S7;
	
    assign LED[0] = reset1;
    assign LED[1] = reset2;
    assign LED[2] = enable;
	assign LED[5:3] = currentState;
    assign LED[8:6] = ClockCounter[24:22];
	
endmodule