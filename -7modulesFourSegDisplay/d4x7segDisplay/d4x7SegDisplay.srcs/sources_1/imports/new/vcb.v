`timescale 1ns / 1ps

module vcb(in,control,shared_output);
   input  in,control;
   output shared_output;
   tri shared_output;
   bufif1 b1(shared_output,in,control);
endmodule