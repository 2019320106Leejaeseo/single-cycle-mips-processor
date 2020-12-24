`timescale 1ns/1ns

module tb_MIPS();
reg rst, clk;

MIPS u0(clk, rst);

initial
begin
clk=0;
forever #5 clk=~clk;

end

initial rst = 0;

endmodule