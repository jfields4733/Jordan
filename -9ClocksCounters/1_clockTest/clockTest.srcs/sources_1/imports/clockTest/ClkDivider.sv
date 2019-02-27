module clkDivider(
    input clk,
    input rst, //SW[0]
    input [1:0] outputBankSelect, //SW[1],SW[2] there are 32 bits of cout_up, displayed 8 at a time in the LEDs
    input slowFast, //SW[3]
    output [7:0] count_small,
    output [2:0] anode_small,
    output [7:0] AN,
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g
    );
     
reg [31:0] divider_counter = 50000000; // 100,000,000/50,000,000 = 2 counts per second 
reg [31:0] divider_anode = 100000000; //with 100,000,000/100,000,000 = 1 count per second

integer count_clk = 0; //this is the counter to be displayed by the 7 seg display
integer anode_clk = 0; //this is the clock that is to cause a 3 bit counter to to change 50 times a second

integer count_up = 100000000; //this is a 32 but counter that add's 1 
reg [2:0] anode_up = 0; //this counts slowly so can see individual anodes .. or not .. if you want to see them all on

always_ff @ (posedge(clk), posedge(rst))
begin
    if (rst == 1) count_clk <= 0;
    else if (count_clk == divider_counter-1) begin
     count_clk <= 0;
     count_up <= count_up + 1;
     end         
    else count_clk <= count_clk + 1;
end

always_ff @ (posedge(clk), posedge(rst))
begin
    if (rst == 1) anode_clk <=0 ;
    else if (anode_clk == divider_anode-1) begin
        anode_clk <=0 ;
        anode_up <= anode_up+1;
    end         
    else anode_clk<=anode_clk + 1;
end

assign count_small = count_up[8*outputBankSelect +: 8];
assign anode_small = anode_up[2:0];

//creates the three bars on the seven segment displays
assign AN = ~(1 << anode_up);
assign a=0;
assign b=1;
assign c=1;
assign d=0;
assign e=1;
assign f=1;
assign g=0;

//switches counting speeds
always_comb 
    if (slowFast==0) begin
        divider_counter = 50000000; // 100,000,000/50,000,000 = 2 counts per second 
        divider_anode = 100000000; //with 100,000,000/100,000,000 = 1 count per second
    end
    else begin
        divider_counter = 500000; // 100,000,000/100,000,000 = 200 counts per second 
        divider_anode = 50000; //with 100,000,000/50,000 = 200 count per second
    end

endmodule