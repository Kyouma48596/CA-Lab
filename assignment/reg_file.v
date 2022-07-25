module reg_file (
	input clk,
	input rst,
	input writeReg,
	input [4:0] read_reg_num_1,
	input [4:0] read_reg_num_2,
	input [4:0] write_reg_num,
	input [31:0] write_data,
	output [31:0] read_data_1,
	output [31:0] read_data_2,
	output [31:0] regfile_out
);

reg [31:0] regfile [31:0];
integer i;

//reading block
assign read_data_1 = regfile[read_reg_num_1];
assign read_data_2 = regfile[read_reg_num_2];

//writing block
always @(posedge clk or negedge rst) begin 
	if(!rst) for(i = 0; i<32; i=i+1) regfile[i] <= 32'h1;
	else if (writeReg) begin 
		regfile[write_reg_num] = write_data;
	end
end

assign regfile_out = regfile[11];
endmodule