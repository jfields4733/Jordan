`timescale 1ns / 1ps

module d7segDisplay(
    input [3:0] hexToDisplay,
    input inDecimalPlace,
    input anode,
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g,
    output outDecimalPlace,
    output [7:0] AN
    );
    wire tempDecimalPlace;
    m16x4Mux i1(16'h2812,hexToDisplay,anode,a);
    m16x4Mux i2(16'hd860,hexToDisplay,anode,b);
    m16x4Mux i3(16'hd004,hexToDisplay,anode,c);
    m16x4Mux i4(16'h8692,hexToDisplay,anode,d);
    m16x4Mux i5(16'h02ba,hexToDisplay,anode,e);
    m16x4Mux i6(16'h208e,hexToDisplay,anode,f);
    m16x4Mux i7(16'h1083,hexToDisplay,anode,g);
    vcb v1(inDecimalPlace,anode,tempDecimalPlace);

    assign outDecimalPlace = ~tempDecimalPlace;
    assign AN[0] = ~anode;
    assign AN[7:1] = 7'b1111111;
    
endmodule
