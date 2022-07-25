`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2022 11:31:04
// Design Name: 
// Module Name: ALU
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


module ALU(
input wire [7:0] A, B,
input wire [3:0] cntrl,
output wire [7:0] Result
    );
    
    reg [7:0] res;
    always @(*) begin
        case(cntrl)
        4'b0000: res = A&B;
        4'b0001: res = A|B;
        4'b0010: res = A+B;
        4'b0110: res = A-B;
        4'b1001: res = A<<B;
        4'b1010: res = A>>B;
        4'b1000: res = (A < B) ? 8'd1: 8'd0;
        default: res = 8'bx;
        endcase 
        end
    assign Result = res;   
endmodule