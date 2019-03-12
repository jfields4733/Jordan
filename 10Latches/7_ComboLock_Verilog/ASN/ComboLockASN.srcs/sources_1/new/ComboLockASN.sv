`timescale 1ns / 1ps
//the whole point of this is to compare the LUT truth tables with the logic found in this
//spreadsheet on google drive towards the bottom .. is 128 rows long, 7 inputs and 6 outputs
//https://docs.google.com/spreadsheets/d/1nGkVcBFB3kErm-xxgKJ7ydEvMWoGxCaui6ZHOyj6pJw/edit#gid=0

module ComboLockASN(
    input y1,
    input y2,
    input y3,
    input y4,
    input y5,
    input E,
    input S,
    output Y1_3xOR,
    output Y2_3xOR,
    output Y3_5xOR,
    output Y4_4xOR,
    output Y5_5xOR,
    output Z_2xOR
    );
    wire y1,y2,y3,y4,y5,E,S;
    
    //ASN Asynchronous Sequential Network or circuit
    //the y's are the combinatory loops
    //E is enter as in enter the combination
    //S is Start/Clear/Reset 
    
    assign Y1_4xAND = y4 & y5 & E & S;
    assign Y1_2xANDa = y1 & S;
    assign Y1_2xANDb = y1 & E;
    assign Y1_3xOR   = Y1_4xAND | Y1_2xANDa | Y1_2xANDb;
    
    assign Y2_3xANDa = ~y3 & ~E & S;
    assign Y2_3xANDb = y2 & E & S;
    assign Y2_3xANDc = y2 & y5 & ~E;
    assign Y2_3xOR   = Y2_3xANDa | Y2_3xANDb | Y2_3xANDc;
    
    assign Y3_2xAND = y3 & ~E;
    assign Y3_5xOR  = ~y5 | ~S | y4 | Y3_2xAND | y2;
    
    assign Y4_4xANDa = ~y2 & ~y5 & E & S;
    assign Y4_2xANDa = y4 & S;
    assign Y4_4xANDb = ~y1 & y4 & y5 & ~E;
    assign Y4_2xANDb = y1 & E;
    assign Y4_4xOR   = Y4_4xANDa | Y4_2xANDa | Y4_4xANDb | Y4_2xANDb; 
    
    assign Y5_2xANDa = E & ~S;
    assign Y5_2xANDb = ~y2 & y5;
    assign Y5_2xANDc = y5 & ~E;
    assign Y5_2xANDd = y4 & ~E;
    assign Y5_2xANDe = y2 & ~S;
    assign Y5_5xOR   = Y5_2xANDa |  Y5_2xANDb | Y5_2xANDc |  Y5_2xANDd |  Y5_2xANDe;
    
    assign Z_2xANDa = y1 & S;
    assign Z_2xANDb = y1 & E;
    assign Z_2xOR   = Z_2xANDa | Z_2xANDb;
    

   
endmodule
