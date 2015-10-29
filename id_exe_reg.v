`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:23:03 10/18/2015 
// Design Name: 
// Module Name:    id_exe_register 
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
module id_exe_reg(
  input clk,
  input rst,
  input [15:0] next_pc,
  input [15:0] imm,
  input [15:0] rdata1,
  input [15:0] rdata2,
  input reg_wen,
  input [3:0] reg_waddr,
  input [15:0] b,
  input [2:0] alu_op,
  input mem_wen,
  input mem_ren,
  input mem_to_reg,
  input branch,
  input jal,
  
  output reg [15:0] next_pc_out,
  output reg [15:0] imm_out,
  output reg [15:0] rdata1_out,
  output reg [15:0] rdata2_out,
  output reg reg_wen_out,
  output reg [3:0] reg_waddr_out,
  output reg [15:0] b_out,
  output reg [2:0] alu_op_out,
  output reg mem_wen_out,
  output reg mem_ren_out,
  output reg mem_to_reg_out,
  output reg branch_out,
  output reg jal_out
);
  always @ (posedge clk) begin
    if (rst) begin
      next_pc_out <= 16'b0;
      imm_out <= 16'b0;
      rdata1_out <= 16'b0;
      rdata2_out <= 16'b0;
      reg_wen_out <= 1'b0;
      reg_waddr_out <= 4'b0;
      b_out <= 16'b0;
      alu_op_out <= 3'b0;
      mem_wen_out <= 1'b0;
      mem_ren_out <= 1'b0;
      mem_to_reg_out <= 1'b0;
      branch_out <= 1'b0;
      jal_out <= 1'b0;
    end else begin
      next_pc_out <= next_pc;
      imm_out <= imm;
      rdata1_out <= rdata1;
      rdata2_out <= rdata2;
      reg_wen_out <= reg_wen;
      reg_waddr_out <= reg_waddr;
      b_out <= b;
      alu_op_out <= alu_op;
      mem_wen_out <= mem_wen;
      mem_ren_out <= mem_ren;
      mem_to_reg_out <= mem_to_reg;
      branch_out <= branch;
      jal_out <= jal;
    end
  end
endmodule
