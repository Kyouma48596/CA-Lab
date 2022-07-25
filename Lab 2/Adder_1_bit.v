`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2022 02:22:17
// Design Name: 
// Module Name: Adder_1_bit
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


module Adder_1_bit(
    input A,
    input B,
    input Cin,
    output s,
    output Cout
    );
    
    assign s = A^B^Cin;
    assign Cout = (A & B)|(B & Cin)|(A & Cin);
endmodule