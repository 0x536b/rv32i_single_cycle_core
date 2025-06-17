// Simple parameterized flip-flop with reset signal and enable single
module ff_r_en
#(parameter WIDTH=8)
(
	input	logic				clk, rst, en,
	input	logic	[WIDTH-1:0]	d,
	output	logic	[WIDTH-1:0] q
);
	always_ff @(posedge clk or posedge rst) begin
		if (rst) q <= 0;
		else if (en) q <= d;
	end

endmodule: ff_r_en

// Simple parameterized flip-flop with asyn reset signal
module ff_r
#(parameter WIDTH=8)
(
	input	logic				clk, rst,
	input	logic	[WIDTH-1:0]	d,
	output	logic	[WIDTH-1:0] q
);
	always_ff @(posedge clk or posedge rst) begin
		if (rst) q <= 0;
		else q <= d;
	end

endmodule: ff_r


// simple parameterized flip-flop
module ff
#(parameter WIDTH=8)
(
	input	logic				clk,
	input	logic	[WIDTH-1:0]	d,
	output	logic	[WIDTH-1:0] q
);
	always_ff @(posedge clk) begin
		if (rst) q <= 0;
		else q <= d;
	end

endmodule: ff
