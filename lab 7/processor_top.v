`include "main_control.v"
`include "PC.v"
`include "reg_file.v"
`include "instruction_memory.v"
`include "ALU.v"
`include "pc_adder.v"
module processor_top (
	input clk,
	input rst
);

wire [31:0] alu_in1, alu_in2, alu_res, instr, PC_in, PC_out;
wire RegWrite, Zero;
wire [3:0] ALUop;
wire [31:0] regfile;

ALU alu(alu_in1, alu_in2, ALUop, alu_res, Zero);
instruction_memory mem0(PC_out, rst, instr);
reg_file file0(clk, rst, RegWrite, instr[19:15], instr[24:20], instr[11:7], alu_res, alu_in1, alu_in2, regfile);
pc_adder pc_add0(PC_out, PC_in);
PC pc0(PC_in, PC_out, clk, rst);
main_control contr0({instr[30], instr[14:12]}, instr[6:0], ALUop, RegWrite);

endmodule