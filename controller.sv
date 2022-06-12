module controller(input logic clk, reset,
						input logic [31:12] Instr,
						input logic [3:0] ALUFlags,
						output logic [1:0] RegSrc,
						output logic RegWrite,
						output logic [1:0] ImmSrc,
						output logic ALUSrc,
						output logic [2:0] ALUControl,
						output logic MemWrite, MemtoReg,
						output logic PCSrc);
						
	logic [1:0] FlagW;
	logic PCS, RegW, MemW, NoWrite;
	
	Decoder dec(Instr[15:12], Instr[27:26], Instr[25:20], PCS,
					RegW, MemW, MemtoReg, ALUSrc, 
					NoWrite, ImmSrc, FlagW, RegSrc,
					ALUControl);



	condlogic cl(clk, reset, Instr[31:28], ALUFlags, FlagW, PCS, RegW, MemW, NoWrite, PCSrc, RegWrite, MemWrite);
endmodule