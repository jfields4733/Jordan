module CombCheck (
	input  y2,
	input y4,
	input y5,
	output s1,
	output s2
);

    reg Combo = 16'HEF12;
    //ComboCombinatory output .. which combination looking for
    //no loops here, from state of y2,y4,y5 can tell which of the four combinations one is looking for
    //s is a select line, which selects from mux input what the current combination should be
    //to compare against the input combination
    assign s1_2xAND = ~y2 & ~y5;
    assign s1 = s1_2xAND | y4;
    
    assign s2_2xAND = y4 & y5;
    assign s2 = s2_2xAND | y2;
   
    //Mux that selects which combination to compare with
    //input are select lines s1 and s2 to select among four combinations
    //the selected combination is 4 bits


	
endmodule


