module MemoryB(doutB, datainB, addressB, web);

input [7:0]datainB;
input [1:0]addressB;

input web;

output [7:0]doutB;
reg [7:0]doutB;
// 8 by 4 Memory
reg [7:0]SRAM[3:0];


always @(*)
begin
	if(web)
		SRAM[addressB] <= datainB;
	else
	 doutB <= SRAM[addressB];
	
end
endmodule
