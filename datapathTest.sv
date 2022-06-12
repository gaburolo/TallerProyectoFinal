module datapathTest();

	logic clk, reset;
	logic [1:0]  RegSrc;
	logic        RegWrite;
	logic [1:0]  ImmSrc;
	logic        ALUSrc;
	logic [2:0]  ALUControl;
	logic        MemtoReg;
	logic        PCSrc;
	logic [3:0]  ALUFlags;
	logic [31:0] PC;
	logic [31:0] Instr;
	logic [31:0] ALUResult, WriteData;
	logic [31:0] ReadData;
	
	dataPath datapath_test(clk, reset, MemtoReg, RegWrite, PCSrc, ALUSrc,
								ImmSrc, RegSrc, ALUControl, Instr, ReadData, 
								ALUFlags, ALUResult, WriteData, PC);
	
	initial begin
		
		clk = 1;
		reset = 0;
		#20
		
		RegSrc = 2'b00;
		RegWrite = 1;
		ImmSrc = 2'b00;
		ALUSrc = 0;
		ALUControl = 3'b000;
		MemtoReg = 0;
		PCSrc = 0;
		Instr = 32'hE0855004;
		ReadData = 0;
		
		clk = 0;
		#200
		
		clk = 1;
		#200
		
		clk = 0;
		#200
		
		clk = 1;
		#200
		
		clk = 0;
		#200
		
		$stop;
		
	end

endmodule 