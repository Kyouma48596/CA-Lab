module sign_extend (
	input [20:0] in,
	output [31:0] out
);

assign out[31:21] = {11{in[20]}};
assign out [20:0] = in;

endmodule