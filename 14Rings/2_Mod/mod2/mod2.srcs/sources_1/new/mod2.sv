`timescale 1ns / 1ps

module mod2(
    input [7:0] parallelIn,
    output parityOut,
    output logic q,
    input bitIn,
    input clk,
    input rst
    );
    //this is the simple tricky answer, but doesn't help us in two ways:
    //     can not use to make mod3
    //     can not process bits as they come in one at a time on a wire
    assign parityOut = ^parallelIn; //odd parity meaning output is 1 when odd
    
    //preparing a state machine
      enum logic [0:0] {
        Even = 1'b0, // q=0 
        Odd  = 1'b1, // q=1 
        XXX = 'x
      } state, nextstate;
    
      always_comb begin
        nextstate = XXX; // default to x because default_state_is_x is set
        case (state)
          Even: if (0)  nextstate = Even;
                else    nextstate = Odd;
          Odd : if (0)  nextstate = Odd;
                else    nextstate = Even;
        endcase
      end
    
  // Assign reg'd outputs to state bits
    assign q = state;

  // sequential always block
      always_ff @(posedge clk or negedge rst) begin
        if (rst)
          state <= Even;
        else
          state <= nextstate;
      end
endmodule
