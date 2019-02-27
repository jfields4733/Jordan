
module decoderToMuxTest(
    input [2:0] select,
    output [7:0] LED,
    output muxOut
    );
    wire [7:0] inBetween;
    
    assign muxOut = inBetween[select];
    assign inBetween = 1 << select;
    assign LED = inBetween;
    
endmodule
