module mux2to1 (
	input [31:0] in1,
	input [31:0] in2,
	output [31:0] q,
	input sel
);

assign q = sel ? in2 : in1;

endmodule