`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:40:14 03/24/2022 
// Design Name: 
// Module Name:    ID_EX 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ID_EX(
	input wire clk, rst,
	input wire [3:0] ID_ALUop, 
	input wire ID_regwrite, 
	input wire [31:0] ID_regdata1, ID_regdata2,
	input wire [4:0] ID_writereg,
	output reg [3:0] EX_ALUop, 
	output reg EX_regwrite, 
	output reg [31:0] EX_regdata1, EX_regdata2,
	output reg [4:0] EX_writereg	
    );
	 
	 always @(posedge clk, negedge rst) begin
		if(!rst) begin
			EX_ALUop <= 0;
			EX_regwrite <= 0;
			EX_regdata1 <= 0;
			EX_regdata2 <= 0;
			EX_writereg <= 0;
		end
		else begin
			EX_ALUop <= ID_ALUop;
			EX_regwrite <= ID_regwrite;
			EX_regdata1 <= ID_regdata1;
			EX_regdata2 <= ID_regdata2;
			EX_writereg <= ID_writereg;
		end
	 end


endmodule
