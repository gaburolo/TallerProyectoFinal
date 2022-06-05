module dividerClock(ci, co);

	input ci;
	output reg co;
	reg[27:0] counter=28'd0;
	parameter DIVISOR = 28'd2;
	
	always @(posedge ci)
		begin
			counter <= counter + 28'd1;
			if(counter >=(DIVISOR-1))
				counter <= 28'd0;
			co <=(counter<DIVISOR/2)?1'b1:1'b0;
		end
	
	
endmodule