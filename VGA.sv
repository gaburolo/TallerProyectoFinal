module VGA(
	input logic clk,
	output logic [7:0] Red, Green, Blue,
	output logic hsync, vsync, vgaclk);
	
	assign sync=1'b0;
	
	dividerClock cmh(clk, clk2);
	
	reg[255:0] text1 = "ooooooo ooooo ooo o oooooo ooooo"; // 32 caracteres incluyendo espacios
	reg[255:0] text2 = "oo ooooooo oooo oooo oo oo ooooo";
	reg[255:0] text3 = "";
	reg[255:0] text4 = "";
	reg[255:0] text5 = "";
	reg[255:0] text6 = "";
	reg[255:0] text7 = "";
	reg[255:0] text8 = "";
	reg[255:0] text9 = "";
	reg[255:0] text10 = "";
	reg[255:0] text11 = "";
	reg[255:0] text12 = "";
	reg[255:0] text13 = "";
	reg[255:0] text14 = "";
	reg[255:0] text15 = "";
	reg[255:0] text16 = "";
	reg[255:0] text17 = "";
	reg[255:0] text18 = "";
	reg[255:0] text19 = "";
	reg[255:0] text20 = "";
	
	SYNC sync1(
		.VGA_CLK_IN(clk2),
		.txt1(text1),
		.txt2(text2),
		.txt3(text3),
		.txt4(text4),
		.txt5(text5),
		.txt6(text6),
		.txt7(text7),
		.txt8(text8),
		.txt9(text9),
		.txt10(text10),
		.txt11(text11),
		.txt12(text12),
		.txt13(text13),
		.txt14(text14),
		.txt15(text15),
		.txt16(text16),
		.txt17(text17),
		.txt18(text18),
		.txt19(text19),
		.txt20(text20),
		.o_hsync(hsync), 
		.o_vsync(vsync), 
		.VGA_CLK_OUT(vgaclk),
		.out_R(Red),
		.out_B(Blue),
		.out_G(Green)
		);
		
		
endmodule 