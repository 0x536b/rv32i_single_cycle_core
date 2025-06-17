`define IMEM_FILE "imem.txt"
`define DMEM_FILE "dmem.txt"

module core_tb();
	localparam CLK_PERIOD = 10;

	logic			clk, rst, dmem_we;
	logic	[31:0]	imem_a, imem_rd, dmem_a, dmem_wd, dmem_rd;
	logic	[3:0]	dmem_write_mask;

	core DUT(
		.clk_i(clk), .rst_i(rst),
		.imem_A_o(imem_a), .imem_RD_i(imem_rd),
		.dmem_A_o(dmem_a), .dmem_WD_o(dmem_wd), .dmem_WE_o(dmem_we), .dmem_RD_i(dmem_rd), .dmem_WMASK_o(dmem_write_mask)
	);

	imem instr_mem(.a(imem_a), .rd(imem_rd));
	dmem data_mem(.clk(clk), .we(dmem_we), .a(dmem_a), .wd(dmem_wd), .rd(dmem_rd), .w_mask(dmem_write_mask));


	// clock generator
	always begin
		#(CLK_PERIOD / 2);
		clk <= ~clk;
	end

	// test sequence
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars();
		clk = 0; rst = 0;
		#2;
		rst = 1;
		#10;
		rst = 0;
		#10000;
		$finish;

		// printing for validation
		$display("PC : %h (%D, %D)", DUT.PC, DUT.PC, DUT.PC/4);
		for (int i = 0; i < 32; i++) begin
			$display("RF[%2d] : %h (%D)", i, DUT.rf.rf[i], $signed(DUT.rf.rf[i]));
		end
	end



endmodule: core_tb


/* verilator lint_off WIDTHTRUNC */
// copied from Harris and Harris supplementary material
// replace with better model
module imem(input  logic [31:0] a,
            output logic [31:0] rd);

  logic [31:0] RAM[63:0];

  initial
      $readmemh(`IMEM_FILE, RAM);

  assign rd = RAM[a[31:2]]; // word aligned
endmodule

module dmem(
	input  	logic        	clk, we,
    input  	logic 	[31:0] 	a, wd,
    output 	logic 	[31:0] 	rd,
	output	logic	[3:0]	w_mask
);

  logic [31:0] RAM[63:0];
  initial
	$readmemh(`DMEM_FILE,RAM);

  assign rd = RAM[a[31:2]]; // word aligned

  always_ff @(posedge clk)
    if (we) begin
		if (w_mask[0]) RAM[a[31:2]][7:0] <= wd[7:0];
		if (w_mask[1]) RAM[a[31:2]][15:8] <= wd[15:8];
		if (w_mask[2]) RAM[a[31:2]][23:16] <= wd[23:16];
		if (w_mask[3]) RAM[a[31:2]][31:24] <= wd[31:24];
	end
endmodule
/* verilator lint_on WIDTHTRUNC */
