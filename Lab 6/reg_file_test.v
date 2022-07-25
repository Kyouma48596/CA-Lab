module reg_file_test;

reg clk, rst, writeReg;
reg [4:0] read_reg_num_1, read_reg_num_2, write_reg_num;
reg [31:0] write_data;
wire [31:0] read_data_1, read_data_2;
integer i = 0;

reg_file DUT(.*);

initial begin 
	$dumpfile("reg_file_out.vcd");
	$dumpvars;
	clk = 1'b0;
	forever #5 clk = !clk;
end

initial begin 
	rst = 1'b1;
	#1;
	rst = 1'b0;
	#2;
	rst = 1'b1;
end

// initial begin 
// 	while(i<32) begin 
// 		@(negedge clk);
// 		writeReg = 1;
// 		write_data = i;
// 		write_reg_num = i;
// 		i=i+1;
// 	end

// 	writeReg = 0;

// 	repeat(10) begin 
// 		@(negedge clk)
// 		read_reg_num_1 = $random;
// 		read_reg_num_2 = $random;
// 	end

// 	#10 $finish;

// end

initial begin 
	#10 read_reg_num_1 = 0; read_reg_num_2 = 0;
	#15 read_reg_num_1 = 0; read_reg_num_2 = 1;
	#10 read_reg_num_1 = 1; read_reg_num_2 = 2;
end

initial begin 
	writeReg = 0;
	#15;
	writeReg = 1; write_data = 20; write_reg_num = 0;
	#10;
	writeReg = 1; write_data = 30; write_reg_num = 1;
	#10;
	writeReg = 1; write_data = 30; write_reg_num = 1;
	#10;
	#10 $finish;

end

endmodule