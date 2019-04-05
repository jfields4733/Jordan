`timescale 1ns / 1ps

module universalShiftRegister(
    input In, // sw[0]
    input [7:0] parallelIn, //sw[8]-sw[1]
    input leftRightDirection, //left = 0, right = 1 sw[12]-sw[10]
    input [2:0] numberOfBitsToShift, //fills vacated spots with In
    output reg [7:0] parallelOut //led[8]-led[1] 
    );

    reg [7:0] notStartingData;
    assign notStartingData = ~parallelIn;
    reg [7:0] tempData;
   
    always_comb 
    case ({In,leftRightDirection})
        2'b00 : parallelOut = parallelIn << numberOfBitsToShift;
        2'b01 : parallelOut = parallelIn >> numberOfBitsToShift;
        2'b10 : begin tempData = notStartingData << numberOfBitsToShift; parallelOut = ~tempData; end
        2'b11 : begin tempData = notStartingData >> numberOfBitsToShift; parallelOut = ~tempData; end
      default : parallelOut = parallelIn;
    endcase

endmodule
