module main(
	input logic clk,
	input logic rst,
	output logic [7:0] R,
   output logic [7:0] G,
   output logic [7:0] B,
   output logic hsync,
   output logic vsync,
   output logic vgaclk
   );
	
	logic [31:0] WriteData, DataAdr;
   logic        MemWrite;
   logic [7:0]  charArray [63:0];
	
	topARM cpu(
        clk,
        rst,
        WriteData,
        DataAdr,
        MemWrite,
        charArray
    );
	
	VGA control(
		.clk(clk),
		.chars(charArray),
		.Red(R), 
		.Green(G), 
		.Blue(B), 
		.hsync(hsync), 
		.vsync(vsync), 
		.vgaclk(vgaclk));
	
endmodule