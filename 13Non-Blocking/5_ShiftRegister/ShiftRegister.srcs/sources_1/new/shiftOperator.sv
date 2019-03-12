`timescale 1ns / 1ps

module shiftOperator(
    input clk,
    input In,
    input Load,
    input [7:0] initialData,
    input leftRightShift,
    output reg [7:0] outData  
    );

    reg [9:0] MoutData;
    reg [9:0] notStartingData;
    reg [9:0] startingData;
    reg [9:0] shiftRegister;
    reg [9:0] tempData;     
    assign outData = MoutData[8:1];   
    assign notStartingData = ~shiftRegister;
    assign startingData = shiftRegister;

    //control path
    always_ff  @(posedge clk) if (Load) begin
        if (leftRightShift) shiftRegister <= {initialData,In,In};
        else  shiftRegister <= {In,In,initialData};
    end else shiftRegister <= MoutData;
    //data path  
    always_comb 
    case ({In,leftRightShift})
        2'b00 : MoutData = startingData << 1;
        2'b01 : MoutData = startingData >> 1;
        2'b10 : begin tempData = notStartingData << 1; MoutData = ~tempData; end
        2'b11 : begin tempData = notStartingData >> 1; MoutData = ~tempData; end
      default : MoutData = startingData;
    endcase

endmodule
