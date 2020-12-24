`timescale 1ns/1ns

module tb_top_seg7();
reg rst, clk;
wire [6:0] seg1;
wire [6:0] seg2;
wire [6:0] seg5;
wire [6:0] seg6;

top_seg7 u0(rst, clk, seg1, seg2, seg5, seg6);

initial
begin
rst=0;

end

initial
begin
clk=0;
forever #5 clk=~clk;
end

endmodule