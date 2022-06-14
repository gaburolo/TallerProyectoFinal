module aluTest();

	
	parameter M = 5;
	
	logic[M-1:0] a;
	logic[M-1:0] b;
	logic[2:0] s;
	
	logic [M-1:0] y; 
	logic [3:0]   flags;
	
	
	alu #(M) alu_test (a, b, s, y, flags);
	
	
	initial begin 
		
		//Suma
		s = 3'b000;
		a = 12;
		b = 20;
		#20
		
		a = 4'b0001;
		b = 4;
		#20
		
		a = 0;
		b = 4;
		#20
		
		
		//Resta
		s = 3'b001;
		a = 3; 
		b = 3;
		#20
		
		a = 4'b0001; 
		b = 2;
		#20
		
		
		//AND
		s = 3'b010;
		a = 4'b1111; 
		b = 4'b1001;
		#20
		
		//OR
		s = 3'b011;
		a = 4'b0110; 
		b = 4'b1001;
		#20
		
		//XOR
		s = 3'b100;
		a = 4'b0011; 
		b = 4'b0101;
		#20
		
		//NOT a
		s = 3'b101;
		a = 32'b1101; 
		b = 32'b1001;
		#20
		
		//NOT b
		s = 3'b110;
		a = 32'b1010; 
		b = 32'b0001;
		#20
		
		$stop;
		
	end
	

endmodule