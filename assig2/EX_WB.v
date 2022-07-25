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
	input wire [7:0] EX_instr,
	input wire clk, rst,
	input wire EX_regwrite, EX_ImmLoad,
	input wire [7:0] EX_ALUres, EX_ImmData,
	input wire [2:0] EX_writereg,
	output reg WB_regwrite, WB_ImmLoad,
	output reg [7:0] WB_ALUres, WB_ImmData,
	output reg [2:0] WB_writereg,
	output reg [7:0] WB_instr
    );
	
	always @(posedge clk, negedge rst) begin
		if(!rst) begin
			WB_regwrite <= 0;
			WB_ALUres <= 0;
			WB_writereg <= 0;
			WB_ImmLoad <= 0;
			WB_ImmData <= 0;
			WB_instr <= 0;
		end
		else begin
			WB_regwrite <= EX_regwrite;
			WB_ALUres <= EX_ALUres;
			WB_writereg <= EX_writereg;
			WB_ImmLoad <= EX_ImmLoad;
			WB_ImmData <= EX_ImmData;
			WB_instr <= EX_instr;
		end
	
	end

endmodule
