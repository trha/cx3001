`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:10:39 10/18/2015 
// Design Name: 
// Module Name:    pc 
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
module pc_reg(
  input clk,
  input rst,
  input [15:0] next_pc,
  output reg [15:0] current_pc
);
  always @(posedge clk) begin
    if (rst) begin
      current_pc <= 16'b0;
    end else begin
      current_pc <= next_pc;
    end
  end
endmodule
