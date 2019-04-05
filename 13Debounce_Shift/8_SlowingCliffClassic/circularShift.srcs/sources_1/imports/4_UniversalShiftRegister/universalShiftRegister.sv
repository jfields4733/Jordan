`timescale 1ns / 1ps

module clkDivider(
    input clk, //100Mhz clock
    input rst, //button labeled cpu reset on Nexys 4 DDR
    input go, //sw[14]
    input ws, //sw[13]
    input In, //sw[0]
    input [7:0] parallelIn, //sw8]-[1]
    input leftRightDirection, //sw[15]
    output [7:0] parallelOut, //LED[15]-[8]
    output logic ds, //LED[6]
    output logic rd, //LED[7]
    output [1:0] LED //output of the slow clock
    );
     
    // clock divider ---------------------------------------------------------------------------------------------
    reg [31:0] divider_counter = 100000000; // 100,000,000/100,000,000 => 1 counts per second 
    
    integer count_up = 100000000; //this is a 32 but counter that add's 1, initialized to this large number so can see more LED's on 
    integer count_clk = 0;
    
    always_ff @ (posedge(clk)) 
        if (rst==0) begin
            count_up <= 0;
            state <= IDLE;
            end
        else if (count_clk == divider_counter-1) begin
            count_up <= count_up + 1;
            state <= nextstate;
            end 
           
    always_ff @ (posedge(clk)) 
        if (rst == 0 || count_clk == divider_counter-1 ) count_clk <= 0;
        else count_clk <= count_clk+1;

  assign LED = count_up[1:0];
  //shiftOperator module call --------------------------------------------------------------
  shiftOperator i1 (
        .In(In), // sw[0]
        .parallelIn(parallelIn), //sw[8]-sw[1]
        .leftRightDirection(leftRightDirection), //sw[15]
        .numberOfBitsToShift(1), //fills vacated spots with In
        .parallelOut(parallelOut) //led[8]-led[1] 
    );
    
  //cliff_classic ------------------------------------------------------------------------
  // state bits
  enum logic [2:0] {
    IDLE = 3'b000, // extra=0 rd=0 ds=0 
    DLY  = 3'b010, // extra=0 rd=1 ds=0 
    DONE = 3'b001, // extra=0 rd=0 ds=1 
    READ = 3'b110, // extra=1 rd=1 ds=0 
    XXX = 'x
  } state, nextstate;

  // comb always block
  always_comb begin
    nextstate = XXX; // default to x because default_state_is_x is set
    case (state)
      IDLE: if (go)  nextstate = READ;
            else     nextstate = IDLE;
      DLY : if (ws)  nextstate = READ;
            else     nextstate = DONE;
      DONE:          nextstate = IDLE;
      READ:          nextstate = DLY;
    endcase
  end

  // Assign reg'd outputs to state bits
  assign ds = state[0];
  assign rd = state[1];
  

endmodule