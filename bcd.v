module bcd(
	input wire [6:0]num,
	output reg [7:0]digit);
	
	reg [3:0]tens ;
	reg [3:0]ones;
	
always@(*)
begin
	if(num>=90) 
	begin
	tens = 9;
	ones = num-90;
	end
	else if(num>=80) 
	begin
	tens = 8;
	ones = num-80;
	end
	else if(num>=70) 
	begin
	tens = 7;
	ones = num-70;
	end
	else if(num>=60) 
	begin
	tens = 6;
	ones = num-60;
	end
	else if(num>=50) 
	begin
	tens = 5;
	ones = num-50;
	end
	else if(num>=40) 
	begin
	tens = 4;
	ones = num-40;
	end
	else if(num>=30) 
	begin
	tens = 3;
	ones = num-30;
	end
	else if(num>=20) 
	begin
	tens = 2;
	ones = num-20;
	end
	else if(num>=10) 
	begin
	tens = 1;
	ones = num-10;
	end
	else 
	begin
	tens = 0;
	ones = num;
	end
	
	digit = {tens,ones};
end

endmodule