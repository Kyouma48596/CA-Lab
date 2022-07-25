`include "adder_1bit.v"
module adder_4bit_test ();

	reg [3:0] A, B;
	reg Cin;
	wire [3:0] S;
	wire Cout;

	adder_4bit DUT(.*);

	initial begin 
		$dumpfile("adder4_out.vcd");
		$dumpvars;
		#5;
		{A, B, Cin} = 9'habc;
		#5;
		{A, B, Cin} = 9'hcce;
		#5;
		{A, B, Cin} = 9'h0FE;
		#5;
		{A, B, Cin} = 9'h0FF;
		#5;
		{A, B, Cin} = 9'h123;
		#5;
		{A, B, Cin} = 9'hCFE;
		#10 $finish;
	end

endmodule