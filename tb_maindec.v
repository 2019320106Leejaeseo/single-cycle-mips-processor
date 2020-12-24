`timescale 1ns/1ns

module tb_maindec();
reg [5:0] OP;
wire MemtoReg, MemWrite, Branch, ALUSrc, RegDst, RegWrite, Jump;
wire [1:0] ALUOp;


maindec u0(OP, MemtoReg, MemWrite, Branch, ALUSrc, RegDst, RegWrite, Jump, ALUOp);

initial
begin
OP = 6'b000000;
#10
OP = 6'b000010;
#10
OP = 6'b001101;

end

endmodule