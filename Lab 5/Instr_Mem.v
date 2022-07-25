module instruction_memory (
  input [31:0] PC,
  input reset,
  output [31:0] instruction_code
);

reg [7:0] mem [35:0];

assign instruction_code = {mem[PC+3], mem[PC+2], mem[PC+1], mem[PC+0]};

always @(reset) begin 
  if(reset == 0) begin 
    mem[3] = 8'h01; mem[2] = 8'h49; mem[1] = 8'h83; mem[0] = 8'h33;
    mem[7] = 8'h40; mem[6] = 8'h20; mem[5] = 8'h84; mem[4] = 8'h33;
    mem[11] = 8'h02; mem[10] = 8'h53; mem[9] = 8'h03; mem[8] = 8'hb3;
    mem[15] = 8'h00; mem[14] = 8'h21; mem[13] = 8'h00; mem[12] = 8'h93;
  end
end

endmodule