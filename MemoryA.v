module MemoryA(doutA, dataInA, addrA, wea);

input [7:0]dataInA;
input [2:0]addrA;
input wea;

//reg [7:0] dataInA;

output [7:0]doutA;
reg [7:0]doutA;
// 8 by 8 Memory
reg [7:0]SRAM[7:0];

// We have only Write Functionailty, according to program, so its either 1 or 0.


always @(*)
begin
	// When Write is enabled, the data has to be updated in SRAM
	if(wea)
	 begin
	 //dataInA = dataInA + 1'b01;
	 SRAM[addrA] <= dataInA;
	 
	 end
	else
   	 doutA <= SRAM[addrA];
end
endmodule
