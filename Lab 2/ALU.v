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
input wire [31:0] A, B,
input wire [3:0] cntrl,
output wire [31:0] Result,
output wire Zero
    );
    
    reg [31:0] res;
    always @(*) begin
        case(cntrl)
        4'b0000: res = A&B;
        4'b0001: res = A|B;
        4'b0010: res = A+B;
        4'b0100: res = A-B;
        4'b1000: res = (A < B) ? 32'd1: 32'd0;
        default: res = 32'bz;
        endcase 
        end
    assign Result = res;
    assign Zero = (Result == 0);    
endmodule