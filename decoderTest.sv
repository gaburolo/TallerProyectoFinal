module decoderTest();
 logic [31:0] Inst;

    logic [1:0]  Op;
    logic [5:0]  Funct;
    logic [3:0]  Rd;
    logic [1:0]  FlagW;
    logic        PCS, RegW, MemW, NoWrite;
    logic        MemtoReg, ALUSrc;
    logic [1:0]  ImmSrc, RegSrc;
    logic [2:0]  ALUControl;

    Decoder dec(.Rd(Rd), .Op(Op), .Funct(Funct), .PCS(PCS), 
	 .RegW(RegW), .MemW(MemW), .MemtoReg(MemtoReg), .ALUSrc(ALUSrc),
	 .NoWrite(NoWrite), .ImmSrc(ImmSrc), .FlagW(FlagW), .RegSrc(RegSrc),
	 .ALUControl(ALUControl)
    );

	initial begin

        // ADD REG
        $display("---------------- DP INSTRUCTION REG ----------------");
        Inst = 32'hE0855004; // ADD R15, R15, R0

        Op = Inst[27:26];
        Funct = Inst[25:20];
        Rd = Inst[15:12];
        
		  #100
			
		
        // ADD IMM
        $display("---------------- DP INSTRUCTION IMM ----------------");
        Inst = 32'hE2802005; // ADD R2, R0, #5

        Op = Inst[27:26];
        Funct = Inst[25:20];
        Rd = Inst[15:12];
        #100

        // STR
        $display("---------------- MEMORY STORE INSTR ----------------");
        Inst = 32'hE5802064; // STR R2, [R0, #100]

        Op = Inst[27:26];
        Funct = Inst[25:20];
        Rd = Inst[15:12];
        #100

        // LDR
        $display("---------------- MEMORY LOAD INSTR ----------------");
        Inst = 32'hE5902060; // LDR R2, [R0, #96]

        Op = Inst[27:26];
        Funct = Inst[25:20];
        Rd = Inst[15:12];
        #100

        // B
        $display("---------------- BRANCH INSTRUCTION ----------------");
        Inst = 32'hEA000001; // B END

        Op = Inst[27:26];
        Funct = Inst[25:20];
        Rd = Inst[15:12];
        #100
		  
		  
		  $display("---------------- BRANCH INSTRUCTION ----------------");
		  
		  Inst = 32'h1affffef; //bne		etiqueta
		  Op = Inst[27:26];
        Funct = Inst[25:20];
        Rd = Inst[15:12];
		  #100
        $stop;
		  
		  
	end
endmodule