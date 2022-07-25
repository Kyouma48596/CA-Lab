module multiplexer_4_1 (
	input [3:0] in,
	input [1:0] sel,
	output q
);

	assign q = in[sel];

endmodule