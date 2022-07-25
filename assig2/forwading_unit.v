`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2022 01:13:19 AM
// Design Name: 
// Module Name: forwading_unit
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


module forwading_unit(
    input [7:0] EX_instr,
    input [7:0] WB_instr,
    output reg [1:0] sel
    );
    always @(*) begin
        //case 1, li and add
        if((WB_instr[7:6] == 2'b00) && (EX_instr[7:6] == 2'b01)) begin
            if(WB_instr[5:3] == EX_instr[2:0]) sel = 2'b10;
        end
        //case 2, add and add
        else if((WB_instr[7:6] == 2'b01) && (EX_instr[7:6] == 2'b01)) begin
            if(WB_instr[5:3] == EX_instr[2:0]) sel = 2'b01;
        end
        
        else
            sel = 2'b00;
    end
endmodule
