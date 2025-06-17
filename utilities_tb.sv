module ff_r_tb();
	localparam WIDTH = 32;
	localparam CLK_PERIOD = 10;
	logic				clk, rst;
	logic	[WIDTH-1:0]	d, q;

	ff_r #(.WIDTH(WIDTH)) DUT(.*);

	// clock generator
	always begin
		clk <= ~clk;
		#(CLK_PERIOD / 2);
	end

	// test sequence
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars();
		clk = 0; d = 32'd0;
		#2; d = 32'd123123;
		#2; clk = 1;
		rst = 0; #5; rst = 1; #10; rst = 0; #10;
		d = 234232234; #10;
		d = 23422124; #10;
		d = 134234; #10;
		$finish;
	end
	
endmodule: ff_r_tb

/*
// Testbench for the simple parameterized flip-flop
module ff_tb;

    // Parameters
    localparam WIDTH = 8;
    localparam CLK_PERIOD = 10; // Clock period in ns

    // Testbench signals
    logic               clk;
    logic               rst;
    logic   [WIDTH-1:0] d;
    logic   [WIDTH-1:0] q;

    // Instantiate the module under test (DUT)
    // We connect the testbench signals to the DUT ports.
    ff #(
        .WIDTH(WIDTH)
    ) dut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    // Clock generator
    // This always block creates a clock signal with a 50% duty cycle
    // and a period defined by CLK_PERIOD.
    always begin
        clk = 1'b0;
        #(CLK_PERIOD / 2);
        clk = 1'b1;
        #(CLK_PERIOD / 2);
    end

    // Test sequence
    // This initial block defines the stimulus for the DUT.
    initial begin
        // 1. Initialize signals
        rst = 1'b1; // Start in reset state
        d   = '0;

        $display("Time=%0t ns: --- Starting Simulation ---", $time);
        $display("Time=%0t ns: Applying reset.", $time);

        // 2. Apply reset for a few clock cycles
        repeat (2) @(posedge clk);
        rst = 1'b0;
        $display("Time=%0t ns: Releasing reset.", $time);

        @(posedge clk);

        // 3. Drive random data
        $display("Time=%0t ns: Driving random data.", $time);
        for (int i = 0; i < 10; i++) begin
            d = $urandom_range(0, 2**WIDTH - 1);
            @(posedge clk);
            $display("Time=%0t ns: d=0x%h, q=0x%h", $time, d, q);
        end

        // 4. Test reset again
        $display("Time=%0t ns: Applying reset again.", $time);
        rst = 1'b1;
        @(posedge clk);
        $display("Time=%0t ns: d=0x%h, q=0x%h (after reset)", $time, d, q);

        @(posedge clk);
        rst = 1'b0;

        // 5. End simulation
        $display("Time=%0t ns: --- Simulation Finished ---", $time);
        $finish;
    end

    // Monitor to display changes in signals
    // This block will print the values whenever q changes.
    initial begin
      $monitor("Time=%0t ns: [Monitor] q changed to 0x%h", $time, q);
    end

endmodule: ff_tb

*/