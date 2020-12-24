module Register(
	input wire clk, rst,
	input wire RegWrite,
	input wire [4:0] Read_reg1, Read_reg2,
	input wire [4:0] Write_addr,
	input wire [31:0] Write_data,
	output reg [31:0] Read_data1, Read_data2
	);
	
reg [31:0] mem [0:31]; // 32bits 32 entries

initial 
begin
	mem[0] = 32'd0; // $zero = 0;
end

integer i;


always @(*)
begin
	if ( Read_reg1 == 5'd0) // $zero
		Read_data1 = 32'd0;
	else if ((Read_reg1 == Write_addr) && RegWrite)
		Read_data1 = Write_data;
	else
		Read_data1 = mem[Read_reg1][31:0];
end

always @(*)
begin
	if ( Read_reg2 == 5'd0) // $zero
		Read_data2 = 32'd0;
	else if ((Read_reg2 == Write_addr) && RegWrite)
		Read_data2 = Write_data;
	else
		Read_data2 = mem[Read_reg2][31:0];
end

always @(posedge clk or posedge rst) 
begin
	if(rst) 
	begin
		for( i = 0;i<32;i=i+1) begin
		mem[i] = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
		end
	end
	else if (RegWrite && Write_addr != 5'd0) 
	begin
		mem[Write_addr] <= Write_data;
	end
end
endmodule