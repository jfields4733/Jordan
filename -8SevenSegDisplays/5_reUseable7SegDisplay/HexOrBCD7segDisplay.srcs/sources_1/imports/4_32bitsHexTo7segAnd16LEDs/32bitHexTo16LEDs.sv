
module thirtyTwobitHexTo16LEDs(
    input clk, // is automatic
    input stop_start, // pauses
    input reset, // starts counters over again at 1
    input hexBCD, // switches from displaying 32 bits of hex to displaying 28 bits of hex converted to 32 bits BCD 
    input bankSwitch, //switches LED's to lower 16 and slows down the counting
    input [2:0] dp_selector, // decimal place selector
    output reg dp, // decimal place red light dot on the 7 segment displays
    output [7:0] anodes, //on off buttons for each of the 7 segment displays
    output a,b,c,d,e,f,g, // red led's on the seven segment displays
    output reg [15:0] LED // LEDs above the switches
    );
    
    // clock stuff ... really two clocks .. one so can see counting on the display
    // another faster clock that displays 8 7seg displays fast enough that they blur, but slow enough to fully turn on and be bright
    integer divider_counter = 1000; //with 100,000,000Hz clock means 100000 times per second     
    always_comb if (bankSwitch==1) divider_counter=50000000; else divider_counter=1000; //about twice a second
    integer divider_anode = 250000; //with 100,000,000Hz clock means 400Hz clock
    
    integer count_clk = 0; //this is the counter to be displayed by the 7 seg display
    integer anode_clk = 0; //this is the clock that is to cause a 3 bit counter to to change 50 times a second
    
    reg [2:0] segment = 0; //this is what chooses what is displayed on which segment 
    integer c_input=451263789; //this creates a variable called c_input with 32 bits that has 1 added to it by a clock
              //in hex is 1AE5 BD2D
              //in decimal is 451,263,789
              //in binary is 0001 1010 1110 0101 1011 1101 0010 1101

    //first clock controlling how fast numbers seem to count on the 8 segments
    always_ff @ (posedge(clk), posedge(reset))
    begin
        if (reset == 1) begin
            count_clk <= 0;
            c_input <=0;
        end
        else if(stop_start==0) begin
            if (count_clk >= divider_counter-1) begin
                count_clk <= 0;
                c_input <= c_input + 1;
                end         
            else count_clk <= count_clk + 1;
        end
        else count_clk <= count_clk;
    end
    //second clock controlling how fast the 8 displays are turned on one at a time, too fast grow dim, too slow they flicker      
    always_ff @ (posedge(clk), posedge(reset))
    begin
        if (reset == 1) anode_clk <=0 ;
        else if (anode_clk == divider_anode-1) begin
            anode_clk <=0 ;
            if ((segment+1)==dp_selector) dp<=0; else dp<=1; // had to fiddle with this code, no idea why it works this way
            segment <= segment+1;
        end         
        else anode_clk<=anode_clk + 1;
    end
    
    //anode expansion
    wire nanodes; //not anodes
    assign anodes = ~(1 << segment); // is a decoder .. anode_select 3 bits could be 0,1,2,3,4,5,6,7 ..     
    
    //hex selector
    reg [3:0] hex_to_display; 
    reg [31:0] BCD;
    always_comb begin // this switches between Hex and BCD depending upon switch position
        if (hexBCD) begin
            hex_to_display = BCD[4*segment +: 4];
            if (~bankSwitch) LED = BCD[31:16]; else LED = BCD[15:0];
        end  
        else begin
            hex_to_display = c_input[4*segment +: 4];
            if (~bankSwitch) LED = c_input[31:16]; else LED=c_input[15:0];
        end  
    end
    //assign hex_to_display = c_input[4*segment +: 4]; // 3 bits of anode_select, grab 4 bits of c_input and put them in hex_to_display
   
    //7-Seg Convertor .. intial values come from a spreadsheet analysis
    integer ac=16'h2812, bc=16'hd860, cc=16'hd004, dc=16'h8692, ec=16'h02ba, fc=16'h208e,gc=16'h1083;
    assign a = ac[hex_to_display]; // all these are muxes, hex_to_display selects one of the constants 16 bits
    assign b = bc[hex_to_display];
    assign c = cc[hex_to_display];
    assign d = dc[hex_to_display];
    assign e = ec[hex_to_display];
    assign f = fc[hex_to_display];
    assign g = gc[hex_to_display];   
    
    //hex to BCD convert
    integer i; //number of binary bits being converted (SW)
    integer j; //number of segments of BCD that are going to be displayed in LED
    always_comb begin
        BCD = 0;
        for (i = 27; i >=0; i = i - 1) begin
            //slicing LED up into groups of 4, adding three if current 4 bit value is greater than 5
            for (j = 0; j < 8; j = j + 1) if (BCD[j*4 +: 4] >= 5) BCD[j*4 +: 4] = BCD[j*4 +: 4] + 3;
            //shift to the left 1
            BCD = BCD << 1;
            BCD[0] = c_input[i];
        end
    end
        
endmodule

