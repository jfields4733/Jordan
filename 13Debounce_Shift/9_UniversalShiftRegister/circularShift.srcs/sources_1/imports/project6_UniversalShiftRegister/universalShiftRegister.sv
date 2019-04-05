`timescale 1ns / 1ps

module clkDivider(
    input clk, //100Mhz clock
    input rst, //button labeled cpu reset on Nexys 4 DDR
    input [7:0] parallelInSW, //sw[7]-sw[0]
    input go, //sw[0]
    input ws, //sw[1]
    input Load, //sw[2]
    input leftRightDirection, //sw[3]
    //output logic Red,
    //output logic Green,
    //output logic Blue,
    //output logic ds
    output [15:0] parallelOut //LED[15]-[0]
    );
               
    reg Green;
    reg [15:0] shiftRegister = 213; // the shift register 
    reg [15:0] shiftRegisterTemp; // driven by shift operator circuit
    reg In;
    assign parallelOut = shiftRegisterTemp; // what LED's are going to display
     
    always_comb if (leftRightDirection) shiftRegisterTemp = {shiftRegister[14:0],shiftRegister[15]}; else shiftRegisterTemp = {shiftRegister[0],shiftRegister[15:1]};
    
    // clock divider ---------------------------------------------------------------------------------------------
    reg [31:0] divider_counter = 10000000; // 100,000,000/50,000,000 => 2 counts per second 
    
    integer count_up = 0; //this is a 32 but counter that add's 1, initialized to this large number so can see more LED's on 
    integer count_clk = 0;
    
    always_ff @ (posedge(clk)) 
        if (rst==0) begin
            count_up <= 0;
            state <= IDLE;
            end
        else if (count_clk == divider_counter-1) begin
            count_up <= count_up + 1;
            state <= nextstate;
            if(Green) if (Load) shiftRegister <= {{parallelInSW},8'b00000000}; else shiftRegister <= shiftRegisterTemp;
            end 
                 
    always_ff @ (posedge(clk)) 
        if (rst == 0 || count_clk == divider_counter-1 ) count_clk <= 0;
        else count_clk <= count_clk+1;
   
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
    case (state)
      IDLE: if (go)  nextstate = READ;
            else     nextstate = IDLE;
      DLY : if (ws)  nextstate = READ;
            else     nextstate = DONE;
      DONE:          nextstate = IDLE;
      READ:          nextstate = DLY;
      default:  nextstate = XXX; // default to x because default_state_is_x is set
    endcase
  end

  // Assign reg'd outputs to state bits
  
 assign Green = state[2];
  //always_comb if (offRGB) Red=0; else Red = state[1];
  //always_comb if (offRGB) Blue=0; else Blue= state[0];
  //assign ds = Blue;

endmodule