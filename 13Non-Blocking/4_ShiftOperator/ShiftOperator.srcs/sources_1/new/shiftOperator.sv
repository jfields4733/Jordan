`timescale 1ns / 1ps

module shiftOperator(
    input In,
    input [7:0] startingData,
    input leftRightShift,
    input [2:0] bitsShift,
    output reg [7:0] outData  
    );

    reg [7:0] notStartingData;
    assign notStartingData = ~startingData;
    reg [7:0] tempData;
    always_comb 
    case ({In,leftRightShift})
        2'b00 : outData = startingData << bitsShift;
        2'b01 : outData = startingData >> bitsShift;
        2'b10 : begin tempData = notStartingData << bitsShift; outData = ~tempData; end
        2'b11 : begin tempData = notStartingData >> bitsShift; outData = ~tempData; end
      default : outData = startingData;
    endcase

endmodule
