module Control(
	output reg RegDst, RegWrite, MemRead, MemtoReg, MemWrite, ALUSrc,
	output reg [1:0] ALUOp,
	input wire [5:0] OP, Fucnt,
	output reg Branch, Jump,
	output reg [2:0] ALUControl);
	
	

always @ (*)
	case(OP)
		6'b000000: begin
		RegWrite = 1; RegDst = 1; ALUSrc = 0; Branch = 0; MemWrite = 0; MemtoReg = 0; ALUOp = 2'b10 ; Jump = 0; MemRead =0;
		end//R-type
		6'b100011: begin
		RegWrite = 1; RegDst = 0; ALUSrc = 1; Branch = 0; MemWrite = 0; MemtoReg = 1; ALUOp = 2'b00 ; Jump = 0;MemRead =1;
		end//LW
		6'b000100: begin
		RegWrite = 0; RegDst = 0; ALUSrc = 0; Branch = 1; MemWrite = 0; MemtoReg = 0; ALUOp = 2'b01 ; Jump = 0;MemRead =0;
		end//BEQ
		6'b001000: begin
		RegWrite = 1; RegDst = 0; ALUSrc = 1; Branch = 0; MemWrite = 0; MemtoReg = 0; ALUOp = 2'b00 ; Jump = 0;MemRead =0;
		end //ADDI
		6'b001101: begin
		RegWrite = 1; RegDst = 0; ALUSrc = 1; Branch = 0; MemWrite = 0; MemtoReg = 0; ALUOp = 2'b11 ; Jump = 0;MemRead =0;
		end//ORI         
		6'b000010: begin
		RegWrite = 0; RegDst = 0; ALUSrc = 0; Branch = 0; MemWrite = 0; MemtoReg = 0; ALUOp = 2'b11 ; Jump = 1;MemRead =0;
		end//J
	default: begin
		RegWrite = 0; RegDst = 0; ALUSrc = 0; Branch = 0; MemWrite = 0; MemtoReg = 0; ALUOp = 2'b00 ; Jump = 0;MemRead =0;
		end//???
	endcase
	
	
	
initial
begin
	RegWrite = 0; RegDst = 0; ALUSrc = 0; Branch = 0; MemWrite = 0; MemRead = 0; MemtoReg = 0; ALUOp = 2'b00 ; Jump = 0;MemRead =0;
	ALUControl = 3'b000;
end

always @(ALUOp, Fucnt)
begin
    case(ALUOp)
      2'b00: ALUControl <= 3'b010;  // addi
      2'b01: ALUControl <= 3'b110;  // sub
	  2'b11: ALUControl <= 3'b001;  // ori
      default: case(Fucnt)          // RTYPE
	  	  6'b000000: ALUControl <= 3'b100; // sll
          6'b100000: ALUControl <= 3'b010; // add
          6'b100010: ALUControl <= 3'b110; // sub
          6'b100100: ALUControl <= 3'b000; // and
          6'b100101: ALUControl <= 3'b001; // or
          6'b101011: ALUControl <= 3'b111; // sltu		 
          default:   ALUControl <= 3'bxxx; // ???
        endcase
    endcase
	
end


endmodule