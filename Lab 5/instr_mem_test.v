module instr_fetch_test();

reg reset;
wire [31:0] instruction_code;
reg clk;
instr_fetch I1(clk, reset, instruction_code);

always #5 clk = ~clk;

initial begin 
  $dumpfile("instr_mem_test.vcd");
  $dumpvars;
  reset = 1'b1;
  clk = 1'b0;
  #5
  reset = 1'b0;
  #1
  reset = 1'b1;
  #45
  $finish;
end

endmodule