`include "ALU.v"
`include "EX_WB.v"
`include "ID_EX.v"
`include "IF_ID.v"
`include "PC.v"
`include "instruction_memory.v"
`include "main_control.v"
`include "pc_adder.v"
`include "reg_file.v"
module processor_top (
	input clk,
	input rst
);

wire [31:0] PC_in, PC_out;
wire [31:0] IF_instr, ID_instr;

pc_adder pc_add0(PC_out, PC_in);
PC pc0(PC_in, PC_out, clk, rst);
instruction_memory mem0(PC_out, rst, IF_instr);
wire WB_RegWrite;
wire [7:0] WB_alu_res;
wire [4:0] WB_writereg;
IF_ID p1(clk, rst, IF_instr, ID_instr);

wire ID_RegWrite, EX_Zero;
wire [3:0] ID_ALUop;
wire [4:0] ID_writereg = ID_instr[11:7];
wire [7:0] ID_alu_in1, ID_alu_in2;
main_control contr0({ID_instr[30], ID_instr[14:12]}, ID_instr[6:0], ID_ALUop, ID_RegWrite);
reg_file file0(clk, rst, WB_RegWrite, ID_instr[19:15], ID_instr[24:20], WB_writereg, WB_alu_res, ID_alu_in1, ID_alu_in2);

wire [3:0] EX_ALUop;
wire [7:0] EX_alu_in1, EX_alu_in2, EX_alu_res;
wire EX_RegWrite;
wire [4:0] EX_writereg;


ID_EX p2(clk, rst, ID_ALUop, ID_RegWrite, ID_alu_in1, ID_alu_in2, ID_writereg, EX_ALUop, EX_RegWrite, EX_alu_in1, EX_alu_in2, EX_writereg);	

ALU alu(EX_alu_in1, EX_alu_in2, EX_ALUop, EX_alu_res, EX_Zero);



EX_WB p3(clk, rst, EX_RegWrite, EX_alu_res, EX_writereg, WB_RegWrite, WB_alu_res, WB_writereg);


endmodule