`timescale 1ns / 1ps

module clocked4x7SegDisplay(
    input clock,
    input reset,
    input enable,
    input [15:0] hexToDisplay,
    input [1:0] iDP,
    input disableDP,
    output[7:0] outAnnode,
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g,
    output EoDP
    );
    reg [18:0] ClockCounter;  
    wire [1:0] Annode;
    wire notEnable; //this was added so that it displays all four segents by default, have to press center push pin to enable display of just one segment
    wire oDP; //this is driven by the d4x7segDisplay module
    assign notEnable = ~enable;  //this halts the rapid display of all 4 segments    
    
    or U2(EoDP,disableDP,oDP); // this disables the decimal place
 
     always @ (posedge clock)
     begin : COUNTER // Block Name
       if (reset == 1'b1) begin
         ClockCounter <=  #1  32'b00000000000000000000000000000000;
       end
       else if (notEnable == 1'b1) begin
         ClockCounter <=  #1  ClockCounter + 1;
       end
     end // End of Block COUNTER
     assign Annode = ClockCounter[18:17];
     
     d4x7segDisplay u1(hexToDisplay,iDP,Annode,a,b,c,d,e,f,g,oDP,outAnnode);

endmodule