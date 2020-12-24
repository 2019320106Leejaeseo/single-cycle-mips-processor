module alu_mips(a, b, control, outalu, zero, shift);
input [31:0] a, b;
input [2:0] control;
output reg [31:0] outalu;
output zero;
input[4:0] shift ;



always@(control, a, b)
begin
	case(control)
		0 : outalu= a&b; //and
		1 : outalu= a|b; //or
		2 : outalu= a+b; //add
		4 : outalu= b<<shift;
		6 : outalu = a-b;
		7 : outalu=a<b?1:0; //slt
		default : outalu=0;
	endcase
end

assign zero=outalu==0?1:0;

endmodule
