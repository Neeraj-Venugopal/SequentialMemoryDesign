module Adder(inputA, inputB, addOut);

input [7:0] inputA;
input [7:0] inputB;
output [7:0] addOut;
reg [7:0] addOut;

always @ (inputA or inputB)
begin
	addOut = inputA + inputB;
end
endmodule
