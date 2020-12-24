module MIPS(
		input wire clk,
		input wire rst,
		output reg [31:0]PC,
		output wire [31:0] Write_data
		);

//insturction memory
wire [31:0] Next_PC, New_PC, Instr, Branch_addr;

//control unit
wire RegDst, RegWrite; // control reg
wire MemRead, MemtoReg, MemWrite; // control mem
wire ALUSrc;
wire [1:0] ALUOp;
wire [2:0] ALUControl;
wire [5:0] OP, Fucnt;
wire PCSrc, Jump, Branch;

//registers
wire [31:0] Read_data1, Read_data2;
wire [4:0] Read_reg1, Read_reg2, Write_addr;
wire [31:0] Jump_addr; // J
wire [31:0] Branch_or_offset; // I

//ALU
wire [31:0] ALU_result;
wire [31:0] ALU_input2;
wire zero;
wire [4:0] shift;

//data momory
wire [31:0] DM_addr;
wire [31:0] DM_Read_data, DM_Write_data;


assign Next_PC = PC + 32'd4;
assign New_PC = (Jump) ? Jump_addr : ((PCSrc) ? (Branch_addr+Next_PC) : Next_PC); 
assign Branch_addr = {Branch_or_offset[29:0], 2'b00}; // 

assign OP = Instr[31:26];
assign Fucnt = Instr[5:0];

assign shift = Instr[10:6];
assign ALU_input2 = (ALUSrc) ? Branch_or_offset : Read_data2;

assign Read_reg1 = Instr[25:21];
assign Read_reg2 = Instr[20:16];
assign Write_addr = (RegDst) ? Instr[15:11] : Instr[20:16]; // write register address MUX
assign Branch_or_offset = (Instr[15] == 1) ? {16'hFFFF, Instr[15:0]} : {16'h0000, Instr[15:0]}; // imm sign or zero extend
assign Jump_addr = {Next_PC[31:28],{Instr[25:0],2'b00}}; // next pc 상위비트 + (opcode 제외 26비트 + 쉬프트 2)

assign PCSrc = Branch&&zero;

assign DM_Write_data = Read_data2;
assign DM_addr = ALU_result;
assign Write_data = (MemtoReg) ? DM_Read_data : ALU_result; // mem to reg MUX

instruction_memory instr_mem(PC, Instr);
Control Ctrl(RegDst, RegWrite,MemRead, MemtoReg, MemWrite, ALUSrc, ALUOp, OP,Fucnt, Branch, Jump, ALUControl);
Register Reg(clk,rst, RegWrite, Read_reg1, Read_reg2,Write_addr,Write_data, Read_data1, Read_data2);
alu_mips alu(Read_data1, ALU_input2, ALUControl, ALU_result, zero, shift);
Data_mem DM(clk, rst,MemWrite, MemRead, DM_Read_data, DM_Write_data, DM_addr[6:0]);


	
always @(posedge clk or posedge rst)
begin
if(rst) PC = 0;
else PC <= New_PC ;
end
	

initial
begin
	PC <= 32'd0;
end


endmodule
	
	
	



