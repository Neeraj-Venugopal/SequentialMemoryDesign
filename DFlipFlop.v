module dFlipFlop (data, clk, doutFlipFlop);

input [7:0] data;
input clk;

output [7:0] doutFlipFlop;
reg [7:0] doutFlipFlop;


always @(posedge clk)
begin
	doutFlipFlop <= data;
end
endmodule
