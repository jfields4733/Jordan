//code for NAND Gate 
module nandgate (
  input dis, 
  input oDP, 
  output EoDP
);
  
reg EoDP;

  always @(*)
    if (oDP == 0 && dis == 0) EoDP = 1;
  	else EoDP = 0;
  
endmodule