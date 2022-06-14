module topARM(input logic clk, rst,
					output logic [31:0] WriteData, DataAdr,
					output logic MemWrite,
					output logic [7:0]  charArray [63:0]);
					
	logic [31:0] PC, Instr, ReadData;
	//Creacion de microprocesador
	
	
	armSingle arm(clk, rst, ReadData, Instr, MemWrite, DataAdr,
	WriteData, PC);
	
	//Creacion de las memorias
	instrucMem imem(PC, Instr);
	dataMem dmem(clk, MemWrite, DataAdr, WriteData, ReadData, charArray);
endmodule