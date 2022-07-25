module dff_test ();

	reg D, clk, rst;
	wire q, _q;

	dff DUT(.*);

	initial begin 
		$dumpfile("dff_out.vcd");
		$dumpvars;
		clk = 0;
		repeat(8) #5 clk = !clk;
		$finish;
	end

	initial begin 
		rst = 0;
		#3 rst = 1;
	end

	initial begin 
		D = 0;
		#7;
		D = 1;
		#5;
		D = 0;
		#10;
		D = 1;
		#6;
		D = 0;
		#12;
	end

endmodule