`timescale 1ns / 1ps

module MultipleAssignCombo(
    input a,
    output b_out,
    output reg c,
    output a_out
    );
    
    reg b = 1;
    
    assign a_out = a;
    assign b_out = b;
    
    always_comb begin
        b=a;
        c=b;
    end
    
    always_comb begin
        c=b;
        b=a;
    end
    
endmodule
