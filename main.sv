module main(
	input logic clk,
	output logic [7:0] R,
   output logic [7:0] G,
   output logic [7:0] B,
   output logic hsync,
   output logic vsync,
   output logic vgaclk
   );
	
	reg[31*8-1:0] s1 = "Un pequeno paso para el hombre,";
	
	VGA control(
		.clk(clk),
		.s1(s1),
		.Red(R), 
		.Green(G), 
		.Blue(B), 
		.hsync(hsync), 
		.vsync(vsync), 
		.vgaclk(vgaclk));
	
endmodule