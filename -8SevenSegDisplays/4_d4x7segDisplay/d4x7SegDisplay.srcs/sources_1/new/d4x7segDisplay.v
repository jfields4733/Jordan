`timescale 1ns / 1ps


module d3x7segDisplay(
	input [11:0] hexToDisplay, //uses 12 bits because have 16 switches and need 4 of them to manually control the anodes and decimal place
	input [1:0] iDP, // in Decimal Place .. is 2 bit number so that only one decimal place can be turned on at a time
	input [1:0] Annode, // again, is 2 bit number so after going through decoder, can only use one at a time
	output a, //these are for one 7 seg ment display
    output b, //the particular seen seg display being used is determined by Annode
    output c,
    output d,
    output e,
    output f,
    output g,
    output oDP, //output decimal place, is turned on only when iDP and Annode match
    output [7:0] outAnnode_selector
    );
    wire [3:0] iDecimalPlace; 
    wire [3:0] iAnnode;
       
	d2to4decoder d0(iDecimalPlace,iDP); //active high, turns 2 bit number into 4 bit with only one of the four bits high
	d2to4decoder d1(iAnnode,Annode); // active high, turns 2 bit number into 4 bit with only one of the four bits high
	
	d7segDisplay u0(hexToDisplay[3:0], iDecimalPlace[0], iAnnode[0], a,b,c,d,e,f,g,oDP); //all this logic is active high
	d7segDisplay u1(hexToDisplay[7:4], iDecimalPlace[1], iAnnode[1], a,b,c,d,e,f,g,oDP); //need one of these for each segment driving
	d7segDisplay u2(hexToDisplay[11:8],iDecimalPlace[2], iAnnode[2], a,b,c,d,e,f,g,oDP); //iAnnode only turns on one
	d7segDisplay u3(hexToDisplay[11:8],iDecimalPlace[3], iAnnode[3], a,b,c,d,e,f,g,oDP); 
	//They have to be in a group like this because all 7seg displays are hooked to the same a,b,c,d,... wires as output devices 

    //outAnnode_selector is what determines whether a particular 7seg display is turned on or not
    assign outAnnode_selector[3:0] = ~iAnnode; //annode is active low so if iAnnode is a 1, then outAnnode_selector is 0 and is turned on 
    assign outAnnode_selector[7:4] = 4'b1111; // 1 means display is off  .. have to turn unused off   

endmodule

module d7segDisplay(
    input [3:0] hexToDisplay,
    input iDP,
    input anode,
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g,
    output dp
    );
    wire invertedDP;
    m16x4Mux i1(16'h2812,hexToDisplay,anode,a);
    m16x4Mux i2(16'hd860,hexToDisplay,anode,b);
    m16x4Mux i3(16'hd004,hexToDisplay,anode,c);
    m16x4Mux i4(16'h8692,hexToDisplay,anode,d);
    m16x4Mux i5(16'h02ba,hexToDisplay,anode,e);
    m16x4Mux i6(16'h208e,hexToDisplay,anode,f);
    m16x4Mux i7(16'h1083,hexToDisplay,anode,g);
    assign invertedDP = ~iDP;
    vcb i8(invertedDP,anode,dp);
endmodule

module d2to4decoder(Y, X);

 output [3:0] Y;
 input [1:0] X;
 reg [3:0] Y;

 always @* begin
	case ( {X} )
		2'b00: {Y} = 4'b0001;
		2'b01: {Y} = 4'b0010;
		2'b10: {Y} = 4'b0100;
		2'b11: {Y} = 4'b1000;
		default: {Y} = 4'bxxxx;
	endcase
 end

 endmodule
 
 module d3to8decoder(Y, X);
 
  output [7:0] Y;
  input [2:0] X;
  reg [7:0] Y;
 
  always @* begin
     case ( {X} )
         3'b000: {Y} = 8'b00000001;
         3'b001: {Y} = 8'b00000010;
         3'b010: {Y} = 8'b00000100;
         3'b011: {Y} = 8'b00001000;
         3'b100: {Y} = 8'b00010000;
         3'b101: {Y} = 8'b00100000;
         3'b110: {Y} = 8'b01000000;
         3'b111: {Y} = 8'b10000000;         
         default: {Y} = 8'bxxxx;
     endcase
  end
 
  endmodule