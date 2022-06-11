module dataMemTest();

   logic        clk, we;
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
	  initial begin
	 // ROM
        we = 0;
        data_in = 8'bx;
        
		// Muestra el valor de la linea 5
        clk = 0;
        we = 0;
        address = 32'h010;
		  #20
		  
        // Write
		  //Escribe en la linea 5 un 27 hexadecimal
        clk = 1;
		  address = 32'h010;
        data_in = 32'h27;
        we = 1;
        #20
		  
		  // Read
        clk = 0;#20
		  clk = 1;#20
		  clk = 0;
		  we = 0;
        #20

        //Muestra el valor de la fila 1
        clk = 1;
        we = 0;
        address = 32'h0;
        #20
		
		  clk = 0;
		  #20
		  
		  //Muestra el valor de la fila 2
		  clk = 1;
        we = 0;
        address = 32'h04;
        #20
		  clk = 0;
		  #20
		  
		  //Verifica la posicion modificada
		  clk = 1;
        we = 0;
        address = 32'h10;#20
		  clk=0;
		  #20
        $stop;
	 end
	 
endmodule