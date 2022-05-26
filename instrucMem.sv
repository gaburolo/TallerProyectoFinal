module instrucMem(input logic [31:0] a, output logic [31:0] rd );
	
	logic [31:0] mem[63:0];
	
	initial begin 
		$readmemh("instructions_file.mem",mem);
	end

	assign rd = mem[a[31:2]];

endmodule