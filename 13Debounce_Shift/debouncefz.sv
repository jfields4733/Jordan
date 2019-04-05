// Created by fizzim.pl version 5.20 on 2019:04:02 at 16:32:40 (www.fizzim.com)

module def_name (
  output logic c,
  output logic sw_o,
  input clk,
  input rst,
  input sw_i
);

  // state bits
  enum logic [4:0] {
    null       = 5'b00000, // extra=000 sw_o=0 c=0 
    BOUNCE_0_1 = 5'b00100, // extra=001 sw_o=0 c=0 
    BOUNCE_1_0 = 5'b00010, // extra=000 sw_o=1 c=0 
    COUNT_0_1  = 5'b01000, // extra=010 sw_o=0 c=0 
    COUNT_1_0  = 5'b00110, // extra=001 sw_o=1 c=0 
    DONE_0_1   = 5'b00001, // extra=000 sw_o=0 c=1 
    DONE_0_2   = 5'b00101, // extra=001 sw_o=0 c=1 
    DONE_0_3   = 5'b01001, // extra=010 sw_o=0 c=1 
    DONE_1_1   = 5'b00011, // extra=000 sw_o=1 c=1 
    DONE_1_2   = 5'b00111, // extra=001 sw_o=1 c=1 
    DONE_1_3   = 5'b01011, // extra=010 sw_o=1 c=1 
    STABLE_0   = 5'b01100, // extra=011 sw_o=0 c=0 
    STABLE_1   = 5'b01010, // extra=010 sw_o=1 c=0 
    TRANS_0_1  = 5'b10000, // extra=100 sw_o=0 c=0 
    TRANS_1_0  = 5'b01110, // extra=011 sw_o=1 c=0 
    XXX = 'x
  } state, nextstate;


  // comb always block
  always_comb begin
    nextstate = XXX; // default to x because default_state_is_x is set
    case (state)
      null      : begin
      end
      BOUNCE_0_1: if (sw_i)  nextstate = TRANS_0_1;
                  else       nextstate = STABLE_0;
      BOUNCE_1_0: if (sw_i)  nextstate = STABLE_1;
                  else       nextstate = TRANS_1_0;
      COUNT_0_1 : if (sw_i)  nextstate = DONE_0_1;
                  else       nextstate = BOUNCE_0_1;
      COUNT_1_0 : if (sw_i)  nextstate = BOUNCE_1_0;
                  else       nextstate = DONE_1_1;
      DONE_0_1  : if (sw_i)  nextstate = DONE_0_2;
                  else       nextstate = BOUNCE_0_1;
      DONE_0_2  : if (sw_i)  nextstate = DONE_0_3;
                  else       nextstate = BOUNCE_0_1;
      DONE_0_3  : if (sw_i)  nextstate = STABLE_1;
                  else       nextstate = BOUNCE_0_1;
      DONE_1_1  : if (sw_i)  nextstate = BOUNCE_1_0;
                  else       nextstate = DONE_1_2;
      DONE_1_2  : if (sw_i)  nextstate = BOUNCE_1_0;
                  else       nextstate = DONE_1_3;
      DONE_1_3  : if (sw_i)  nextstate = BOUNCE_1_0;
                  else       nextstate = STABLE_0;
      STABLE_0  : if (sw_i)  nextstate = TRANS_0_1;
                  else       nextstate = STABLE_0;
      STABLE_1  : if (sw_i)  nextstate = STABLE_1;
                  else       nextstate = TRANS_1_0;
      TRANS_0_1 : if (sw_i)  nextstate = COUNT_0_1;
                  else       nextstate = BOUNCE_0_1;
      TRANS_1_0 : if (sw_i)  nextstate = BOUNCE_1_0;
                  else       nextstate = COUNT_1_0;
    endcase
  end

  // Assign reg'd outputs to state bits
  assign c = state[0];
  assign sw_o = state[1];

  // sequential always block
  always_ff @(posedge clk or negedge rst) begin
    if (!rst)
      state <= null;
    else
      state <= nextstate;
  end
endmodule
