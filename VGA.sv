module VGA(
	input logic clk,
	input [31*8-1:0] s1,
	output logic [7:0] Red, Green, Blue,
	output logic hsync, vsync, vgaclk);
	
	assign sync=1'b0;
	
	dividerClock cmh(clk, clk2);
	
	SYNC sync1(
		.VGA_CLK_IN(clk2),
		.s1(s1),
		.o_hsync(hsync), 
		.o_vsync(vsync), 
		.VGA_CLK_OUT(vgaclk),
		.out_R(Red),
		.out_B(Blue),
		.out_G(Green)
		);
		
		
endmodule 