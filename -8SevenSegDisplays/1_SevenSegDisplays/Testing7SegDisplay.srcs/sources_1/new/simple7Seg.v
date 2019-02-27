module simple7Seg(
    input [15:0] SW,
    output [6:0] C,
    output DP,
    output [7:0] AN,
    output [15:0] LED
    );

   assign C = SW[6:0];
   assign DP = SW[7];
   assign AN = SW[15:8];
   assign LED = SW;
endmodule
