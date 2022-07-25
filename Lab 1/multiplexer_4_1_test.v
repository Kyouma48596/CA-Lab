module multiplexer_4_1_test ();

	reg [3:0] in;
	reg [1:0] sel;
	wire q;

	multiplexer_4_1 DUT(.*);

	initial begin 
		$dumpfile("multiplexer_4_1_out.vcd");
		$dumpvars;

		#5;
		in = 4'hA;
		sel = 2'd0;
		#5;
		in = 4'hB;
		sel = 2'd1;
		#5;
		in = 4'hC;
		sel = 2'd2;
		#5;
		in = 4'hD;
		sel = 2'd3;
		#5;
		in = 4'hE;
		sel = 2'd2;
		#5;
		in = 4'hF;
		sel = 2'd1;
		#10 $finish;
	end

endmodule