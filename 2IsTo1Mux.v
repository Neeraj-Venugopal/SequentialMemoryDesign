module mux2To1(addOut, subOut, enable, dataInB);

input [7:0] addOut;
input [7:0] subOut;
input enable;
output [7:0] dataInB;

reg [7:0] dataInB;

always @(addOut or subOut or enable)
begin
	if (enable == 1'b0)
	 dataInB = subOut;
	else
	 dataInB = addOut;
end
endmodule

