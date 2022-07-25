module decoder_2_4_test ();

	reg A, B;
	wire Y0, Y1, Y2, Y3;

	decoder_2_4 DUT(.*);

	initial begin 
		$dumpfile("decoder_2_4_out.vcd");
		$dumpvars;
		#5;
		{A, B} = 2'd0;
		#5;
		{A, B} = 2'd1;
		#5;
		{A, B} = 2'd2;
		#5;
		{A, B} = 2'd3;
		#10 $finish;
	end

endmodule