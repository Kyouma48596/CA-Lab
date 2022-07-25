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
		input wire clk, rst,
		input wire [31:0] IF_instr,
		output reg [31:0] ID_instr
    );

	always @(posedge clk, negedge rst) begin
		if(!rst)
			ID_instr <= 0;
		else
			ID_instr <= IF_instr;
	
	end

endmodule
