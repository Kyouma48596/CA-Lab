`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2022 02:36:14
// Design Name: 
// Module Name: Adder_4_bit
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


module Adder_4_bit(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] s,
    output Cout
    );
    
    wire C1, C2, C3;
    
    Adder_1_bit X0(A[0], B[0], Cin, s[0], C1);
    Adder_1_bit X1(A[1], B[1], C1, s[1], C2);
    Adder_1_bit X2(A[2], B[2], C2, s[2], C3);
    Adder_1_bit X3(A[3], B[3], C3, s[3], Cout);
    
endmodule