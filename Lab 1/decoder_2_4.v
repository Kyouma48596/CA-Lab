module decoder_2_4 (
	input A,
	input B,
	output reg Y0,
	output reg Y1,
	output reg Y2,
	output reg Y3
);

	wire _A, _B;

	not n0 (_A, A);
	not n1 (_B, B);

	always @(*) begin 
		Y0=0;
		Y1=0;
		Y2=0;
		Y3=0;
		if({A,B} == 2'b00) Y0=1;
		if({A,B} == 2'b01) Y2=1;
		if({A,B} == 2'b10) Y1=1;
		if({A,B} == 2'b11) Y3=1;
	end

endmodule