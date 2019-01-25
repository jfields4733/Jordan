

module decoder(
    input [3:0] select,
    output [15:0] LED
    );
    assign LED = 1 << select;
    
endmodule
