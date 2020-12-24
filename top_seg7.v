module top_seg7(rst, clk, seg1, seg2, seg3, seg4,seg5, seg6);
  input  rst, clk;

  output wire[6:0] seg1;
  output wire[6:0] seg2;
  output wire[6:0] seg3;
  output wire[6:0] seg4;
  output wire[6:0] seg5;
  output wire[6:0] seg6;
  reg[3:0] digit1;
  reg[3:0] digit2;
  wire[3:0] digit3;
  wire[3:0] digit4;
  wire[3:0] digit5;
  wire[3:0] digit6;
  
  wire[7:0] long_digit1;

  wire[31:0] out_pc;
  wire[31:0] writedata;
  reg[6:0] pc;
  
  bcd v1(pc,long_digit1);
  bcd_4digit v2(writedata[15:0],digit3, digit4, digit5, digit6);
  
  wire out_clk;
  
  // 50MHz -> 1Hz  divide
  clk_dll u0(rst, clk, out_clk); 
  
  // counter 
  MIPS w1(clk, rst,out_pc, writedata);
  counter u1(rst, out_clk, digit); 
   
  // 7-segment decoder   
  seg7 u2(digit1, seg1);
  seg7 u3(digit2, seg2);
  seg7 u4(digit3, seg3);
  seg7 u5(digit4, seg4);
  seg7 u6(digit5, seg5);
  seg7 u7(digit6, seg6);
  

  
  always@(*)
  begin
	pc = out_pc[6:0];
	digit1 = long_digit1[7:4];
	digit2 = long_digit1[3:0];

  end
  
endmodule
