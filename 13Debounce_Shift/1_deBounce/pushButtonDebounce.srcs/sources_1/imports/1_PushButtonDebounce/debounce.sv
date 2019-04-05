
module debounce (
    input clk, //sw[15]
    input sw_i,  //sw[0] switch in
    output reg sw_o,  //blue RGBLED switch out
    output reg csp, //current switch position top bar of 7seg display
    output reg psp, //previous switch position bottom bar of seven seg display
    output [1:0] LED
);

// is switch transitioning from 0 to 1 or 1 to 0?
// updating current switch position csp, and previous switch position psp
always_ff @(posedge clk) 
    csp <= sw_i; 

always_ff @(posedge clk) 
    psp <= csp;
    
//once have established switch direction, count 
//consecutive times that it stays in that position
reg [1:0] sc = 2; // stays in one position counter
//set initial value high value so can see roll over in manual testing

assign LED = sc; //display the stays in one position counter

//count once or reset forever
always_ff @(posedge clk)
    if(sw_o==psp) //if bounces, start count over, if stable, reset forever
        sc <= 0;
    else
    begin //start counting consecutive stays in transition position
        sc <= sc + 1;  
		//if stays in that position long enough toggle output and start resetting forever
        if(sc == 3) sw_o <= ~sw_o;  
    end
endmodule