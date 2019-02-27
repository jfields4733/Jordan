
module hexTo7seg(
    input [3:0] hex,
    output [3:0] bcd,
    output carry,
    output [7:0] AN,
    output CA,
    output CB,
    output CC,
    output CD,
    output CE,
    output CF,
    output CG
    );
    
    // exercise the two modules
    wire [6:0] seg;
    hex2bcd i1(hex,bcd,carry);
    BCDto7segment i2(bcd,seg);
    
    //now translate seg into the default cathod a, cathod b, language of the XDC file
    assign CA = seg[0];
    assign CB = seg[1];
    assign CC = seg[2];
    assign CD = seg[3];
    assign CE = seg[4];
    assign CF = seg[5];
    assign CG = seg[6]; 
    
    //turn 7 out of the 8 displays off, only the right most one is on
    assign AN[7]=1;
    assign AN[6]=1;
    assign AN[5]=1;
    assign AN[4]=1;
    assign AN[3]=1;
    assign AN[2]=1;
    assign AN[1]=1;
    assign AN[0]=0;
       
endmodule
