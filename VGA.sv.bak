module VGA(
	input logic clk,
	output logic [7:0] Red, Green, Blue,
	output logic hsync, vsync, vgaclk);
	
	assign sync=1'b0;
	
	dividerClock cmh(clk, clk2);
	
	logic        we;
   logic [31:0] address;
   logic [7:0]  data_in;
   logic [7:0]  data_out;
	logic  [7:0] chars [639:0];
	
   dataMem ram(
        clk,
        we,
        address,
        data_in,
        data_out,
		  chars
    );
	
	SYNC sync1(
		.VGA_CLK_IN(clk2),
		.txt1({chars[0],chars[1],chars[2],chars[3],chars[4],chars[5],chars[6],chars[7],chars[8],chars[9],chars[10],chars[11],chars[12],chars[13],chars[14],chars[15],chars[16],chars[17],chars[18],chars[19],chars[20],chars[21],chars[22],chars[23],chars[24],chars[25],chars[26],chars[27],chars[28],chars[29],chars[30],chars[31]}),
		.txt2({chars[32],chars[33],chars[34],chars[35],chars[36],chars[37],chars[38],chars[39],chars[40],chars[41],chars[42],chars[43],chars[44],chars[45],chars[46],chars[47],chars[48],chars[49],chars[50],chars[51],chars[52],chars[53],chars[54],chars[55],chars[56],chars[57],chars[58],chars[59],chars[60],chars[61],chars[62],chars[63]}),
		.txt3({chars[64],chars[65],chars[66],chars[67],chars[68],chars[69],chars[70],chars[71],chars[72],chars[73],chars[74],chars[75],chars[76],chars[77],chars[78],chars[79],chars[80],chars[81],chars[82],chars[83],chars[84],chars[85],chars[86],chars[87],chars[88],chars[89],chars[90],chars[91],chars[92],chars[93],chars[94],chars[95]}),
		.txt4({chars[96],chars[97],chars[98],chars[99],chars[100],chars[101],chars[102],chars[103],chars[104],chars[105],chars[106],chars[107],chars[108],chars[109],chars[110],chars[111],chars[112],chars[113],chars[114],chars[115],chars[116],chars[117],chars[118],chars[119],chars[120],chars[121],chars[122],chars[123],chars[124],chars[125],chars[126],chars[127]}),
		.txt5({chars[128],chars[129],chars[130],chars[131],chars[132],chars[133],chars[134],chars[135],chars[136],chars[137],chars[138],chars[139],chars[140],chars[141],chars[142],chars[143],chars[144],chars[145],chars[146],chars[147],chars[148],chars[149],chars[150],chars[151],chars[152],chars[153],chars[154],chars[155],chars[156],chars[157],chars[158],chars[159]}),
		.txt6({chars[160],chars[161],chars[162],chars[163],chars[164],chars[165],chars[134],chars[135],chars[136],chars[137],chars[138],chars[139],chars[140],chars[141],chars[142],chars[143],chars[144],chars[145],chars[146],chars[147],chars[148],chars[149],chars[150],chars[151],chars[152],chars[153],chars[154],chars[155],chars[156],chars[157],chars[158],chars[159]}),
		.txt7(chars[90]),
		.txt8(chars[90]),
		.txt9(chars[90]),
		.txt10(chars[90]),
		.txt11(chars[90]),
		.txt12(chars[90]),
		.txt13(chars[90]),
		.txt14(chars[90]),
		.txt15(chars[90]),
		.txt16(chars[90]),
		.txt17(chars[90]),
		.txt18(chars[90]),
		.txt19(chars[90]),
		.txt20(chars[90]),
		.o_hsync(hsync), 
		.o_vsync(vsync), 
		.VGA_CLK_OUT(vgaclk),
		.out_R(Red),
		.out_B(Blue),
		.out_G(Green)
		);
		
		
endmodule 