`timescale 1ns / 1ps


module instr_fetch(
    input clk,
    input reset,
    output wire [31:0] instr_code
    );
    
    reg [31:0] PC;
    
    instruction_memory i1(PC, reset, instr_code);
    
    always @(posedge clk, negedge reset)
	    begin
	    if(!reset)
	        PC <= 0;
	    else
	        PC <= PC + 4;
	    end
endmodule
