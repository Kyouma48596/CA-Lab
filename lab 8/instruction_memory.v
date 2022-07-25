module instruction_memory (
	input [31:0] PC,
	input reset,
	output [31:0] instruction_code
);

reg [7:0]mem[36:0];

assign instruction_code = {mem[PC+3], mem[PC+2], mem[PC+1], mem[PC+0]};

always @(reset) begin 
	if(!reset) begin 
		{mem[3],mem[2],mem[1],mem[0]} = 32'h01c38333;
		{mem[7],mem[6],mem[5],mem[4]} = 32'h41c38333;
		{mem[11],mem[10],mem[9],mem[8]} = 32'h01c3f333;
		{mem[15],mem[14],mem[13],mem[12]} = 32'h01c3e333;
		{mem[19],mem[18],mem[17],mem[16]} = 32'h01c39333;
		{mem[23],mem[22],mem[21],mem[20]} = 32'h01c3d333;
	end
end

endmodule