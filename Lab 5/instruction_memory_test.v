module instruction_memory_test ();

reg [31:0] PC;
reg reset;
wire [31:0] instruction_code;

instruction_memory DUT(.*);

initial begin 
	$dumpfile("instruction_memory_out.vcd");
	$dumpvars;
	reset = 1'b1;
	#1;
	reset = 1'b0;
	#3;
	reset = 1'b1;
	#1;
	PC = 32'h0;
	#5;
	PC = 32'h4;
	#5;
	PC = 32'h8;
	#5;
	PC = 32'h0c;
	#5;
	$finish;
end

endmodule