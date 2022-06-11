module vgaData(input logic clk, output logic [7:0] salida[300:0]);

	logic [7:0] RAM[1023:0];
	initial begin
		$readmemh("rom.mem", RAM);
   end
	
	logic [31:0] con = 32'b0;

	always_ff @(posedge clk) begin
		if(con<=300) begin
			
			if( RAM[con[31:2]]=== 7'bx) begin
				con=con+4;
				salida[con] <= 31'b0;
			end
			else begin
				salida[con] <= RAM[con[31:2]];
				con=con+4;
			end
		end
			
	
	end
	
	
	 
endmodule