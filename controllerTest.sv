module controllerTest();

logic clk, reset;
logic [31:12] Instr;
logic [3:0] ALUFlags;
logic [1:0] RegSrc;
logic RegWrite;
logic [1:0] ImmSrc;
logic ALUSrc;
logic [1:0] ALUControl;
logic MemWrite, MemtoReg;
logic PCSrc;
logic [31:0] Inst;

controller contr(.clk(clk), .reset(reset), .Instr(Instr), .ALUFlags(ALUFlags),
						.RegSrc(RegSrc), .RegWrite(RegWrite), .ImmSrc(ImmSrc), .ALUSrc(ALUSrc),
						.ALUControl(ALUControl), .MemWrite(MemWrite), .MemtoReg(MemtoReg), .PCSrc(PCSrc));


initial begin
	$display("---------------- DP INSTRUCTION REG ----------------");
		reset=1;
		#10;
		reset=0;
		clk=0;
	
      Inst = 32'hE0855004; // ADD R15, R15, R0      
		Instr=Inst[31:12];
		#100;
			
		
        // ADD IMM
      $display("---------------- DP INSTRUCTION IMM ----------------");
      Inst = 32'hE2802005; // ADD R2, R0, #5
		Instr= Inst[31:12];
      #100;
		
		
		Inst = 32'hE1550003;
		Instr= Inst[31:12];
		#100;
		$stop;
		  
		  
end
always begin
	clk=~clk;#5;
end
endmodule