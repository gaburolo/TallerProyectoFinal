module registerFileTest();

	logic        clk;
	logic        wr;
	logic [3:0]  ra1, ra2, wa;
	logic [31:0] wd, r15;
	logic [31:0] rd1, rd2;
	
	registerFile register_test(clk, wr, ra1, ra2, wa, wd, r15, rd1, rd2);
	
	initial begin 
	
		clk=0;
		wr  = 1;
		r15 = 32'h4c;
		#20
		
		//write r1 = 0xc
		
		ra1 = 4'b0;
		ra2 = 4'b0;
		wa  = 4'b0001;
		wd  = 32'hc;
		#20
		
		//Read r1
		ra1 = 4'b0001;
		ra2 = 4'b0;
		#20
		
		
		//write r4 = 0x8
		ra1 = 4'b0;
		ra2 = 4'b0;
		wa  = 4'b0100;
		wd  = 32'h8;
		#20
		
		
		//Read r1 and r4
		ra1 = 4'b0001;
		ra2 = 4'b0100;
		#20
		
		//write r14 = 0x25
		ra1 = 4'b0;
		ra2 = 4'b0;
		wa  = 4'b1110;
		wd  = 32'hc25;
		#20
		
		//Read r4 and r14
		ra1 = 4'b0100;
		ra2 = 4'b1110;
		#20
		$stop;
			
	end
	
	always begin
		clk=~clk;#10;
	end
	
endmodule 