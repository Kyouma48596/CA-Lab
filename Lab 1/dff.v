module dff (
	input clk,    // Clock
	input D,
	input rst,
	output _q,
	output reg q
);
	assign _q = ~q;
	always @(posedge clk or negedge rst) begin 
		if(!rst) q<=0;
		else q<=D;
	end

endmodule