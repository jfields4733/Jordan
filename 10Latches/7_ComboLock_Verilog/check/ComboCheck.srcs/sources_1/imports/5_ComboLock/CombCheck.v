module CombCheck (
	input y2,
	input y4,
	input y5,
	input [3:0] enteredCombo,
	output s1,
	output s2,
	output [3:0] LED,
	output passFail
	
);

    reg [15:0] Combo = 16'HEF12;
    //ComboCombinatory output .. which combination looking for
    //no loops here, from state of y2,y4,y5 can tell which of the four combinations one is looking for
    //s is a select line, which selects from mux input what the current combination should be
    //to compare against the input combination
    wire s1_2xAND;
    assign s1_2xAND = ~y2 & ~y5;
    assign s1 = s1_2xAND | y4;
    
    wire s2_2xAND;
    assign s2_2xAND = y4 & y5;
    assign s2 = s2_2xAND | y2;
   
    //Mux that selects which combination to compare with
    //input are select lines s1 and s2 to select among four combinations
    //the selected combination is 4 bits
    
     wire [1:0] s;
     assign s = {s2,s1};
     wire [3:0] comboCheck;
     assign comboCheck = Combo[4*s +: 4];
     assign LED = comboCheck;
     
     // now compare with entered combination
     
    wire [3:0] result;
    assign result = comboCheck ^ enteredCombo;
    assign passFail = | result;
    
    

	
endmodule


