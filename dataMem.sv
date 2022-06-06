module dataMem(input logic clk, we, input logic [31:0] a, input logic [7:0] w_data, output logic [7:0] rd);
	logic [7:0] RAM[1023:0];
	logic [7:0]  addr = 8'b0;
	logic		  done = 1'b0;
	
	initial begin
        $readmemh("rom.mem", RAM);
    end
	assign rd = RAM[a[31:2]]; // word aligned
	
	
	
	always_ff @(posedge clk) begin
		if (we) RAM[a[31:2]] <= w_data;
	end
	
	
endmodule