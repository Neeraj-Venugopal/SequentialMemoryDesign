module BitCounter3 (incA, reset, clock, addrA);
  
input incA;
input reset;
input clock;

output [2:0] addrA;
reg [2:0] addrA;
 
  // Set the initial value
initial
  addrA = 3'b00;
 
  // Increment count on clock
always @(posedge clock)
begin
    if (reset == 1'b1)
      addrA <= 3'b000;
    else if (incA == 1'b1)
      addrA = addrA + 3'b001;
 end
endmodule
