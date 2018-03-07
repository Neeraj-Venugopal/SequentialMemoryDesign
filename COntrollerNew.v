module Controller(WEA, IncA, IncB, WEB, Reset, clock);

output reg WEA = 0, IncA = 0, IncB = 0, WEB = 0;
reg [4:0] Out;
input Reset, clock;
reg  [4:0] GA1, GA2, GA3, GA4, GA5, GA6, GA7, GA8, GB1, GB2, GB3, GC1, GC2, GC3, GC4, GD1, GD2, GD3, GD4, GD5;



always@(posedge clock)
begin
	if(Reset || (Out[4]& (!Out[3]) & (!Out[2]) & Out[1]& (!Out[0])))
		Out <= 0;
	else
		Out <= Out +1;
end


always @(*)
begin
	GA1 = ((!Out[4])& (!Out[3]) & (!Out[2]) & (!Out[1]) & Out[0]);
	GA2 = ((!Out[4])& (!Out[3]) & (!Out[2]) & Out[1] & (!Out[0]));
	GA3 = ((!Out[4])& (!Out[3]) & (!Out[2]) & Out[1] & Out[0]);
	GA4 = ((!Out[4])& (!Out[3]) & Out[2] & (!Out[1]) & (!Out[0]));
	GA5 = ((!Out[4])& (!Out[3]) & Out[2] & (!Out[1]) & Out[0]);
	GA6 = ((!Out[4])& (!Out[3]) & Out[2] & Out[1] & (!Out[0]));
	GA7 = ((!Out[4])& (!Out[3]) & Out[2] & Out[1] & Out[0]);
	GA8 = ((!Out[4])& Out[3] & (!Out[2]) & (!Out[1]) & (!Out[0]));

	GB1 = (Out[4] & (!Out[3]) & (!Out[2]) & (!Out[1]) & Out[0]);
	GB2 = (Out[4] & (!Out[3]) & (!Out[2]) & Out[1] & (!Out[0]));
	GB3 = (Out[4] & (!Out[3]) & (!Out[2]) & Out[1] & Out[0]);

	GC1 = ((!Out[4])& Out[3] & Out[2] & (!Out[1]) & (!Out[0]));
	GC2 = ((!Out[4])& Out[3] & Out[2] & Out[1] & (!Out[0]));
	GC3 = (Out[4] & (!Out[3]) & (!Out[2]) & (!Out[1]) & (!Out[0]));
	GC4 = (Out[4] & (!Out[3]) & (!Out[2]) & Out[1] & (!Out[0]));

	GD1 = ((!Out[4])& Out[3] & (!Out[2]) & Out[1] & Out[0]);
	GD2 = ((!Out[4])& Out[3] & Out[2] & (!Out[1]) & Out[0]);
	GD3 = ((!Out[4])& Out[3] & Out[2] & Out[1] & Out[0]);
	GD4 = ( Out[4]& (!Out[3]) & (!Out[2]) & (!Out[1]) & Out[0]);

	WEA = GA1 || GA2 || GA3 || GA4 || GA5 || GA6 || GA7 || GA8;
 	IncA = ~(GB1 || GB2 || GB3);
	IncB = GC1 || GC2 || GC3 || GC4;  
	WEB = GD1 || GD2 || GD3 || GD4;


end	
endmodule
