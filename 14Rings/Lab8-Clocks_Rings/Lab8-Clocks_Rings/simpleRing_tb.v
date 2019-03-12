module simpleRing_tb;
  wire [8:0] LED;
  reg clock, reset, reset1, reset2, enable;
  simpleRing M0 (LED, clock, reset, reset1, reset2, enable);
  initial #200 $finish ;
  initial begin clock = 0; forever #5 clock = ~clock; end
  initial fork
    reset = 0;
    #2 reset = 1;
    #8 reset = 0;
    #89 enable = 1;
	#99 enable = 0;
    #10 reset1 = 1;
    #30 reset1 = 0;
    #40 reset2 = 1;
    #50 reset2 = 0;
    #52 reset1 = 1;
    #54 reset2 = 1;
    #70 reset1 = 0;
    #80 reset2 = 0;
   join
 
   initial begin
	  enable = 0;
      reset1 = 0;
      reset2 = 0;
      $dumpfile("simpleRing.vcd");
      $dumpvars(0, simpleRing_tb);

   end
endmodule
