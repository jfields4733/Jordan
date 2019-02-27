//nested for loop test

module nestedFor(
    input clk,
    input [14:0] SW,
	output [14:0] LED
);

reg [1:0] i;
reg [1:0] j;
reg [7:0] LED1;
reg [6:0] LED2;
assign LED = {LED2,LED1};
always_ff @ (posedge clk) begin
    LED1 = SW[7:0];
    LED2 = SW[14:8];
	for (i = 0; i < 2; i = i + 1) begin
		LED1 = LED1 << 2;
		for (j = 0; j < 2; j = j + 1) LED2 = LED2 >> 1;
	end
end
endmodule