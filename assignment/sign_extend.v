module sign_extend (
	input [2:0] in,
	output [7:0] out
);

assign out[7:3] = {5{in[2]}};
assign out [2:0] = in;

endmodule