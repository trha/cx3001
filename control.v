`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:00:17 10/18/2015 
// Design Name: 
// Module Name:    control_unit 
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

module control(
  input [3:0] op_code,
  output reg [2:0] alu_op,
  output reg alu_src,
  output reg reg_wen,
  output reg reg_dst,
  output reg mem_ren,
  output reg mem_wen,
  output reg mem_to_reg,
  output reg branch,
  output reg jump,
  output reg jr,
  output reg jal
);

always @ (*) begin
  case (op_code) 
    `ADD, `SUB, `AND, `XOR, `COM, `MUL: begin
      alu_op = op_code[2:0];
      alu_src = 1'b0;
      reg_wen = 1'b1;
      reg_dst = 1'b0;
      mem_ren = 1'b0;
      mem_wen = 1'b0;
      mem_to_reg = 1'b1;
      branch = 1'b0;
      jump = 1'b0;
      jr = 1'b0;
      jal = 1'b0;
    end
    
    `SLL, `SRL: begin
      alu_op = op_code[2:0];
      alu_src = 1'b1;
      reg_wen = 1'b1;
      reg_dst = 1'b0;
      mem_ren = 1'b0;
      mem_wen = 1'b0;
      mem_to_reg = 1'b1;
      branch = 1'b0;
      jump = 1'b0;
      jr = 1'b0;
      jal = 1'b0;
    end
    
    `LW: begin
      alu_op = `ADD;
      alu_src = 1'b1;
      reg_wen = 1'b1;
      reg_dst = 1'b1; //doesnt matter
      mem_ren = 1'b1;
      mem_wen = 1'b0;
      mem_to_reg = 1'b0;
      branch = 1'b0;
      jump = 1'b0;
      jr = 1'b0;
      jal = 1'b0;
    end
    
    `SW: begin
      alu_op = `ADD;
      alu_src = 1'b1;
      reg_wen = 1'b0;
      reg_dst = 1'b1;
      mem_ren = 1'b0;
      mem_wen = 1'b1;
      mem_to_reg = 1'b1; //doesnt matter
      branch = 1'b0;
      jump = 1'b0;
      jr = 1'b0;
      jal = 1'b0;
    end
    
    `BEQ: begin
      alu_op = `SUB;
      alu_src = 1'b0;
      reg_wen = 1'b0;
      reg_dst = 1'b1;  
      mem_ren = 1'b0;
      mem_wen = 1'b0;
      mem_to_reg = 1'b1; //doesnt matter
      branch = 1'b1;
      jump = 1'b0;
      jr = 1'b0;
      jal = 1'b0;
    end
    
    `JUMP: begin
      alu_op = `ADD; //doesnt matter
      alu_src = 1'b1; //doesnt matter
      reg_wen = 1'b0;  
      reg_dst = 1'b1; //doesnt matter 
      mem_ren = 1'b0;  
      mem_wen = 1'b0; 
      mem_to_reg = 1'b1; //doesnt matter
      branch = 1'b0;
      jump = 1'b1;
      jr = 1'b0;
      jal = 1'b0;
    end
    
    `JR: begin
      alu_op = `ADD; //doesnt matter
      alu_src = 1'b1; //doesnt matter
      reg_wen = 1'b0;  
      reg_dst = 1'b1; //doesnt matter 
      mem_ren = 1'b0;  
      mem_wen = 1'b0; 
      mem_to_reg = 1'b1; //doesnt matter
      branch = 1'b0;
      jump = 1'b0;
      jr = 1'b1;
      jal = 1'b0;
    end
    
    `JAL: begin
      alu_op = `ADD; //doesnt matter
      alu_src = 1'b1; //doesnt matter
      reg_wen = 1'b1;  
      reg_dst = 1'b1; //doesnt matter 
      mem_ren = 1'b0;  
      mem_wen = 1'b0; 
      mem_to_reg = 1'b1; //doesnt matter
      branch = 1'b0;
      jump = 1'b0;
      jr = 1'b0;
      jal = 1'b1;
    end
    
    
    /*default: begin
      alu_src = 1'b0;
      alu_op = 3'b0;
      wen = 1'b0;
    end*/
  endcase

end
endmodule
