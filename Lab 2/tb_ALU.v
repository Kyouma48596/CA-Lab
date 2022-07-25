`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2022 11:46:53
// Design Name: 
// Module Name: tb_ALU
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


module tb_ALU();
    
    reg [31:0] A, B;
    reg [3:0] cntrl;
    
    wire [31:0] Result;
    wire Zero;
    
    ALU DUT(.*);
    
    initial begin
        $dumpfile("adder4_out.vcd");
        $dumpvars;
    cntrl = 4'b0000;
    A = 32'd23;
    B = 32'd42;
    #20
    cntrl = 4'b0001;
    A = 32'd23;
    B = 32'd42;
    #20
    cntrl = 4'b0010;
    A = 32'd23;
    B = 32'd42;
    #20
    cntrl = 4'b0100;
    A = 32'd23;
    B = 32'd42;
    #20
    cntrl = 4'b1000;
    A = 32'd23;
    B = 32'd42;
    #20
    cntrl = 4'b1000;
    A = 32'd42;
    B = 32'd23;
    #20
    cntrl = 4'b0100;
    A = 32'd42;
    B = 32'd23;
    #20        
    $finish;
    end
endmodule