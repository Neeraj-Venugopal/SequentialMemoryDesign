module comparator (input1, input2, sign);

input [7:0] input1;
input [7:0] input2;
output sign;
reg sign;

always @( input1 or input2 )
begin	
	if( input1 > input2 )
         sign = 1;
	else
	 sign = 0;
end
endmodule
