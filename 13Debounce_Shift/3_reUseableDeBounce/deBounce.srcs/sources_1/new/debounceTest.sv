`timescale 1ns / 1ps


module debounceTest(
    input clk,
    input button, //center button in diamond
    input switch, //sw[0]
    output buttonLED,
    output switchLED
    );
    
    debounce i1(
        .clk(clk),
        .sw_i(button),
        .sw_o(buttonLED)
        );
        
    debounce i2(
        .clk(clk),
        .sw_i(switch),
        .sw_o(switchLED)
        );        
    
endmodule
