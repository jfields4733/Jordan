`timescale 1ns / 1ps

module dynamic_shift_register_1 (
    input clk,
    input rst,
    input si,
    input [2:0] sel,
    output DO
);

reg [7:0] data = 231;
assign DO = data[sel];
always @(posedge clk) if (rst) data <= {data[6:0], si};
 
endmodule

module clkDivider(
    input clk, //100Mhz clock
    input rst, //button labeled cpu reset on Nexys 4 DDR
    input [7:0] parallelInSW, //sw[7]-sw[0]
    input go, //sw[0]
    input ws, //sw[1]
    input Load, //sw[2]
    input leftRightDirection, //sw[3]
    input offRGB, //sw[4]
    output [7:0] parallelOut, //LED[7]-[0]
    output logic rgbGreen, 
    output logic rgbRed,
    output logic rgbBlue,
    output logic ds
    );
    
    logic Green;
    logic Red;
    logic Blue;
    always_comb if(~offRGB) begin
        rgbGreen=Green;
        rgbBlue=Blue;
        rgbRed=Red;
        end
            
    reg [7:0] shiftRegister = 213; // the shift register 
    reg [7:0] shiftRegisterTemp; // driven by shift operator circuit
    reg In;
    assign parallelOut = shiftRegisterTemp; // what LED's are going to display
     
    always_comb if (leftRightDirection) shiftRegisterTemp = {shiftRegister[6:0],shiftRegister[7]}; else shiftRegisterTemp = {shiftRegister[0],shiftRegister[7:1]};
    
    // clock divider ---------------------------------------------------------------------------------------------
    reg [31:0] divider_counter = 750000; // 100,000,000/100,000,000 => 10 counts per second 
    
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
            if(Green) if (Load) shiftRegister <= parallelInSW; else shiftRegister <= shiftRegisterTemp;
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
  assign Red = state[1];
  assign Blue = state[0];
  assign ds = state[0];
  
endmodule