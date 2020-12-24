`timescale 1ns/1ns

module tb_Control();
wire RegDst, RegWrite, MemRead, MemtoReg, MemWrite, ALUSrc;
wire [1:0] ALUOp;
reg [5:0] OP, Fucnt;
wire Branch, Jump;
wire [2:0] ALUControl;
	
	
Control Ctrl(RegDst, RegWrite,MemRead, MemtoReg, MemWrite, ALUSrc, ALUOp, OP,Fucnt, Branch, Jump, ALUControl);

initial
begin
OP = 0;
Fucnt = 0;
#10
OP = 6'b000000;
Fucnt = 6'b100000;
#10
OP = 6'b000100;
Fucnt = 6'b000000;
#10
OP = 6'b000010;
end
endmodule
