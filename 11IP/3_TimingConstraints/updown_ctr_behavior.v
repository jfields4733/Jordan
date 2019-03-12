`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: updown_ctr_behavior
/////////////////////////////////////////////////////////////////

parameter COUNT_SIZE=8;

(* use_dsp48 = "no" *)
module updown_ctr_behavior(
    input clk,
    input up_dn,
    input reset,
    input enable,
    output reg [COUNT_SIZE-1:0] count
    );

   wire clk_5MHz;
   reg clk_1Hz;
   
   clk_5MHz U1
   (
     .clk_in1(clk),      
     .clk_out1(CLK_5MHz)
//	 .reset(reset));     
     );
     reg [22:0] count_1sec;
     wire cnt_done_i;
     reg cnt_done;

     assign cnt_done_i = (count_1sec == 23'h4C4B40) ? 1'b1 : 1'b0; 
     
     always @(posedge CLK_5MHz or posedge reset)
     if (reset) 
        cnt_done <= 0;
     else
        cnt_done <= cnt_done_i;
        
     always @(posedge CLK_5MHz or posedge reset)
     if (reset) 
        count_1sec <= 0;
     else if(cnt_done)
         count_1sec <= 0;
     else
         count_1sec <= count_1sec + 1;
   
    always @(posedge CLK_5MHz or posedge reset)
        if (reset)
           count <= 0;
        else if (enable & cnt_done)
           if (up_dn)
              count <= count + 1;
           else
              count <= count - 1;
    
endmodule
