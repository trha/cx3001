`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:  16:09:36 10/18/2015 
// Design Name: 
// Module Name:  alu 
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

module alu(
  input [2:0] op,
  input [15:0] a,
  input [15:0] b,
  output reg [15:0] result
);
  always @* begin
    case (op)
      `ADD: result = a + b;
      `SUB: result = a - b;
      `AND: result = a & b;
      `XOR: result = a ^ b;
      `SLL: result = a << b;
      `SRL: result = a >> b;
      `COM: result = a <= b;
      `MUL: result = a * b;
    endcase
  end
endmodule
