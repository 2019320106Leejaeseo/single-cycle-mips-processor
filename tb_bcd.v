module tb_bcd();
reg [6:0] num;
wire [7:0]digit;
bcd u0(num, digit);
initial
begin
num = 6'd0;
end

always #50
begin  
	num = num + 7;
end

endmodule