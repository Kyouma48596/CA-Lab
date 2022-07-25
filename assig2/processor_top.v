module processor_top (
	input clk,
	input rst
);
//IF BLOCK
wire [7:0] PC, PC_mux_out;
wire [7:0] jump_addr_from_ID;
wire [7:0] IF_instr, IF_PC;
wire JumpPC;
assign IF_PC = PC;
	
PC pc0(clk, rst, jump_addr_from_ID, JumpPC, PC);
instruction_memory IM(PC, rst, IF_instr);
IF_ID p0(JumpPC, clk, rst, IF_instr, IF_PC, ID_instr, ID_PC_next);
//ID Block
wire [7:0] ID_instr, ID_PC_next, ID_ImmData, signext_jmp, regfile_mux_out, ID_r1_out, ID_r2_out;
wire [3:0] ID_ALUop;
wire ID_ImmLoad, ID_ALUop, ID_RegWrite;

mux2_1 regfile_mux(WB_alu_res, WB_ImmData, WB_ImmLoad, regfile_mux_out);
sign_extend signextend(ID_instr[2:0], ID_instr[5:0], ID_ImmData, signext_jmp);
reg_file regfile(clk, rst, WB_RegWrite, ID_instr[2:0], ID_instr[5:3], WB_write_reg_num, regfile_mux_out, ID_r1_out, ID_r2_out);
adder8bit jump_adder(signext_jmp, ID_PC_next, jump_addr_from_ID);
main_control contr0(rst, ID_instr[7:6], ID_ALUop, ID_RegWrite, ID_ImmLoad, JumpPC);
ID_EX p1(ID_instr, clk, rst, ID_ALUop, ID_RegWrite, ID_ImmLoad, ID_r1_out, ID_r2_out, ID_instr[5:3], ID_ImmData, EX_ALUop, EX_RegWrite, EX_ImmLoad, EX_r1_out, EX_r2_out, EX_write_reg_num, EX_ImmData, EX_instr);
//EX Block
wire [7:0] EX_r1_out, EX_r2_out, EX_ImmData, EX_ALU_res, EX_instr, fwd_mux_out;
wire [2:0] EX_write_reg_num;
wire EX_ImmLoad, EX_RegWrite;
wire [3:0] EX_ALUop;
wire [1:0] fwd_cntrl;
mux3_1 M3(EX_r1_out, WB_alu_res, WB_ImmData, fwd_cntrl, fwd_mux_out);
ALU alu0(fwd_mux_out, EX_r2_out, EX_ALUop, EX_ALU_res);
forwading_unit fwd(EX_instr, WB_instr, fwd_cntrl);

EX_WB p2(EX_instr, clk, rst, EX_RegWrite, EX_ImmLoad, EX_ALU_res, EX_ImmData, EX_write_reg_num, WB_RegWrite, WB_ImmLoad, WB_alu_res, WB_ImmData, WB_write_reg_num, WB_instr);

//WB Block
wire [7:0] WB_alu_res, WB_ImmData, WB_instr; 
wire WB_RegWrite, WB_ImmLoad;
wire [2:0] WB_write_reg_num;
endmodule