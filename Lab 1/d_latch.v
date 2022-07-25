module d_latch (
	input En,
	input D,
	input rst,
	output q, _q
);

	wire w1, w2, _D;
	not (_D, D);
	nand (w1, D, En);
	nand (w2, _D, En);
	nand (q, w1, _q);
	nand(_q, w2, q);

endmodule