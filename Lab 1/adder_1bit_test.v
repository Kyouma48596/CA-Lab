module adder_1bit_test ();

	reg A, B, Cin;
	wire Cout, S;

	adder_1bit DUT(.*);

	initial begin 
		$dumpfile("adder_out.vcd");
		$dumpvars;
		#5;
		{A, B, Cin} = 3'b000;
		#5;
		{A, B, Cin} = 3'b001;
		#5;
		{A, B, Cin} = 3'b010;
		#5;
		{A, B, Cin} = 3'b011;
		#5;
		{A, B, Cin} = 3'b100;
		#5;
		{A, B, Cin} = 3'b101;
		#10 $finish;
	end

endmodule