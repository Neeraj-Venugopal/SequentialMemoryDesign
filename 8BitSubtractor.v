module Subtractor( inputA, inputB, subOut);

input [7:0] inputA;
input [7:0] inputB;

output [7:0] subOut;
reg [7:0] subOut;

always @ (inputA or inputB)
begin
	subOut = inputB - inputA;
end
endmodule

