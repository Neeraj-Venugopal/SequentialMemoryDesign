module BitCounter2 (incB, reset, clock, addrB);
  
input incB;
input clock;
input reset;

output [1:0] addrB;
reg [1:0] addrB;
 
  // Set the initial value
initial
addrB = 2'b00;
 
  // Increment count on clock
always @(posedge clock)
begin
    if (reset == 1'b1)
      addrB = 2'b00;
    else if (incB)
      addrB = addrB + 2'b01;
 end
endmodule
