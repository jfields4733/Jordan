

module clkDivider(
    input clk,
    input rst, //button labeled cpu reset on Nexys 4 DDR
    input bankSwitch,
    output reg [15:0] LED
    );
     
reg [31:0] divider_counter = 5000000; // 100,000,000/200,000,000 => 20 counts per second 

integer count_up = 100000000; //this is a 32 but counter that add's 1, initialized to this large number so can see more LED's on 
integer count_clk = 0;

always_ff @ (posedge(clk)) 
    if (rst==0) count_up <= 0;
    else if (count_clk == divider_counter-1) count_up <= count_up + 1; 
       
always_ff @ (posedge(clk)) 
    if (rst == 0 || count_clk == divider_counter-1 ) count_clk <= 0;
    else count_clk <= count_clk+1;
  
always_comb
    if (bankSwitch) LED = count_up[31:16]; else LED=count_up[15:0];

endmodule