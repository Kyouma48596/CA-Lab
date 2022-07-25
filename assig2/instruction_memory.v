module instruction_memory (
	input [7:0] PC,
	input reset,
	output [7:0] instruction_code
);

reg [7:0]mem[7:0];

assign instruction_code = mem[PC];

always @(reset) begin 
	if(!reset) begin 
		mem[0] = 8'b00_000_011;
		mem[1] = 8'b01_101_000;
		mem[2] = 8'b01_011_101;
		mem[3] = 8'b11_000001;
		mem[4] = 8'b00_011_100;
		mem[5] = 8'b01_000_011;
    end
end

endmodule