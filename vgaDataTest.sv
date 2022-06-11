module vgaDataTest();

	logic [7:0] salida[300:0];
	logic clk;
	logic clk2;
   vgaData ram(clk2,
		salida
   );
	 
	 
	always begin
		clk2=~clk2;#10;
	end
	  initial begin
			clk2=0;
	 // ROM
        clk=0;
		  #200
		  clk=1;
		  #200
		  clk=0;
		  #200
		  clk=1;
		  #200
        $stop;
	 end
	 
endmodule