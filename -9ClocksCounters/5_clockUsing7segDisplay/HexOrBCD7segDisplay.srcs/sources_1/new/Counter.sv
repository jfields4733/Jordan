`timescale 1ns / 1ps


module Counter(
    input clk,
    input slowdown,
    input reset, // starts counters over again at 1
    input hexBCD, // switches from displaying 32 bits of hex to displaying 28 bits of hex converted to 32 bits BCD 
    input bankSwitch, //switches LED's to lower 16 and slows down the counting
    input [2:0] dp_selector, // decimal place selector
    output reg dp, // decimal place red light dot on the 7 segment displays
    output reg [7:0] anodes, //on off buttons for each of the 7 segment displays
    output a,b,c,d,e,f,g, // red led's on the seven segment displays
    output reg [15:0] LED // LEDs above the switches
    );
    integer divider_counter; // 50,000,000 with 100,000,000Hz clock means 2 times per second     
    always_comb if (bankSwitch==1) divider_counter=50000000; else divider_counter=1000; //about twice a second
    integer divider_anode = 250000; //with 100,000,000Hz clock means 400Hz clock
    
    integer count_clk = 0; //this is the counter that counts up to the divider_counter and then starts over
 
    integer c_input=451263789; //this creates a variable called c_input with 32 bits that has 1 added to it by a clock
              //in hex is 1AE5 BD2D
              //in decimal is 451,263,789
              //in binary is 0001 1010 1110 0101 1011 1101 0010 1101
              //this is so that if upper 16 bits are displayed on LED's can see them counting, lower 16 will be a blur

    //first clock controlling how fast numbers seem to count on the 8 segments
    //--------------------------------------------------------------------------
    always_ff @ (posedge(clk), posedge(reset))
    begin
        if (reset == 1) begin
            count_clk <= 0;
            c_input <=0;
        end
        else if(slowdown==0) begin
            if (count_clk >= divider_counter-1) begin
                count_clk <= 0;
                c_input <= c_input + 1;
                end         
            else count_clk <= count_clk + 1;
        end
        else count_clk <= count_clk;
    end
    
    Eight7SegDsiplay in(.clk(clk),.display(display),.restet(reset),.hexBCD(hexBCD),.dpselector);  

endmodule
