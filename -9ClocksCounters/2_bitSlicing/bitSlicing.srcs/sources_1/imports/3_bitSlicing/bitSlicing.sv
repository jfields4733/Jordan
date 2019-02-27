

module bitSlice(
    input [2:0] select,
    output [3:0] hexOut
    );

    /* https://stackoverflow.com/questions/13399663/splitting-a-bit-array-in-verilog*/
    
    integer c_input = 451263789; // using 32 of the 128 bits 
    //goal is to display a group of 4 bits: 0001 1010 1110 0101 1011 1101 0010 1101
    // using 4 bit wide hexOut instead of eight bit wire [7:0] out = in[8*idx +: 8];
    
    assign hexOut = c_input[4*select +: 4];
    /* this means there are 8 possible groups of 4 bits in 32 bits, 
    If select is 0 then c_input[4*(0) +: 8] == c_input[7:0]
    If select is 7 then c_input[4*(7) +: 8] == c_input[31:24]
    */
endmodule

