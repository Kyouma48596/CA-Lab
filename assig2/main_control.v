module main_control (
	input rst,
	input [1:0] opcode,
	output reg [3:0] ALUop,
	output reg RegWrite,
	output reg ImmLoad,
	output reg JumpPC
);

always @(*) begin
	if(!rst) begin
		ALUop <= 4'bx;
		RegWrite <= 1'b0;
		ImmLoad <= 1'b0;
		JumpPC <= 1'b0;
	end

	else begin
		case(opcode)
			2'b01: begin //add
				ALUop = 4'b0010;
				RegWrite = 1;
				ImmLoad = 0;
				JumpPC = 0;
			end

			2'b00: begin //load imm
				ALUop = 4'bx;
				RegWrite = 1;
				ImmLoad = 1;
				JumpPC = 0;
			end

			2'b11: begin // jump
				ALUop = 4'b0010; 
				RegWrite = 0;
				ImmLoad = 0;
				JumpPC = 1;
			end
		endcase
	end

end



endmodule