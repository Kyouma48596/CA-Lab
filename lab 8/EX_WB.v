`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:51:36 03/24/2022 
// Design Name: 
// Module Name:    EX_WB 
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
module EX_WB(
	input wire clk, rst,
	input wire EX_regwrite,
	input wire [31:0] EX_ALUres,
	input wire [4:0] EX_writereg,
	output reg WB_regwrite,
	output reg [31:0] WB_ALUres,
	output reg [4:0] WB_writereg
    );
	
	always @(posedge clk, negedge rst) begin
		if(!rst) begin
			WB_regwrite <= 0;
			WB_ALUres <= 0;
			WB_writereg <= 0;
		end
		else begin
			WB_regwrite <= EX_regwrite;
			WB_ALUres <= EX_ALUres;
			WB_writereg <= EX_writereg;
		end
	
	end

endmodule
