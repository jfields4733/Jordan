
module m16x4Mux(
    input [15:8] I,
    input [3:0] select,
    input bank,
    input enter,
    input reset,
    output bankSelected,
    output q,
    output reg [15:8] LED,
    output [3:0] LEDselected
    );
    
    reg [15:0] muxInput;

    initial muxInput=0;
    
    always @* begin
        if (reset) muxInput = 0; else begin
            if (enter) if (bank) muxInput[15:8] = I[15:8]; else muxInput[7:0] = I[15:8];
            else if (bank) LED[15:8] = muxInput[15:8]; else LED[15:8] = muxInput[7:0];
        end
    end
    assign LEDselected = select;
    assign q = muxInput[select];
    assign bankSelected = bank;
endmodule
