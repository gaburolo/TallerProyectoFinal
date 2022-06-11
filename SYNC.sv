`define WHITE 24'hFFFFFF
`define BLACK 24'h000000

`define GREEN 24'h00FF00
`define PURPLE 24'hCC99FF
`define CELESTE 24'h00E4FF
`define RED 24'hD10E49
`define BLUE 24'h0000FF
`define YELLOW 24'hF3F02A
`define ORANGE 24'hF39C12 
`define GRAY 24'h7F8C8D

module SYNC(
	input logic VGA_CLK_IN,
	input reg[255:0] txt1,
	input reg[255:0] txt2,
	input reg[255:0] txt3,
	input reg[255:0] txt4,
	input reg[255:0] txt5,
	input reg[255:0] txt6,
	input reg[255:0] txt7,
	input reg[255:0] txt8,
	input reg[255:0] txt9,
	input reg[255:0] txt10,
	input reg[255:0] txt11,
	input reg[255:0] txt12,
	input reg[255:0] txt13,
	input reg[255:0] txt14,
	input reg[255:0] txt15,
	input reg[255:0] txt16,
	input reg[255:0] txt17,
	input reg[255:0] txt18,
	input reg[255:0] txt19,
	input reg[255:0] txt20,
	output logic VGA_CLK_OUT,
	output logic o_hsync,
	output logic o_vsync,
	output logic[7:0] out_R,
	output logic[7:0] out_B,
	output logic[7:0] out_G
	
);
	//Contadores para coordenadas
	reg[9:0] sx=0;
	reg[9:0] sy=0;
	//figure <= ((sx > 350 && sx < 370) && (sy > 150 && sy < 170));
	//VALORES RBG
	reg[7:0] color_R=0;
	reg[7:0] color_B=0;
	reg[7:0] color_G=0;
	
	wire[255:0] text1 = txt1;
	wire[255:0] text2 = txt2;
	wire[255:0] text3 = txt3;
	wire[255:0] text4 = txt4;
	wire[255:0] text5 = txt5;
	wire[255:0] text6 = txt6;
	wire[255:0] text7 = txt7;
	wire[255:0] text8 = txt8;
	wire[255:0] text9 = txt9;
	wire[255:0] text10 = txt10;
	wire[255:0] text11 = txt11;
	wire[255:0] text12 = txt12;
	wire[255:0] text13 = txt13;
	wire[255:0] text14 = txt14;
	wire[255:0] text15 = txt15;
	wire[255:0] text16 = txt16;
	wire[255:0] text17 = txt17;
	wire[255:0] text18 = txt18;
	wire[255:0] text19 = txt19;
	wire[255:0] text20 = txt20;
	
	
	Pixel_On_Text2 t1(VGA_CLK_IN, text1, 335, 77, sx, sy, pixel);
	Pixel_On_Text2 t2(VGA_CLK_IN, text2, 335, 97, sx, sy, pixel2);
	Pixel_On_Text2 t3(VGA_CLK_IN, text3, 335, 117, sx, sy, pixel3);
	Pixel_On_Text2 t4(VGA_CLK_IN, text4, 335, 137, sx, sy, pixel4);
	Pixel_On_Text2 t5(VGA_CLK_IN, text5, 335, 157, sx, sy, pixel5);
	Pixel_On_Text2 t6(VGA_CLK_IN, text6, 335, 177, sx, sy, pixel6);
	Pixel_On_Text2 t7(VGA_CLK_IN, text7, 335, 197, sx, sy, pixel7);
	Pixel_On_Text2 t8(VGA_CLK_IN, text8, 335, 217, sx, sy, pixel8);
	Pixel_On_Text2 t9(VGA_CLK_IN, text9, 335, 237, sx, sy, pixel9);
	Pixel_On_Text2 t10(VGA_CLK_IN, text10, 335, 257, sx, sy, pixel10);
	Pixel_On_Text2 t11(VGA_CLK_IN, text11, 335, 277, sx, sy, pixel11);
	Pixel_On_Text2 t12(VGA_CLK_IN, text12, 335, 297, sx, sy, pixel12);
	Pixel_On_Text2 t13(VGA_CLK_IN, text13, 335, 317, sx, sy, pixel13);
	Pixel_On_Text2 t14(VGA_CLK_IN, text14, 335, 337, sx, sy, pixel14);
	Pixel_On_Text2 t15(VGA_CLK_IN, text15, 335, 357, sx, sy, pixel15);
	Pixel_On_Text2 t16(VGA_CLK_IN, text16, 335, 377, sx, sy, pixel16);
	Pixel_On_Text2 t17(VGA_CLK_IN, text17, 335, 397, sx, sy, pixel17);
	Pixel_On_Text2 t18(VGA_CLK_IN, text18, 335, 417, sx, sy, pixel18);
	Pixel_On_Text2 t19(VGA_CLK_IN, text19, 335, 437, sx, sy, pixel19);
	Pixel_On_Text2 t20(VGA_CLK_IN, text20, 335, 457, sx, sy, pixel20);
	
	//FOR DOBLE
	always @(posedge VGA_CLK_IN)
		begin
			if(sx < 799)
				sx <= sx + 1;
			else
				sx <= 0;
		end
		
	always @(posedge VGA_CLK_IN)
		begin
			if(sx == 799)
				begin
					if(sy < 525)
						sy <= sy + 1;
					else
						sy <= 0;
				end
		end
	
	always @(posedge VGA_CLK_IN)
	begin
		if((sx <=326 || 600 <= sx) || (sy <=70 || 475 <= sy))//margen no útil
			begin 
				{color_R,color_G,color_B} <= `GRAY;
			end
		else if((326 < sx && sx < 600) && (70 < sy && sy < 75))//margen horizontal superior
			begin 
				{color_R,color_G,color_B} <= `BLACK;
			end
		else if((326 < sx && sx < 600) && (470 < sy && sy < 475))//margen horizontal inferior
			begin 
				{color_R,color_G,color_B} <= `BLACK;
			end
		else
			begin
				if(597 <= sx && sx < 600)//margen vertical zurdo
					begin 
						{color_R,color_G,color_B} <= `BLACK;
					end
				else if(326 <= sx && sx < 330)//margen vertical diestro
					begin 
						{color_R,color_G,color_B} <= `BLACK;
					end
				else if((330 < sx && sx < 596) && (70 < sy && sy < 470) && 
						  (sy == 90  || sy == 110 || sy == 130 || sy == 150 || sy == 170 || sy == 190 || sy == 210 || 
							sy == 230 || sy == 250 || sy == 270 || sy == 290 || sy == 310 || sy == 330 || sy == 350 ||
							sy == 370 || sy == 390 || sy == 410 || sy == 430 || sy == 450)) //Renglones
					begin 
						{color_R,color_G,color_B} <= `GRAY;
					end
				else //zona util
					begin
						if(pixel == 1 || pixel2 == 1 || pixel3 == 1 || pixel4 == 1 || pixel5 == 1 
						|| pixel6 == 1 || pixel7 == 1 || pixel8 == 1 || pixel9 == 1 || pixel10 == 1
						|| pixel11 == 1 || pixel12 == 1 || pixel13 == 1 || pixel14 == 1 || pixel15 == 1
						|| pixel16 == 1 || pixel17 == 1 || pixel18 == 1 || pixel19 == 1 || pixel20 == 1) 
						{color_R,color_G,color_B} <= `BLACK;
						else {color_R,color_G,color_B} <= `WHITE;
					end
			end
		end

	
	assign o_hsync = (0 <= sx && sx <96) ? 1:0;
	assign o_vsync = (0 <= sy && sy <2) ? 1:0;
	
	assign VGA_CLK_OUT = VGA_CLK_IN;
	
	assign out_R = (sx > 144 && sx <= 783 && sy > 35 && sy <= 514)? color_R:8'h00;
	assign out_B = (sx > 144 && sx <= 783 && sy > 35 && sy <= 514)? color_B:8'h00;
	assign out_G = (sx > 144 && sx <= 783 && sy > 35 && sy <= 514)? color_G:8'h00;
	
endmodule