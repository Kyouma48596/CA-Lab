module main_control (
	input [3:0] funct,
	input [6:0] opcode,
	output [3:0] ALUop,
	output RegWrite
);

assign ALUop[0] = (~funct[3] & ~funct[2] & ~funct[1] & funct[0]) | (~funct[3] & funct[2] & funct[1] & ~funct[0]);
assign ALUop[1] = (~funct[2] & ~funct[1] & ~funct[0]) | (~funct[3] & funct[2] & ~funct[1] & funct[0]);
assign ALUop[2] = (funct[3] & ~funct[2] & ~funct[1] & ~funct[0]);
assign ALUop[3] = (~funct[3] & ~funct[1] & funct[0]);

assign RegWrite = 1;

endmodule