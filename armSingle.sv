module armSingle(input logic clk, rst,
				input logic [31:0] ReadData,
				input logic [31:0] Instr,
				output logic MemWrite,
				output logic [31:0] ALUResult, WriteData,
				output logic [31:0] PC
				);
				
	logic [3:0] ALUFlags;
	logic RegWrite, ALUSrc, MemtoReg, PCSrc;
	logic [1:0] RegSrc, ImmSrc; 
	logic [2:0] ALUControl;
	
	
	controller c(clk, rst, Instr[31:12], ALUFlags,RegSrc, RegWrite, ImmSrc,
					ALUSrc, ALUControl, MemWrite, MemtoReg, PCSrc);
					
					
	dataPath dp(clk, rst, MemtoReg, RegWrite, PCSrc, ALUSrc, ImmSrc, RegSrc, ALUControl,
					Instr, ReadData, ALUFlags, ALUResult, WriteData, PC);
					

endmodule