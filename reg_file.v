`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:  17:52:39 10/18/2015 
// Design Name: 
// Module Name:  reg_file 
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
`include "define.v"

module reg_file(
  input clk,
  input rst,
  input [3:0] raddr1,
  input [3:0] raddr2,
  input wen,
  input [3:0] waddr,
  input [15:0] wdata,
  output [15:0] rdata1,
  output [15:0] rdata2
);
  
  reg [15:0] regs[0:15]; //16x 16-bit regs
  
  //for file reading
  integer fp, i, tmp;
  
  always @ (posedge clk) begin
    if (rst) begin
      fp = $fopen("regs.txt", "r");
      for (i = 0; i < 16; i = i + 1) begin
        tmp = $fscanf(fp, "%h", regs[i]);
      end
      $fclose(fp);
    end else begin
      if (wen) begin
        regs[waddr] <= wdata;
      end
    end
  end
  
  assign rdata1 = wen && waddr == raddr1 ? wdata : regs[raddr1];
	assign rdata2 = wen && waddr == raddr2 ? wdata : regs[raddr2];
endmodule
