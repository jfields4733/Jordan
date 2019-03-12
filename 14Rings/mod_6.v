module counter_mod6 ( clk ,Q );

output  reg [2:0] Q ;


input clk ;
wire clk ;

initial Q = 0;

always @ (posedge (clk))
 begin
 if (Q<5)
  Q<= Q + 1;
 else
  Q <= 0;
end
      
endmodule
