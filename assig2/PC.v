module PC (
	input clk,
	input rst,
	input [7:0] jump_addr_from_ID,
	input JumpPC,
	output reg [7:0]PC
);

always @(posedge clk or negedge rst or JumpPC) begin
	if(!rst) begin
		PC <= 0;
	end

	else if(JumpPC) begin
		PC <= jump_addr_from_ID;
	end // else if(JumpPC)

	else if (!JumpPC) begin
		PC <= PC + 1;
	end
end

endmodule