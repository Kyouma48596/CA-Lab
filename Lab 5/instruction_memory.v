module instruction_memory (
	input [31:0] PC,
	input reset,
	output [31:0] instruction_code
);

reg [7:0]mem[36:0];

assign instruction_code = {mem[PC+3], mem[PC+2], mem[PC+1], mem[PC+0]};

always @(reset) begin 
	if(!reset) begin 
		mem[3] = 8'h01; mem[2] = 8'h49; mem[1] = 8'h83; mem[0] = 8'h33;
		mem[7] = 8'h02; mem[6] = 8'h73; mem[5] = 8'h04; mem[4] = 8'h33;
		mem[11] = 8'h41; mem[10] = 8'hff; mem[9] = 8'h0a; mem[8] = 8'h33;
		mem[15] = 8'h00; mem[14] = 8'h63; mem[13] = 8'hfe; mem[12] = 8'h33;
	end
end

endmodule