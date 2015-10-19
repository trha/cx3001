`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:   13:51:53 10/19/2015 
// Design Name: 
// Module Name:   mem_wb_reg 
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
module mem_wb_reg(
   input clk,
   input rst,
   input reg_wen,
   input [3:0] reg_waddr,
   input [15:0] mem_rdata,
   input [15:0] alu_result,
   input mem_to_reg,
   output reg reg_wen_out,
   output reg [3:0] reg_waddr_out,
   output reg [15:0] mem_rdata_out,
   output reg [15:0] alu_result_out,
   output reg mem_to_reg_out
);

  always @ (posedge clk) begin
    if (rst) begin
      reg_wen_out <= 1'b0;
      reg_waddr_out <= 4'b0;
      mem_rdata_out <= 16'b0;
      alu_result_out <= 16'b0;
      mem_to_reg_out <= 1'b0;
    end else begin
      reg_wen_out <= reg_wen;
      reg_waddr_out <= reg_waddr;
      mem_rdata_out <= mem_rdata;
      alu_result_out <= alu_result;
      mem_to_reg_out <= mem_to_reg;
    end
  end

endmodule
