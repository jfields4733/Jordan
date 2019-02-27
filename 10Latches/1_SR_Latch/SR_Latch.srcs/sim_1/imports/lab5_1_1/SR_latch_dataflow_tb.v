`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: SR_latch_dataflow_tb
/////////////////////////////////////////////////////////////////

module SR_latch_dataflow_tb(

    );
    
    reg R, S;
    wire Q, Qbar;
    
    SR_latch_dataflow DUT (.R(R), .S(S), .Q(Q), .Qbar(Qbar));
    
    initial
    begin
        S=0; R=0; 
        #10 S=1;
        #10 S=0; 
        #10 R=1;
        #10 S=1; R=0;
        #10 S=0; R=1;
        #10 S=1; R=0;
        #10 S=0; R=1;
        #10 S=1; R=1;
    end
endmodule
