// Created by fizzim.pl version 5.20 on 2019:03:25 at 14:32:26 (www.fizzim.com)

module cliff_classic (
  output logic ds,
  output logic rd,
  input clk,
  input go,
  input rst_n,
  input ws
);

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

  // sequential always block
  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      state <= IDLE;
    else
      state <= nextstate;
  end
endmodule
