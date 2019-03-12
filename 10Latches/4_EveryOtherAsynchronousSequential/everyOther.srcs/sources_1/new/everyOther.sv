`timescale 1ns / 1ps

module everyOther(
    input X,
    output Y,
    output y1,
    output y2
    );
    
    wire and1;
    wire and2;
    wire and3;
    
    // combinatory loops
    
    assign y1 = Y1;
    assign y2 = Y2;
    assign and1 = y1 & X;
    assign and2 = ~X & y2;
    assign and3 = ~y1 & X;
    assign Y1 = and1 | and2;
    assign Y2 = and2 | and3;
    assign Y = ~ Y1 & Y2;
    
    
endmodule
