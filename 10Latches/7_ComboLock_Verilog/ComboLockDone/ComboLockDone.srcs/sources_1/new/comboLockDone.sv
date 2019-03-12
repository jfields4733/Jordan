
module comboLockDone(
    input [3:0] enteredCombo, //current combination entering
    input E, //enter the combination above
    output [1:0] s, //what combination is suppose to be entered now 0,1,2,3
    output Y1, //Y1..Y5 are the combinatory feed back loop values
    output Y2,
    output Y3,
    output Y4,
    output Y5,
    output S, //this is whether the combination entered maches, another loop
    output Z //this is a 0 if locked, one if unlocked
    );
    
     //loops associated with ASN
     wire y1,y2,y3,y4,y5;
     assign y1=Y1;
     assign y2=Y2;
     assign y3=Y3;
     assign y4=Y4;
     assign y5=Y5;
     
     reg [15:0] Combo = 16'HEF12; //current combination
     
    //ComboCombinatory output .. which combination looking for
    //no loops here, from state of y2,y4,y5 can tell which of the four combinations one is looking for
    //s is a select line, which selects from mux input what the current combination should be
    //to compare against the input combination
    wire s1_2xAND,s1;
    assign s1_2xAND = ~y2 & ~y5;
    assign s1 = s1_2xAND | y4;
    
    wire s2_2xAND,s2;
    assign s2_2xAND = y4 & y5;
    assign s2 = s2_2xAND | y2;
   
    //Mux that selects which combination to compare with
    //input are select lines s1 and s2 to select among four combinations
    //the selected combination is 4 bits
    
     assign s = {s2,s1};
     wire [3:0] comboCheck;
     assign comboCheck = Combo[4*s +: 4];
     
     // now compare with entered combination
     
    wire [3:0] result;
    assign result = comboCheck ^ enteredCombo;
    assign S = ~| result; 
        
    //ASN Asynchronous Sequential Network or circuit
    //the y's are the combinatory loops
    //E is enter as in enter the combination
    //S is Start/Clear/Reset 
    
    wire Y1_4xAND,Y1_2xANDa,Y1_2xANDb;
    assign Y1_4xAND = y4 & y5 & E & S;
    assign Y1_2xANDa = y1 & S;
    assign Y1_2xANDb = y1 & E;
    assign Y1 = Y1_4xAND | Y1_2xANDa | Y1_2xANDb;
    
    wire Y2_3xANDa,Y2_3xANDb,Y2_3xANDc;
    assign Y2_3xANDa = ~y3 & ~E & S;
    assign Y2_3xANDb = y2 & E & S;
    assign Y2_3xANDc = y2 & y5 & ~E;
    assign Y2 = Y2_3xANDa | Y2_3xANDb | Y2_3xANDc;
    
    wire Y3_2xAND;
    assign Y3_2xAND = y3 & ~E;
    assign Y3 = ~y5 | ~S | y4 | Y3_2xAND | y2;
    
    wire Y4_4xANDa,Y4_2xANDa,Y4_4xANDb,Y4_2xANDb;
    assign Y4_4xANDa = ~y2 & ~y5 & E & S;
    assign Y4_2xANDa = y4 & S;
    assign Y4_4xANDb = ~y1 & y4 & y5 & ~E;
    assign Y4_2xANDb = y1 & E;
    assign Y4 = Y4_4xANDa | Y4_2xANDa | Y4_4xANDb | Y4_2xANDb; 
    
    wire Y5_2xANDa,Y5_2xANDb,Y5_2xANDc,Y5_2xANDd,Y5_2xANDe;
    assign Y5_2xANDa = E & ~S;
    assign Y5_2xANDb = ~y2 & y5;
    assign Y5_2xANDc = y5 & ~E;
    assign Y5_2xANDd = y4 & ~E;
    assign Y5_2xANDe = y2 & ~S;
    assign Y5 = Y5_2xANDa |  Y5_2xANDb | Y5_2xANDc |  Y5_2xANDd |  Y5_2xANDe;
    
    wire Z_2xANDa,Z_2xANDb;
    assign Z_2xANDa = y1 & S;
    assign Z_2xANDb = y1 & E;
    assign Z = Z_2xANDa | Z_2xANDb;   
endmodule
