`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:37:16 10/18/2015 
// Design Name: 
// Module Name:    exe_wb_reg 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module exe_mem_reg(
  input clk,
  input rst,
  input [15:0] alu_result,
  input [15:0] rdata2,
  input mem_to_reg,
  input reg_wen,
  input [3:0] reg_waddr,
  
  output reg [15:0] alu_result_out,
  output reg [15:0] rdata2_out,
  output reg mem_to_reg_out,
  output reg reg_wen_out,
  output reg [3:0] reg_waddr_out
);
  always @(posedge clk) begin
    if (rst) begin
      alu_result_out <= 16'b0;
      rdata2_out <= 16'b0;
      mem_to_reg_out <= 1'b0;
      reg_wen_out <= 1'b0;
      reg_waddr_out <= 4'b0;
    end else begin
      alu_result_out <= alu_result;
      rdata2_out <= rdata2;
      mem_to_reg_out <= mem_to_reg;
      reg_wen_out <= reg_wen;
      reg_waddr_out <= reg_waddr;
    end
  end
endmodule
