module topROM (input clk, rst,output logic [7:0] q);
	
	logic [7:0] address;
	
	counterMem counter (clk, rst, 1'b1, address);
	DataROM dRom (address, clk, q);
	
endmodule