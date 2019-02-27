
module Eight7SegDsiplay(
    input clk, // is automatic
    input [31:0] display, // 32 bits of input to be displayed
    input reset, // starts counters over again at 1
    input hexBCD, // switches from displaying 32 bits of hex to displaying 28 bits of hex converted to 32 bits BCD 
    input [2:0] dp_selector, // decimal place selector
    output reg dp, // decimal place red light dot on the 7 segment displays
    output reg [7:0] anodes, //on off buttons for each of the 7 segment displays
    output a,b,c,d,e,f,g // red led's on the seven segment displays
    );

    integer divider_anode = 250000; //with 100,000,000Hz clock means 400Hz clock
    integer anode_clk = 0; //this is the clock that is to cause a 3 bit counter to to change 50 times a second
    reg [2:0] segment = 0; //this is what chooses what is displayed on which segment 

    //clock controlling how fast the 8 displays are turned on one at a time, too fast grow dim, too slow they flicker
    //----------------------------------------------------------------------------------------------------------------------      
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
    
    //anode expansion .. creates 8 bits determining which segment is on or off at the moment
    //-----------------------------------------------------------------------------------------
    reg [2:0] abc; // used to blank out the leading zeros
    always_comb if(segment <= abc) anodes = ~(1 << segment); else anodes=8'hFF; // is a decoder .. anode_select 3 bits could be 0,1,2,3,4,5,6,7 ..     
    
    // hex selector find 4 bit hex display for a specific segment from 32 binary (display) or BCD
    //-------------------------------------------------------------------------------------------- 
    reg [3:0] hex_to_display; 
    reg [31:0] BCD;
    always_comb begin // this switches between Hex and BCD depending upon switch position
        if (hexBCD) begin
            hex_to_display = BCD[4*segment +: 4];
        end  
        else begin
            hex_to_display = display[4*segment +: 4];
        end  
    end
      
    //7-Seg Convertor .. turn 4 bits of hex into a,b,c,d,e,f,g segment turn off or turn on
    //----------------------------------------------------------------------------------------------------
    integer ac=16'h2812, bc=16'hd860, cc=16'hd004, dc=16'h8692, ec=16'h02ba, fc=16'h208e,gc=16'h1083;
    assign a = ac[hex_to_display]; // all these are muxes, hex_to_display selects one of the constants 16 bits
    assign b = bc[hex_to_display];
    assign c = cc[hex_to_display];
    assign d = dc[hex_to_display];
    assign e = ec[hex_to_display];
    assign f = fc[hex_to_display];
    assign g = gc[hex_to_display];   
    
    //hex to BCD convert using nested for loops
    //---------------------------------------------------------------------------------------------
    integer i; //number of binary bits being converted (SW)
    integer j; //number of segments of BCD that are going to be displayed in LED
    always_comb begin
        BCD = 0;
        for (i = 27; i >=0; i = i - 1) begin
            //slicing LED up into groups of 4, adding three if current 4 bit value is greater than 5
            for (j = 0; j < 8; j = j + 1) if (BCD[j*4 +: 4] >= 5) BCD[j*4 +: 4] = BCD[j*4 +: 4] + 3;
            //shift to the left 1
            BCD = BCD << 1;
            BCD[0] = display[i];
        end
    end
    
    //zero blank .. blank leading zeros on the display
    //-----------------------------------------------------------------------------
    //first build up the priority encoder 7 bits from the 32 bits of display or BCD
    integer k;
    reg [7:0] priority_encoder_truthTable = 0;
    always_comb begin
        if (hexBCD) for (k = 0; k < 8; k = k + 1) if (BCD[k*4 +: 4] > 0) priority_encoder_truthTable[k]=1; else priority_encoder_truthTable[k]=0;
        else for (k = 0; k < 8; k = k + 1) if (display[k*4 +: 4] > 0) priority_encoder_truthTable[k]=1; else priority_encoder_truthTable[k]=0;
    end
    //now find 3 bit pointer to the first one among the 8 displays using priority encoder logic
    integer L;
    always_comb begin
        for (L=0; L<8; L = L+1) if (priority_encoder_truthTable[L]==1) abc=L;
    end           
endmodule

