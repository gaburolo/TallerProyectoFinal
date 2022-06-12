module topARM(input logic clk, rst,
					output logic [31:0] WriteData, DataAdr,
					output logic MemWrite);
					
	logic [31:0] PC, Instr, ReadData;
	//Creacion de microprocesador
	
	
	armSingle arm(clk, rst, ReadData, Instr, MemWrite, DataAdr,
	WriteData, PC);
	
	//Creacion de las memorias
	instrucMem imem(PC, Instr);
	dataMem dmem(clk, MemWrite, DataAdr, WriteData, ReadData);
endmodule