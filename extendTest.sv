module extendTest();

	logic [23:0] instr;
	logic [1:0]  immSrc;
	logic [31:0] extImm;
	
	extend extend_test(instr, immSrc, extImm);
	
	initial begin
	
	
	instr = 24'b110010101010111110011101;
	immSrc = 2'b00;
	#20
	
	immSrc = 2'b01;
	#20
	
	immSrc = 2'b10;
	#20
	
	$stop;
	
	end
	
endmodule