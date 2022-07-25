module main_control (
	input [5:0] opcode,
	input [5:0] funct,
	output reg [3:0] ALUop,
	output reg regWrite,
	output reg Shift,
	output reg ImmSel
);

	always @(*) begin
		case (opcode)
			6'b111111: begin 
				ALUop = 4'h0;
				regWrite = 1;
				Shift = 0;
				ImmSel = 1;
			end

			6'b000000: begin 
				regWrite = 1;
				ImmSel = 0;
				ALUop[0] = (~funct[5] & ~funct[4] & ~funct[3] & ~funct[2] & ~funct[1] & ~funct[0]) | (funct[5] & ~funct[4] & ~funct[3] & funct[2] & ~funct[1] & funct[0]);
				ALUop[1] = (~funct[4] & ~funct[3] & ~funct[2] & funct[1] & ~funct[0]) | (funct[5] & ~funct[4] & ~funct[3] & ~funct[2] & ~funct[0]);
				ALUop[2] = (funct[5] & ~funct[4] & ~funct[3] & ~funct[2] & funct[1] & ~funct[0]);
				ALUop[3] = (~funct[5] & ~funct[4] & ~funct[3] & ~funct[2] & ~funct[0]);
				Shift = ALUop[3];
			end
			default : 	{ALUop, regWrite, Shift, ImmSel} = 0;
		endcase
	end

endmodule