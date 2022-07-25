`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:45 03/24/2022 
// Design Name: 
// Module Name:    IF_ID 
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
module IF_ID(
		input wire JumpPC,
		input wire clk, rst,
		input wire [7:0] IF_instr,
		input wire [7:0] IF_PC_next,
		output reg [7:0] ID_instr,
		output reg [7:0] ID_PC_next
    );

	always @(posedge clk or negedge rst) begin
		if(!rst) begin
			ID_instr <= 8'bx;
			ID_PC_next <= 0;
		end

		else begin
			ID_instr <= IF_instr;
			ID_PC_next <= IF_PC_next;
		end
	end

//	always @(negedge JumpPC) begin
//		ID_instr <= 8'bx;
//		ID_PC_next <=0;
//	end

endmodule
