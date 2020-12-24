
module Data_mem(
	input clk, rst,
	input wire MemWrite, MemRead,
	output reg [31:0] DM_Read_data,
	input wire[31:0] DM_Write_data,
	input wire [6:0] DM_addr
	);
	
reg [31:0] D_mem [0:63];

initial 
begin
D_mem[0] = 32'b00000000000000000000000000000000;
D_mem[1] = 32'b00000000000000000000000000000001;
D_mem[2] = 32'b00000000000000000000000000000010;
D_mem[3] = 32'b00000000000000000000000000000011;
D_mem[4] = 32'b00000000000000000000000000000100;
D_mem[5] = 32'b00000000000000000000000000000111 ;
D_mem[6] = 32'b00000000000000000000000000000110 ;
D_mem[7] = 32'b00000000000000000000000000000111 ;
D_mem[8] = 32'b00000000000000000000000000001000 ;
D_mem[9] = 32'b00000000000000000000000000001001 ;
D_mem[10] = 32'b00000000000000000000000000001010 ;
D_mem[11] = 32'b00000000000000000000000000001011 ;
D_mem[12] = 32'b00000000000000000000000000001100 ;
D_mem[13] = 32'b00000000000000000000000000001101 ;
D_mem[14] = 32'b00000000000000000000000000001110 ;
D_mem[15] = 32'b00000000000000000000000000001111 ;
D_mem[16] = 32'b00000000000000000000000000010000 ;
D_mem[17] = 32'b00000000000000000000000000010001 ;
D_mem[18] = 32'b00000000000000000000000000010010 ;
D_mem[19] = 32'b00000000000000000000000000010011 ;
D_mem[20] = 32'b00000000000000000000000000010100 ;
D_mem[21] = 32'b00000000000000000000000000010101 ;
D_mem[22] = 32'b00000000000000000000000000010110 ;
D_mem[23] = 32'b00000000000000000000000000010111 ;
D_mem[24] = 32'b00000000000000000000000000011000 ;
D_mem[25] = 32'b00000000000000000000000000011001 ;
D_mem[26] = 32'b00000000000000000000000000011010 ;
D_mem[27] = 32'b00000000000000000000000000011011 ;
D_mem[28] = 32'b00000000000000000000000000011100 ;
D_mem[29] = 32'b00000000000000000000000000011101 ;
D_mem[30] = 32'b00000000000000000000000000011110 ;
D_mem[31] = 32'b00000000000000000000000000011111 ;
D_mem[32] = 32'b00000000000000000000000000000000 ;
D_mem[33] = 32'b00000000000000000000000000000001 ;
D_mem[34] = 32'b00000000000000000000000000000010 ;
D_mem[35] = 32'b00000000000000000000000000000011 ;
D_mem[36] = 32'b00000000000000000000000000000100 ;
D_mem[37] = 32'b00000000000000000000000000000101 ;
D_mem[38] = 32'b00000000000000000000000000000110 ;
D_mem[39] = 32'b00000000000000000000000000000111 ;
D_mem[40] = 32'b00000000000000000000000000001000 ;
D_mem[41] = 32'b00000000000000000000000000001001 ;
D_mem[42] = 32'b00000000000000000000000000001010 ;
D_mem[43] = 32'b00000000000000000000000000001011 ;
D_mem[44] = 32'b00000000000000000000000000001100 ;
D_mem[45] = 32'b00000000000000000000000000001101 ;
D_mem[46] = 32'b00000000000000000000000000001110 ;
D_mem[47] = 32'b00000000000000000000000000001111 ;
D_mem[48] = 32'b00000000000000000000000000010000 ;
D_mem[49] = 32'b00000000000000000000000000010001;
D_mem[50] = 32'b00000000000000000000000000010010;
D_mem[51] = 32'b00000000000000000000000000010011;
D_mem[52] = 32'b00000000000000000000000000010100;
D_mem[53] = 32'b00000000000000000000000000010101;
D_mem[54] = 32'b00000000000000000000000000010110;
D_mem[55] = 32'b00000000000000000000000000010111;
D_mem[56] = 32'b00000000000000000000000000011000;
D_mem[57] = 32'b00000000000000000000000000011001;
D_mem[58] = 32'b00000000000000000000000000011010;
D_mem[59] = 32'b00000000000000000000000000011011;
D_mem[60] = 32'b00000000000000000000000000011100;
D_mem[61] = 32'b00000000000000000000000000011101;
D_mem[62] = 32'b00000000000000000000000000011110;
D_mem[63] = 32'b00000000000000000000000000011111;
end


always @(*)
begin 
	if(MemWrite == 0 && MemRead == 1) //lw
		DM_Read_data = D_mem [DM_addr][31:0];
		
	else
		DM_Read_data = DM_Read_data;
end

always @(posedge clk or posedge rst)
begin
	if(rst)
	begin
D_mem[0] = 32'b00000000000000000000000000000000;
D_mem[1] = 32'b00000000000000000000000000000001;
D_mem[2] = 32'b00000000000000000000000000000010;
D_mem[3] = 32'b00000000000000000000000000000011;
D_mem[4] = 32'b00000000000000000000000000000100;
D_mem[5] = 32'b00000000000000000000000000000111 ;
D_mem[6] = 32'b00000000000000000000000000000110 ;
D_mem[7] = 32'b00000000000000000000000000000111 ;
D_mem[8] = 32'b00000000000000000000000000001000 ;
D_mem[9] = 32'b00000000000000000000000000001001 ;
D_mem[10] = 32'b00000000000000000000000000001010 ;
D_mem[11] = 32'b00000000000000000000000000001011 ;
D_mem[12] = 32'b00000000000000000000000000001100 ;
D_mem[13] = 32'b00000000000000000000000000001101 ;
D_mem[14] = 32'b00000000000000000000000000001110 ;
D_mem[15] = 32'b00000000000000000000000000001111 ;
D_mem[16] = 32'b00000000000000000000000000010000 ;
D_mem[17] = 32'b00000000000000000000000000010001 ;
D_mem[18] = 32'b00000000000000000000000000010010 ;
D_mem[19] = 32'b00000000000000000000000000010011 ;
D_mem[20] = 32'b00000000000000000000000000010100 ;
D_mem[21] = 32'b00000000000000000000000000010101 ;
D_mem[22] = 32'b00000000000000000000000000010110 ;
D_mem[23] = 32'b00000000000000000000000000010111 ;
D_mem[24] = 32'b00000000000000000000000000011000 ;
D_mem[25] = 32'b00000000000000000000000000011001 ;
D_mem[26] = 32'b00000000000000000000000000011010 ;
D_mem[27] = 32'b00000000000000000000000000011011 ;
D_mem[28] = 32'b00000000000000000000000000011100 ;
D_mem[29] = 32'b00000000000000000000000000011101 ;
D_mem[30] = 32'b00000000000000000000000000011110 ;
D_mem[31] = 32'b00000000000000000000000000011111 ;
D_mem[32] = 32'b00000000000000000000000000000000 ;
D_mem[33] = 32'b00000000000000000000000000000001 ;
D_mem[34] = 32'b00000000000000000000000000000010 ;
D_mem[35] = 32'b00000000000000000000000000000011 ;
D_mem[36] = 32'b00000000000000000000000000000100 ;
D_mem[37] = 32'b00000000000000000000000000000101 ;
D_mem[38] = 32'b00000000000000000000000000000110 ;
D_mem[39] = 32'b00000000000000000000000000000111 ;
D_mem[40] = 32'b00000000000000000000000000001000 ;
D_mem[41] = 32'b00000000000000000000000000001001 ;
D_mem[42] = 32'b00000000000000000000000000001010 ;
D_mem[43] = 32'b00000000000000000000000000001011 ;
D_mem[44] = 32'b00000000000000000000000000001100 ;
D_mem[45] = 32'b00000000000000000000000000001101 ;
D_mem[46] = 32'b00000000000000000000000000001110 ;
D_mem[47] = 32'b00000000000000000000000000001111 ;
D_mem[48] = 32'b00000000000000000000000000010000 ;
D_mem[49] = 32'b00000000000000000000000000010001;
D_mem[50] = 32'b00000000000000000000000000010010;
D_mem[51] = 32'b00000000000000000000000000010011;
D_mem[52] = 32'b00000000000000000000000000010100;
D_mem[53] = 32'b00000000000000000000000000010101;
D_mem[54] = 32'b00000000000000000000000000010110;
D_mem[55] = 32'b00000000000000000000000000010111;
D_mem[56] = 32'b00000000000000000000000000011000;
D_mem[57] = 32'b00000000000000000000000000011001;
D_mem[58] = 32'b00000000000000000000000000011010;
D_mem[59] = 32'b00000000000000000000000000011011;
D_mem[60] = 32'b00000000000000000000000000011100;
D_mem[61] = 32'b00000000000000000000000000011101;
D_mem[62] = 32'b00000000000000000000000000011110;
D_mem[63] = 32'b00000000000000000000000000011111;
end

	else if(MemWrite ==1 && MemRead ==0) //sw
		D_mem[DM_addr][31:0] <= DM_Write_data;
end


endmodule
