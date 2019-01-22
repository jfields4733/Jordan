


module mux7_7(
    input [3:0] d,
    input [1:0] select,
    output q
    );
    assign q = d[select];
endmodule
