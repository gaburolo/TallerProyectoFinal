module dataMem(input logic clk, we, input logic [31:0] a,
					input logic [31:0] w_data, output logic [32:0] rd,
					output logic  [7:0] chars [63:0]);
	logic [7:0] RAM[63:0];

	
	
	initial begin
        $readmemh("rom.mem", RAM);
    end
	assign rd = RAM[a[31:2]]; // word aligned
	
	
	
	always_ff @(posedge clk) begin
		if (we) begin 
			RAM[a[31:2]] <= w_data;
			$writememh("rom.mem", RAM);
		end
	end
	assign chars = RAM[63:0];
	
	
endmodule