module blockTest;

reg clock;
reg reset;

wire [2:0] addressA; 

reg [7:0] dataInA;
wire [7:0] dataOutA;

wire [7:0] outFlipFlop;

wire [7:0] addOut;
wire [7:0] subOut;

wire [1:0] addressB;

wire wea;
wire incA;

wire web;
wire incB;


wire sign;
wire [7:0] dataInB;
wire [7:0] dataOutB;


//integer i = 0;
//wire [7:0] counterOutA;
//wire [7:0] counterOutB;


// BitCounter3 (incA, reset, clock, addrA)
BitCounter3 counterTop ( incA, reset, clock, addressA );

// MemoryA(doutA, dataInA, addrA, wea)
MemoryA memoryTop ( dataOutA, dataInA, addressA, wea );

// dFlipFlop (data, clk, doutFlipFlop)
dFlipFlop flipFlop ( dataOutA, clock, outFlipFlop );

// comparator (input1, input2, sign)
comparator comp ( outFlipFlop, memoryOutA, sign );

// Adder(inputA, inputB, addOut)
Adder add ( outFlipFlop, dataOutA, addOut );

// Subtractor( inputA, inputB, subOut)
Subtractor sub ( outFlipFlop, dataOutA, subOut );

// mux2To1(addOut, subOut, enable, dataInB)
mux2To1 mux ( addOut, subOut, sign, dataInB );

// BitCounter2 (incB, reset, clock, addrB)
BitCounter2 counterBottom ( incB, reset, clock, addressB );

// MemoryB(doutB, datainB, addressB, web)
MemoryB memoryBottom ( dataOutB, dataInB, addressB, web  );

// controller ( incA, incB, wea, web, reset, clock, iterator)
//controller control ( incA, incB, wea, web, reset, clock);

// Controller(WEA, IncA, IncB, WEB, Reset, clock);
Controller control (wea, incA, incB, web, reset, clock);

initial 
begin
	dataInA = 8'b00000000;
	clock = 1'b1;
	forever #5 clock = ~clock;
end

initial 
begin
	reset = 1'b1;
	#10 reset = 1'b0;
	
	forever #10 dataInA = dataInA + 8'b00000001;
	//dataInA = 8'b00000000;
	//for(i = 0; i < 8; i = i + 1)
	//begin
	// dataInA = dataInA + 2'b10;
	// #3;
	//end
		
	#200 $finish;
end

endmodule
