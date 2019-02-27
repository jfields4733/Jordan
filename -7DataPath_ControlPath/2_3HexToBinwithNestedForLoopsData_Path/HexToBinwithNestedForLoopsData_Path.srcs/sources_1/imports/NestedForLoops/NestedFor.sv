//nested for loop test

module nestedFor(
    input [7:0] SW,
	output reg [11:0] LED
);

integer i; //number of binary bits being converted (SW)
integer j; //number of segments of BCD that are going to be displayed in LED

always_comb begin
    LED = 0;
	for (i = 7; i >=0; i = i - 1) begin
	   // slicing LED up into groups of 4, adding three if current value is greater than 5
		for (j = 0; j < 3; j = j + 1) if (LED[j*4 +: 4] >= 5) LED[j*4 +: 4] = LED[j*4 +: 4] + 3;
		LED = LED << 1;
		LED[0] = SW[i];
	end
end
endmodule