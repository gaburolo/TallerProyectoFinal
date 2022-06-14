module topARMTest();

    logic        clk;
    logic        reset;
    logic [31:0] WriteData, DataAdr;
    logic        MemWrite;
    logic [7:0]  chars [639:0];

    topARM cpu(
        clk,
        reset,
        WriteData,
        DataAdr,
        MemWrite
    );
	 
	 logic [31:0] i;

    // Initialize test
	initial
	begin
		reset <= 1; # 22; reset <= 0;
		clk <= 0; # 5;
	end
		  

    
	always begin
		clk=~clk;#5;
	end
endmodule