module PC (
	input [31:0] PC_in,
	output [31:0] PC_out,
	input clk,
	input rst
);

reg [31:0] PC;

always @(posedge clk or negedge rst) begin 
	if(!rst) begin 
		PC<=0;
	end
	else begin 
		PC <= PC_in;
	end
end

assign PC_out = PC;

endmodule