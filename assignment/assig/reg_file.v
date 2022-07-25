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
	output [31:0] regfile_out_r0,
	output [31:0] regfile_out_r4,
	output [31:0] regfile_out_r8,
	output [31:0] regfile_out_r9,
	output [31:0] regfile_out_r11,
	output [31:0] regfile_out_r13,
	output [31:0] regfile_out_r10
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

assign regfile_out_r0 = regfile[0];
assign regfile_out_r4 = regfile[4];
assign regfile_out_r8 = regfile[8];
assign regfile_out_r9 = regfile[9];
assign regfile_out_r11 = regfile[11];
assign regfile_out_r13 = regfile[13];
assign regfile_out_r10 = regfile[10];
endmodule