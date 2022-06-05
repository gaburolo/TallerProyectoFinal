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
				else if((330 < sx && sx < 596) && (70 < sy && sy < 470)) //Renglones
					begin 
						if(sy == 90) {color_R,color_G,color_B} <= `GRAY;
						if(sy == 110) {color_R,color_G,color_B} <= `GRAY;
						if(sy == 130) {color_R,color_G,color_B} <= `GRAY;
						if(sy == 150) {color_R,color_G,color_B} <= `GRAY;
						if(sy == 170) {color_R,color_G,color_B} <= `GRAY;
						if(sy == 190) {color_R,color_G,color_B} <= `GRAY;
						if(sy == 210) {color_R,color_G,color_B} <= `GRAY;
						if(sy == 230) {color_R,color_G,color_B} <= `GRAY;
						if(sy == 250) {color_R,color_G,color_B} <= `GRAY;
						if(sy == 270) {color_R,color_G,color_B} <= `GRAY;
						if(sy == 290) {color_R,color_G,color_B} <= `GRAY;
						if(sy == 310) {color_R,color_G,color_B} <= `GRAY;
						if(sy == 330) {color_R,color_G,color_B} <= `GRAY;
						if(sy == 350) {color_R,color_G,color_B} <= `GRAY;
						if(sy == 370) {color_R,color_G,color_B} <= `GRAY;
						if(sy == 390) {color_R,color_G,color_B} <= `GRAY;
						if(sy == 410) {color_R,color_G,color_B} <= `GRAY;
						if(sy == 430) {color_R,color_G,color_B} <= `GRAY;
						if(sy == 450) {color_R,color_G,color_B} <= `GRAY;
					end
				else //zona util
					begin
					{color_R,color_G,color_B} <= `WHITE;
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