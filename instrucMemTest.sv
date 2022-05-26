module instrucMemTest();
	logic [31:0]    PC = 32'b0;
   logic [31:0]    Instr;
   instrucMem imem( 
		.a(PC), 
		.rd(Instr)
	);

   initial begin  
   
	PC = 32'h00;
	#20	  
	PC = 32'h04;
	#20	  
	PC = 32'h08;
	#20	
	PC = 32'h0c;
	#20	  	
	PC = 32'h010;
	#20	  
	$stop;
        
   end


endmodule