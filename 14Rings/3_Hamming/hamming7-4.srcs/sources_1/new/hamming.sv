`timescale 1ns / 1ps

module hamming(
    input [3:0] original,
    input [1:0] scr,
    input [6:0] corrupt, //bits to corrupt .. display is the corrupted bits
    output reg [14:0] LED,
    output error
    );
    
    reg [31:0] display;
    wire [3:0] corrected;
    
    // sending circuit
    wire [6:0] sent;
    assign sent[6] = ^{original[3],original[2],original[0]};
    assign sent[5] = ^{original[3],original[1],original[0]};
    assign sent[4] = original[3];
    assign sent[3] = ^{original[2],original[1],original[0]};
    assign sent[2] = original[2];
    assign sent[1] = original[1];
    assign sent[0] = original[0];
    
    //simulating corrupting with the switches changing things
    //corrupt no bits to see what was originally sent
    //corrupt bits and see what corrupted version looks like .. (toggle)
    wire [6:0] bitsCorrupted;
    assign bitsCorrupted = sent ^ corrupt;
    assign LED[14:11] = sent;
    always @* (scr,corrupt,set) begin
        if (scr[0]) LED[10:4] = bitsCorrupted;
        if (scr[1]) LED[10:4] = sent;
        if (scr[2]) LED[10:4] = corrupt;
        if (scr[3]) LED[10:4] = corrupt;
        end
             
    //receiving circuit
    //computing received parity
    wire [2:0] receivedParity; 
    assign receivedParity[2] = ^{bitsCorrupted[3],bitsCorrupted[2],bitsCorrupted[0]};
    assign receivedParity[1] = ^{bitsCorrupted[3],bitsCorrupted[1],bitsCorrupted[0]};
    assign receivedParity[0] = ^{bitsCorrupted[2],bitsCorrupted[1],bitsCorrupted[0]};
    
    //communicating whether there is an error or not
    assign error = receivedParity[2] != bitsCorrupted[6];
        
    //correcting errors
    assign corrected[3] =  {^{&{^{receivedParity[2],bitsCorrupted[6]},^{receivedParity[1],bitsCorrupted[5]}},bitsCorrupted[3]}};
    assign corrected[2] =  {^{&{^{receivedParity[2],bitsCorrupted[6]},^{receivedParity[0],bitsCorrupted[3]}},bitsCorrupted[2]}};
    assign corrected[1] =  {^{&{^{receivedParity[1],bitsCorrupted[5]},^{receivedParity[0],bitsCorrupted[3]}},bitsCorrupted[1]}};    
    assign corrected[0] =  {^{&{^{receivedParity[2],bitsCorrupted[6]},^{receivedParity[1],bitsCorrupted[5]},^{receivedParity[0],bitsCorrupted[3]}},bitsCorrupted[1]}};  
    
endmodule
