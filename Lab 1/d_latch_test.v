module dff_test ();

	reg D, En, rst;
	wire q, _q;

	d_latch DUT(.*);

	initial begin 
		$dumpfile("dff_out.vcd");
		$dumpvars;
		En = 0; # 5 En = 1; #10 En = 0; #10 En = 1; #10 En =0; #5 ; $finish;
	end

	initial begin 
		D = 0; # 7 D = 1; #5 D = 0; #8 D = 1; #10 D =0; #3 D = 1;
	end


endmodule