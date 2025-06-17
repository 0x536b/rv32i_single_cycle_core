`include "utilities.sv"

// Naming conventions are consistent with DDCA book by Harris and Harris
// RISC-V edition

module core (
	input	logic			clk_i, rst_i,

	// ports for external instruction memory
	output	logic	[31:0]	imem_A_o,	
	input	logic	[31:0]	imem_RD_i,

	// ports for external data memory
	output	logic	[31:0]	dmem_A_o, dmem_WD_o, 
	output	logic			dmem_WE_o,
	output	logic	[3:0]	dmem_WMASK_o,
	input	logic	[31:0]	dmem_RD_i
);
	// Instruction from imem
	logic	[31:0]	Instr;
	logic	[6:0]	Instr_opcode;
	logic	[2:0]	Instr_funct3;
	logic	[6:0]	Instr_funct7;	
	assign Instr = imem_RD_i;

	// Control Unit
	logic			RegWrite, MemWrite, ALUSrc;
	logic	[1:0]	PCSrc;
	logic	[2:0]	ResultSrc;
	logic	[3:0]	ALUControl;
	logic	[2:0]	ImmSrc;
	logic	[2:0] 	dmem_load_sel;
	logic	[1:0]	dmem_store_sel;
	// assign ImmSrc = 3'b000;
	control_unit CU(
		.*
	);

	// 32-bit register for Program Counter (PC)
	logic	[31:0]	PCNext, PC, PCPlus4, PCTarget;
	ff_r #(.WIDTH(32)) pc_reg(.clk(clk_i), .rst(rst_i), .d(PCNext), .q(PC));
	adder pc_plus4_adder(.a(PC), .b(32'd4), .cin(1'b0), .sum(PCPlus4), .cout());
	adder pc_target_adder(.a(PC), .b(ImmExt), .cin(1'b0), .sum(PCTarget), .cout());

	// assign PCNext = (PCSrc) ? PCTarget : PCPlus4;
	always_comb begin
		case (PCSrc)
			2'b00: PCNext = PCPlus4;
			2'b01: PCNext = PCTarget;
			2'b10: PCNext = ALUResult;
			2'b11: PCNext = PC;
			default : PCNext = PCPlus4;
		endcase
	end
	
	assign imem_A_o = PC;
	

	// Data from dmem
	logic	[31:0] ReadData, WriteData, ReadData_byte_signed, ReadData_byte_unsigned, ReadData_half_signed, ReadData_half_unsigned, ReadData_raw;
	logic	[3:0]	WriteMask;
	assign dmem_A_o = ALUResult;
	assign ReadData_raw = dmem_RD_i;
	assign dmem_WD_o = WriteData;
	assign dmem_WE_o = MemWrite;
	assign dmem_WMASK_o = WriteMask;
	
	// select the wanted byte and half-word
	logic [15:0] ReadData_wanted_halfword;
	logic [7:0] ReadData_wanted_byte;
	assign ReadData_wanted_halfword = dmem_A_o[1] ? ReadData_raw[31:16] : ReadData_raw[15:0];
	assign ReadData_wanted_byte = dmem_A_o[0] ? ReadData_wanted_halfword[15:8] : ReadData_wanted_halfword[7:0];

	assign ReadData_byte_signed 	= {{24{ReadData_wanted_byte[7]}}, ReadData_wanted_byte};
	assign ReadData_byte_unsigned 	= {{24{1'b0}}, ReadData_wanted_byte[7:0]};
	assign ReadData_half_signed		= {{16{ReadData_wanted_halfword[15]}}, ReadData_wanted_halfword};
	assign ReadData_half_unsigned	= {{16{1'b0}}, ReadData_wanted_halfword};

	always_comb begin
		case (dmem_load_sel)
			3'b000: ReadData = ReadData_byte_signed;
			3'b001: ReadData = ReadData_half_signed;
			3'b010: ReadData = ReadData_raw;
			3'b011: ReadData = ReadData_byte_unsigned;
			3'b100: ReadData = ReadData_half_unsigned;
			default: ReadData = 32'd0;
		endcase
	end
	always_comb begin
		case (dmem_store_sel)
			2'b00 : begin
				// WriteData = {{24{1'b0}}, rf_RD2[7:0]};
				// WriteMask = 4'b0001;

				case (dmem_A_o[1:0])
					2'b00 : begin
						WriteMask = 4'b0001;
						WriteData = {{24{1'b0}}, rf_RD2[7:0]};
					end

					2'b01 : begin
						WriteMask = 4'b0010;
						WriteData = {{16{1'b0}}, rf_RD2[7:0], {8{1'b0}}};
					end

					2'b10 : begin
						WriteMask = 4'b0100;
						WriteData = {{8{1'b0}}, rf_RD2[7:0], {16{1'b0}}};
					end

					2'b11 : begin
						WriteMask = 4'b1000;
						WriteData = {rf_RD2[7:0], {24{1'b0}}};
					end
				endcase
			end
			
			2'b01 : begin
				WriteData = {{16{1'b0}}, rf_RD2[15:0]};
				WriteMask = 4'b0011;

				case (dmem_A_o[1])
					1'b0: begin
						WriteData = {{16{1'b0}}, rf_RD2[15:0]};
						WriteMask = 4'b0011;
					end

					1'b1: begin
						WriteData = {rf_RD2[15:0], {16{1'b0}}};
						WriteMask = 4'b1100;
					end
				endcase
			end			
			
			2'b10 : begin
				WriteData = rf_RD2;
				WriteMask = 4'b1111;
			end			
			
			default : begin
				WriteData = 32'd0;
				WriteMask = 4'b0000;
			end
		endcase
	end


	// instantiate register file
	logic	[4:0]	rf_A1, rf_A2, rf_A3;
	logic			rf_WE3;
	logic	[31:0]	rf_WD3, rf_RD1, rf_RD2;
	regfile_n #(.N(32)) rf(.clk(clk_i), .rst(rst_i), .WE3(rf_WE3), .A1(rf_A1), .A2(rf_A2), .A3(rf_A3), .WD3(rf_WD3), .RD1(rf_RD1), .RD2(rf_RD2));
	assign rf_A1 = Instr[19:15];
	assign rf_A2 = Instr[24:20];
	assign rf_A3 = Instr[11:7];
	assign rf_WE3 = RegWrite;

	// 000 ALUResult
	// 001 ReadData from dmem
	// 010 PCPlus4
	// 011 Imm value
	// 100 PCTarget
	// assign rf_WD3 = (ResultSrc[1]) ? PCPlus4 : (ResultSrc[0] ? ReadData : ALUResult);
	always_comb begin
		case (ResultSrc)
			3'b000 : rf_WD3 = ALUResult;
			3'b001 : rf_WD3 = ReadData;
			3'b010 : rf_WD3 = PCPlus4;
			3'b011 : rf_WD3 = ImmExt;
			3'b100 : rf_WD3 = PCTarget;
			default : rf_WD3 = 32'd0;
		endcase
	end
	


	// Immediate Extension 
	logic	[31:0]	ImmExt;
	ImmExtend imm_ext(.ImmSrc(ImmSrc), .Instr(Instr), .ImmExtended(ImmExt));

	// ALU Instantiation
	logic	[31:0]	SrcA, SrcB, ALUResult;
	logic			alu_v, alu_c, alu_n, alu_z; // overflow, carry, negative, zero
	ALU alu1(
		.SrcA(SrcA), .SrcB(SrcB), 
		.ALUControl(ALUControl), .ALUResult(ALUResult), 
		.overflow(alu_v), .carry(alu_c), .negative(alu_n), .zero(alu_z));
	assign SrcA = rf_RD1;
	assign SrcB = (ALUSrc) ? ImmExt : rf_RD2;



endmodule: core

module control_unit (
		input 	logic	[31:0]	Instr,
		input	logic	[31:0]	ALUResult,
		input 	logic			alu_c, alu_z, alu_v, alu_n,
		output	logic	[1:0]	PCSrc,
		output	logic	[2:0]	ResultSrc,
		output	logic			MemWrite,
		output	logic	[3:0]	ALUControl,
		output	logic			ALUSrc,
		output	logic	[2:0]	ImmSrc,
		output	logic	[2:0] 	dmem_load_sel,
		output	logic	[1:0]	dmem_store_sel,
		output	logic			RegWrite
);
	logic	[6:0]	op, funct7;
	logic	[2:0]	funct3;
	assign op 		= Instr[6:0];
	assign funct3 	= Instr[14:12];
	assign funct7 	= Instr[31:25];

	localparam OP_R_TYPE 		= 7'b0110011; // R-type
	localparam OP_I_TYPE 		= 7'b0010011; // I-Type
	localparam OP_I_LOAD_TYPE 	= 7'b0000011; // I-Type, loads
	localparam OP_S_TYPE 		= 7'b0100011; // S-Type
	localparam OP_B_TYPE 		= 7'b1100011; // B-Type
	localparam OP_J_JAL_TYPE 	= 7'b1101111; // JAL
	localparam OP_I_JALR_TYPE 	= 7'b1100111; // JALR
	localparam OP_U_LUI_TYPE 	= 7'b0110111; // LUI
	localparam OP_U_AUIPC_TYPE 	= 7'b0010111; // AUIPC
	localparam OP_I_SYSTEM_TYPE = 7'b1110011; // ECALL, EBREAK
	localparam OP_FENCE_TYPE 	= 7'b0001111; // FENCE

	localparam ALU_ADD	=	4'b0000;
	localparam ALU_SUB	=	4'b0001;
	localparam ALU_AND	=	4'b0010;
	localparam ALU_OR	=	4'b0011;
	localparam ALU_XOR	=	4'b0100;
	localparam ALU_SLT	=	4'b0101;
	localparam ALU_SLL	=	4'b0110;
	localparam ALU_SRL	=	4'b0111;
	localparam ALU_SRA 	= 	4'b1000;
	localparam ALU_SLTU = 	4'b1001;

	localparam IMM_DONT_CARE = 3'b000;
	localparam IMM_I = 3'b000;
	localparam IMM_S = 3'b001;
	localparam IMM_B = 3'b010;
	localparam IMM_U = 3'b011;
	localparam IMM_J = 3'b100;

	localparam DMEM_LOAD_BYTE = 3'b000;
	localparam DMEM_LOAD_HALF = 3'b001;
	localparam DMEM_LOAD_WORD = 3'b010;
	localparam DMEM_LOAD_BYTE_UNSIGNED = 3'b011;
	localparam DMEM_LOAD_HALF_UNSIGNED = 3'b100;

	localparam DMEM_STORE_BYTE = 2'b00;
	localparam DMEM_STORE_HALF = 2'b01;
	localparam DMEM_STORE_WORD = 2'b10;

	localparam PC_SRC_PLUS4 = 2'b00;
	localparam PC_SRC_IMM_TARGET = 2'b01;
	localparam PC_SRC_ALU_RESULT = 2'b10;
	localparam PC_SRC_PC = 2'b11;

		// 000 ALUResult
	// 001 ReadData from dmem
	// 010 PCPlus4
	// 011 Imm value
	// 100 PCTarget
	localparam RESULT_ALU 		= 3'b000;
	localparam RESULT_DMEM 		= 3'b001;
	localparam RESULT_PCPlus4 	= 3'b010;
	localparam RESULT_IMM 		= 3'b011;
	localparam RESULT_PCTarget 	= 3'b100;

	always_comb begin
		case (op)
			OP_R_TYPE : begin
				PCSrc 		= 2'b00; // PC+4 or PCTarget
				RegWrite 	= 1'b1; // write to register ?
				ImmSrc 		= IMM_DONT_CARE;
				ALUSrc 		= 1'b0; // Register or ImmExt
				MemWrite 	= 1'b0; // Write to data memory ?
				ResultSrc 	= RESULT_ALU; // 00ALU's res, 01 data frm dmem, 10 PC's val

				case ({funct3, funct7[5]})
					{3'b000, 1'b0} : ALUControl = ALU_ADD;
					{3'b000, 1'b1} : ALUControl = ALU_SUB;
					{3'b100, 1'b0} : ALUControl = ALU_XOR;
					{3'b110, 1'b0} : ALUControl = ALU_OR;
					{3'b111, 1'b0} : ALUControl = ALU_AND;
					{3'b001, 1'b0} : ALUControl = ALU_SLL;
					{3'b101, 1'b0} : ALUControl = ALU_SRL;
					{3'b101, 1'b1} : ALUControl = ALU_SRA;
					{3'b010, 1'b0} : ALUControl = ALU_SLT;
					{3'b011, 1'b0} : ALUControl = ALU_SLTU;
					default: ALUControl = ALU_ADD;
				endcase
			end 

			OP_I_TYPE : begin
				logic [11:0] imm_11_0;
				assign imm_11_0 = Instr[31:20];

				PCSrc 		= 2'b00; // PC+4 or PCTarget
				RegWrite 	= 1'b1; // write to register ?
				ImmSrc 		= IMM_I;
				ALUSrc 		= 1'b1; // Register or ImmExt
				MemWrite 	= 1'b0; // Write to data memory ?
				ResultSrc 	= RESULT_ALU; // 00ALU's res, 01 data frm dmem, 10 PC's val

				case ({funct3})
					{3'b000} : ALUControl = ALU_ADD;
					{3'b100} : ALUControl = ALU_XOR;
					{3'b110} : ALUControl = ALU_OR;
					{3'b111} : ALUControl = ALU_AND;
					{3'b001} : if (imm_11_0[11:5] == 7'd0) ALUControl = ALU_SLL;

					{3'b101} : begin
						if (imm_11_0[11:5] == 7'd0) ALUControl = ALU_SRL;
						else if (imm_11_0[11:5] == 7'b0100000) ALUControl = ALU_SRA;
						else ALUControl = ALU_ADD;
					end 
					
					
					{3'b010} : ALUControl = ALU_SLT;
					{3'b011} : ALUControl = ALU_SLTU;
				endcase
			end

			OP_I_LOAD_TYPE : begin
				PCSrc 		= 2'b00; // PC+4 or PCTarget
				RegWrite 	= 1'b1; // write to register ?
				ImmSrc 		= IMM_I;
				ALUSrc 		= 1'b1; // Register or ImmExt
				MemWrite 	= 1'b0; // Write to data memory ?
				ResultSrc 	= RESULT_DMEM; // 00ALU's res, 01 data frm dmem, 10 PC's val
				ALUControl 	= ALU_ADD; 

				case ({funct3})
					{3'b000} : dmem_load_sel = DMEM_LOAD_BYTE;
					{3'b001} : dmem_load_sel = DMEM_LOAD_HALF;
					{3'b010} : dmem_load_sel = DMEM_LOAD_WORD;
					{3'b100} : dmem_load_sel = DMEM_LOAD_BYTE_UNSIGNED;
					{3'b101} : dmem_load_sel = DMEM_LOAD_HALF_UNSIGNED;
					default: dmem_load_sel = DMEM_LOAD_WORD;
				endcase
			end

			OP_S_TYPE : begin
				PCSrc 		= 2'b00; // PC+4 or PCTarget
				RegWrite 	= 1'b0; // write to register ?
				ImmSrc 		= IMM_S;
				ALUSrc 		= 1'b1; // Register or ImmExt
				MemWrite 	= 1'b1; // Write to data memory ?
				ResultSrc 	= RESULT_ALU; // 00ALU's res, 01 data frm dmem, 10 PC's val
				ALUControl 	= ALU_ADD; 
				case ({funct3})
					3'b000: dmem_store_sel = DMEM_STORE_BYTE;
					3'b001: dmem_store_sel = DMEM_STORE_HALF;
					3'b010: dmem_store_sel = DMEM_STORE_WORD;
					default: dmem_store_sel = 2'b11;
				endcase
				
			end

			OP_B_TYPE : begin
				// PCSrc 		= 1'b1; // PC+4 or PCTarget
				RegWrite 	= 1'b0; // write to register ?
				ImmSrc 		= IMM_B;
				ALUSrc 		= 1'b0; // Register or ImmExt
				MemWrite 	= 1'b0; // Write to data memory ?
				ResultSrc 	= RESULT_ALU; // 00ALU's res, 01 data frm dmem, 10 PC's val
				// ALUControl 	= ; 
				
				case (funct3)
					3'b000: begin // BEQ
						ALUControl = ALU_SUB;
						if (alu_z) 
							PCSrc = 2'b01;
						else
							PCSrc = 2'b00;
					end

					3'b001: begin // BNE
						ALUControl = ALU_SUB;
						if (!alu_z) 
							PCSrc = 2'b01;
						else
							PCSrc = 2'b00;
					end

					3'b100: begin // BLT
						ALUControl = ALU_SLT;
						if (ALUResult[0] == 1'b1)
							PCSrc = 2'b01;
						else
							PCSrc = 2'b00;
					end

					3'b101: begin // BGE
						ALUControl = ALU_SLT;
						if (ALUResult[0] == 1'b0)
							PCSrc = 2'b01;
						else
							PCSrc = 2'b00;
					end 

					3'b110: begin // BLTU
						ALUControl = ALU_SLTU;
						if (ALUResult[0] == 1'b1)
							PCSrc = 2'b01;
						else
							PCSrc = 2'b00;
					end

					3'b111: begin // BGEU
						ALUControl = ALU_SLTU;
						if (ALUResult[0] == 1'b0)
							PCSrc = 2'b01;
						else
							PCSrc = 2'b00;
					end
					default: begin
						ALUControl = ALU_ADD;
						PCSrc = 2'b00;
					end

				endcase
				
			end

			OP_J_JAL_TYPE : begin
				PCSrc 		= 2'b01; // PC+4 or PCTarget
				RegWrite 	= 1'b1; // write to register ? // rd = PC+4
				ImmSrc 		= IMM_J;
				ALUSrc 		= 1'b0; // Register or ImmExt // Doesnt matter
				MemWrite 	= 1'b0; // Write to data memory ?
				ResultSrc 	= RESULT_PCPlus4; // 00ALU's res, 01 data frm dmem, 10 PC's val
				ALUControl 	= ALU_ADD; 
			end

			OP_I_JALR_TYPE : begin
				PCSrc 		= 2'b10; // PC+4 or PCTarget
				RegWrite 	= 1'b1; // write to register ? // rd = PC+4
				ImmSrc 		= IMM_I;
				ALUSrc 		= 1'b1; // Register or ImmExt // PC = rs1 + imm
				MemWrite 	= 1'b0; // Write to data memory ?
				ResultSrc 	= RESULT_PCPlus4; // 00ALU's res, 01 data frm dmem, 10 PC's val
				ALUControl 	= ALU_ADD; 
			end

			OP_U_LUI_TYPE : begin
				PCSrc 		= 2'b00; // PC+4 or PCTarget or ALUResult
				RegWrite 	= 1'b1; // write to register ? // rd = PC+4
				ImmSrc 		= IMM_U;
				ALUSrc 		= 1'b1; // Register or ImmExt // PC = rs1 + imm
				MemWrite 	= 1'b0; // Write to data memory ?
				ResultSrc 	= RESULT_IMM; // 00ALU's res, 01 data frm dmem, 10 PC's val
				ALUControl 	= ALU_ADD; 			
			end

			OP_U_AUIPC_TYPE : begin
				PCSrc 		= 2'b00; // PC+4 or PCTarget or ALUResult
				RegWrite 	= 1'b1; // write to register ? // rd = PC+4
				ImmSrc 		= IMM_U;
				ALUSrc 		= 1'b1; // Register or ImmExt // PC = rs1 + imm
				MemWrite 	= 1'b0; // Write to data memory ?
				ResultSrc 	= RESULT_PCTarget; // 00ALU's res, 01 data frm dmem, 10 PC's val
				ALUControl 	= ALU_ADD; 
			end

			OP_I_SYSTEM_TYPE : begin
				PCSrc 		= PC_SRC_PC; // PC+4 or PCTarget or ALUResult or PC(stay in the same instruction, infinite loop)
				RegWrite 	= 1'b0; // write to register ? // rd = PC+4
				ImmSrc 		= IMM_I;
				ALUSrc 		= 1'b0; // Register or ImmExt // PC = rs1 + imm
				MemWrite 	= 1'b0; // Write to data memory ?
				ResultSrc 	= RESULT_ALU; // 00ALU's res, 01 data frm dmem, 10 PC's val
				ALUControl 	= ALU_ADD; 
			end

			default: begin
				PCSrc 		= 2'b00; // PC+4 or PCTarget or ALUResult
				RegWrite 	= 1'b0; // write to register ? // rd = PC+4
				ImmSrc 		= IMM_I;
				ALUSrc 		= 1'b0; // Register or ImmExt // PC = rs1 + imm
				MemWrite 	= 1'b0; // Write to data memory ?
				ResultSrc 	= RESULT_ALU; // 00ALU's res, 01 data frm dmem, 10 PC's val
				ALUControl 	= ALU_ADD; 
			end
		endcase
	end




endmodule: control_unit



// ALU : H&H DDCA book, pg 250, table 5.3, RISC edition
// 000 : Add
// 001 : Subtract
// 010 : AND
// 011 : OR
// 100 : XOR
// 101 : SLT // Taking advantage that adder performs SUB when ALUControl[0] = 1
// 110 : SLL
// 111 : SRL
module ALU (
	input	logic	[31:0]	SrcA, SrcB,
	input	logic	[3:0]	ALUControl,
	output	logic	[31:0]	ALUResult,
	output	logic			overflow, carry, negative, zero // pg.248, H&H
);

	logic	[31:0]	sum, FinalB;
	logic			cout;
	assign FinalB = (ALUControl[0]) ? ~SrcB : SrcB; // if ALUControl[0] is 1, then we need to SUB, hence NOT of B
	adder adder1(.a(SrcA), .b(FinalB), .cin(ALUControl[0]), .sum(sum), .cout(cout)); // If SUB, Cin should be 1. 

	logic isAddSub; 
	assign isAddSub = (~ALUControl[2] & ~ALUControl[1]) | (~ALUControl[1] & ALUControl[0]);
	
	// Flags
	assign overflow = (isAddSub) & ~(ALUControl[0] ^ SrcA[31] ^ SrcB[31]) & (SrcA[31] ^ sum[31]);
	assign carry = ~ALUControl[1] & cout;
	assign negative = ALUResult[31];
	assign zero = ~| ALUResult; // NOR all bits of result. If 1, then result == 0

	// Final output MUX
	always_comb begin
		case (ALUControl)
			4'b0000: ALUResult = sum;
			4'b0001: ALUResult = sum;
			4'b0010: ALUResult = SrcA & SrcB;
			4'b0011: ALUResult = SrcA | SrcB;
			4'b0100: ALUResult = SrcA ^ SrcB;
			4'b0101: ALUResult = {{31{1'b0}}, (sum[31] ^ overflow)};
			4'b0110: ALUResult = SrcA << SrcB[4:0];
			4'b0111: ALUResult = SrcA >> SrcB[4:0];
			4'b1000: ALUResult = $signed(SrcA) >>> SrcB[4:0];
			4'b1001: ALUResult = {{31{1'b0}}, ($unsigned(SrcA) < $unsigned(SrcB))};
			default: ALUResult = 32'bx;
		endcase
	end
endmodule: ALU

// Adder
module adder (
	input	logic	[31:0] 	a, b,
	input	logic			cin,
	output	logic	[31:0]	sum,
	output	logic			cout
);
	assign {cout, sum} = a + b + {31'd0, cin};
endmodule: adder

// Immediate extending unit
// I, S, B, U, J type instructions have immediate components
// Check Chapter2-Immediate encoding variants in risv-unprivileged.pdf
// ImmSrc = check the case statement
module ImmExtend (
	input	logic	[2:0]	ImmSrc,
	input	logic	[31:0]	Instr,
	output	logic	[31:0]	ImmExtended
);
	logic	[31:0]	ImmI, ImmS, ImmB, ImmU, ImmJ;
	
	assign ImmI = {	{21{Instr[31]}}, Instr[30:20] };
	assign ImmS = {	{21{Instr[31]}}, Instr[30:25], Instr[11:7] };
	assign ImmB = {	{20{Instr[31]}}, Instr[7], Instr[30:25], Instr[11:8], 1'b0 };
	assign ImmU = {	Instr[31:12], {12{1'b0}} };
	assign ImmJ = {	{12{Instr[31]}}, Instr[19:12], Instr[20], Instr[30:21], 1'b0 };

	always_comb begin
		unique case(ImmSrc)
			3'b000: ImmExtended = ImmI;
			3'b001: ImmExtended = ImmS;
			3'b010: ImmExtended = ImmB;
			3'b011: ImmExtended = ImmU;
			3'b100: ImmExtended = ImmJ;
			default: ImmExtended = 32'd0;
		endcase
	end

endmodule: ImmExtend

// 32xN Register File
// 3x address ports, 2x read ports, 1x data_write port, write_enable input
module regfile_n #(parameter N=32) (
	input	logic			clk, rst, WE3,
	input	logic	[4:0]	A1, A2, A3,
	input	logic	[31:0]	WD3,
	output	logic	[31:0]	RD1, RD2
);
	logic	[31:0]	rf[N-1:0];

	// write data on the clock edge
	always_ff @(posedge clk or posedge rst)
		if (rst)
			for(int i = 0; i < N; i++)
				rf[i] <= 32'd0;
		else if (WE3)
			rf[A3] <= (A3 != 0) ? WD3 : 32'd0; // unnecessary, but doing it for simulation purposes.

	// combinationally readout the two register data
	// register 0 hardwired to 0
	assign RD1 = (A1 != 0) ? rf[A1] : 0;
	assign RD2 = (A2 != 0) ? rf[A2] : 0;

endmodule: regfile_n
