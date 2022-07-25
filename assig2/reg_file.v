module reg_file (
	input clk,
	input rst,
	input writeReg,
	input [2:0] read_reg_num_1, read_reg_num_2,
	input [2:0] write_reg_num,
	input [7:0] write_data,
	output [7:0] read_data_1, read_data_2
);

reg [7:0] regfile [7:0];
integer i;

//reading block
assign read_data_1 = regfile[read_reg_num_1];
assign read_data_2 = regfile[read_reg_num_2];

//writing block
always @(*) begin 
	if(!rst) for(i = 0; i<8; i=i+1) regfile[i] <= i;
	else if (writeReg) begin 
		regfile[write_reg_num] = write_data;
	end
end

endmodule