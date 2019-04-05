

module debounce(
    input clk, //sw15 
    input pushButton,  //sw[0]
    output reg pushButton_state  //blue RGBLED
);

integer PB_cnt = 0; //initialize counter
integer Max_PB_cnt = 256; //maximum number of bounces at fastest clk largest value ?4,294,967,295? about 5ms at 100Mhz clk

// Synchronize the switch input to the clock
reg PB_sync_0 = 0;
always_ff @(posedge clk) 
    PB_sync_0 <= pushButton; 

reg PB_sync_1 = 0;
always_ff @(posedge clk) 
    PB_sync_1 <= PB_sync_0;
    

// Debounce the switch
always_ff @(posedge clk)
    if(pushButton_state==PB_sync_1)
        PB_cnt <= 0;
    else
    begin
        PB_cnt <= PB_cnt + 1;  
        if(PB_cnt == Max_PB_cnt) pushButton_state <= ~pushButton_state;  
    end
endmodule