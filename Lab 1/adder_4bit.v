module adder_4bit (
	input [3:0] A,
	input [3:0] B,
	input Cin,
	output [3:0] S,
	output Cout
);
	wire C0, C1, C2;
	adder_1bit A0 (A[0], B[0], Cin, S[0], C0);
	adder_1bit A1 (A[1], B[1], C0, S[1], C1);
	adder_1bit A2 (A[2], B[2], C1, S[2], C2);
	adder_1bit A3 (A[3], B[3], C2, S[3], Cout);

endmodule