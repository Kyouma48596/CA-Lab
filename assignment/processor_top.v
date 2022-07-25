`include "main_control.v"
`include "PC.v"
`include "reg_file.v"
`include "instruction_memory.v"
`include "ALU.v"
`include "pc_adder.v"
`include "mux2to1.v"
`include "sign_extend.v"
module processor_top (
	input clk,
	input rst
);

wire [31:0] alu_in1, alu_in2, alu_res, instr, PC_in, PC_out, alumux_out, regfilemux_out, sign_extend_out;
wire RegWrite, Zero, ImmSel, Shift;
wire [3:0] ALUop;
wire [31:0] regfile;

ALU alu(alu_in1, alumux_out, ALUop, alu_res, Zero);
instruction_memory mem0(PC_out, rst, instr);
reg_file file0(clk, rst, RegWrite, instr[20:16], instr[15:11], instr[25:21], regfilemux_out, alu_in1, alu_in2, regfile);
pc_adder pc_add0(PC_out, PC_in);
PC pc0(PC_in, PC_out, clk, rst);
main_control contr0(instr[31:26], instr[5:0], ALUop, RegWrite, Shift, ImmSel);
mux2to1 ALUmux(alu_in2, instr[10:6], alumux_out, Shift);
mux2to1 regfilemux(alu_res, sign_extend_out, regfilemux_out, ImmSel);
sign_extend sign(instr[20:0], sign_extend_out);

endmodule