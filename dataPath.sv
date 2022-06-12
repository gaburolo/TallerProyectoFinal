module dataPath(input clk, rst, MemToReg, RegWrite, PCSrc, ALUSrc,
						input logic [1:0] ImmSrc, RegSrc,
						input logic [2:0] AluControl,
						input logic [31:0] Instr, ReadData,
						output logic [3:0] AluFlags,
						output logic [31:0] ALUResult, WriteData,
						output logic [31:0] PC);
	//pc[31:0] y ALUSrc
	
	// Conexiones internas
	logic [31:0] PCNext, PCPlus4, PCPlus8;
	logic [31:0] ExtImm, SrcA, SrcB, Result;
	logic [3:0]  Ra1, Ra2;
	logic cout1, cout2;
	//Conexiones memoria de instrucciones
	
	
	//Parte relacionada al PC
	mux_2 #(32) PCSrcMux(PCPlus4, Result, PCSrc, PCNext);
	flopr #(32) PCReg(clk, rst, PCNext, PC);
	//Dos sumadores de +4
	suma #(32) pcadder1(PC, 32'b100, 1'b0, PCPlus4, cout1);
	suma #(32) pcadder2(PCPlus4, 32'b100, 1'b0, PCPlus8, cout2);
	
	
	//Mux's en la salida de la memoria de instrucciones
	mux_2 #(4) ra1mux(Instr[19:16], 4'b1111, RegSrc[0], Ra1);
	mux_2 #(4) ra2mux(Instr[3:0], Instr[15:12], RegSrc[1], Ra2);
	
	
	//se conecta el banco de registros
	registerFile RegFile(clk, RegWrite, Ra1, Ra2, Instr[15:12], Result, PCPlus8, SrcA, WriteData);
	
	//Mux a la salida del banco de registros
	mux_2 #(32) resmux(ALUResult, ReadData, MemToReg, Result);
	
	//se conecta el modulo de extension
	extend Ext(Instr[23:0], ImmSrc, ExtImm);
	
	//se  conecta la ALU
	alu alu(SrcA, SrcB, AluControl, ALUResult, AluFlags);
	
	//Se conecta el mux a la salida de la RAM
	mux_2 #(32) MemtoRegMux(WriteData, ExtImm, ALUSrc, SrcB);
	
	

endmodule