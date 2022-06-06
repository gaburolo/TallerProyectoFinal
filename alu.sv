module alu #(parameter M=4)(
	input  logic [M-1:0] a, b, 
	input  logic [2:0]   s,
	output logic [M-1:0] y, 
	output logic [3:0]   flags
	);
				 
	logic [M-1:0] y_mux;
	logic [M-1:0] y_sum;
	logic cout, N,Z,V,C;
	
	
	mux_2  #(M) sum_mux(b, ~b, s[0], y_mux);
	
	suma #(M) sum_alu(a, y_mux, s[0], y_sum,cout);
	
	
	always @ (*)
		
		begin
	
			case(s)
		
				3'b000: y <= y_sum;
				3'b001: y <= y_sum;
				3'b010: y <= a & b;
				3'b011: y <= a | b;
				3'b100: y <= a ^ b;
				3'b101: y <= ~a;
				3'b110: y <= ~b;
				default y <= 32'b0;
			
			endcase
			
			N = y[M-1];
			Z = y ? 0 : 1;	
			C = ~(s[1]) & cout & ~(s[2]);
			V = ~(s[0] ^ a[M-1] ^ b[M-1]) & (y_sum[M-1] ^ a[M-1]) & ~(s[1]) & ~(s[2]);	
				
		end
		
		assign flags = {N,Z,C,V};
	
endmodule 