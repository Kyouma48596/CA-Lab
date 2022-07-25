`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2022 12:50:54 AM
// Design Name: 
// Module Name: mux3_1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux3_1(
    input [7:0] A,
    input [7:0] B,
    input [7:0] C,
    input [1:0] sel,
    output reg [7:0] q
    );
    always @(*) begin
        case(sel)
        2'b00: q = A;
        2'b01: q = B;
        2'b10: q = C;
        endcase
    end
endmodule
