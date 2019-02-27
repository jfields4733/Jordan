`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: SR_latch_dataflow
/////////////////////////////////////////////////////////////////

module SR_latch_dataflow(
    input R,
    input S,
    output Q,
    output Qbar
    );
     
    assign #2 Q_i = Q;
    assign #2 Qbar_i = Qbar; 
    assign #2 Q = ~ (R | Qbar_i);
    assign #2 Qbar = ~ (S | Q_i);

endmodule
