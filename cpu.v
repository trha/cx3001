`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:33:41 10/18/2015 
// Design Name: 
// Module Name:    cpu 
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
module cpu(
  input clk, rst,
  output [15:0] pc,
  output [15:0] next_pc,
  output [15:0] next_pc_final,
  output [15:0] inst,
  output [15:0] rdata1,
  output [15:0] rdata2,
  output [2:0] alu_op,
  output alu_src,
  output reg_wen,
  output reg_dst,
  output mem_ren,
  output mem_wen,
  output mem_to_reg,
  output branch,
  output [15:0] b,
  output [15:0] next_pc_exe,
  output [15:0] next_pc_branch,
  output [15:0] imm_exe,
  output [15:0] rdata1_exe,
  output [15:0] rdata2_exe,
  output reg_wen_exe,
  output [3:0] reg_waddr_exe,
  output [15:0] b_exe,
  output [2:0] alu_op_exe,
  output mem_wen_exe,
  output mem_ren_exe,
  output mem_to_reg_exe,
  output branch_exe,
  output [15:0] alu_result,
  output [15:0] alu_result_mem,
  output [15:0] rdata2_mem,
  output mem_to_reg_mem,
  output reg_wen_mem,
  output [3:0] reg_waddr_mem,
  output [15:0] mem_rdata,
  output reg_wen_wb,
  output [3:0] reg_waddr_wb,
  output [15:0] mem_rdata_wb,
  output [15:0] alu_result_wb,
  output mem_to_reg_wb,
  output [15:0] reg_wdata
);
  assign next_pc = pc + 16'b1;
  pc_reg pc_reg(.clk(clk), .rst(rst), .next_pc(next_pc_final), .current_pc(pc));
  
  memory#(256, "inst.txt") inst_mem(.clk(clk), .rst(rst), .ren(1'b1), .wen(1'b0), .addr(pc), .wdata(16'b0), .data_out(inst));
  
  wire [3:0] op_code = inst[15:12];
  wire [3:0] rd = inst[11:8];
  wire [3:0] rs = inst[7:4];
  wire [3:0] rt_or_imm = inst[3:0];
 
  control cu(.op_code(op_code), .alu_op(alu_op), .alu_src(alu_src), .reg_wen(reg_wen),
             .reg_dst(reg_dst), .mem_ren(mem_ren), .mem_wen(mem_wen), .mem_to_reg(mem_to_reg), .branch(branch));
  
  wire [3:0] raddr2 = reg_dst ? rd : rt_or_imm;
  
  reg_file reg_file(.clk(clk), .rst(rst), .raddr1(rs), .raddr2(raddr2), .wen(reg_wen_wb),
                    .waddr(reg_waddr_wb), .wdata(reg_wdata), .rdata1(rdata1), .rdata2(rdata2));
                    
  wire [15:0] sign_extended_imm = {{12{inst[3]}}, rt_or_imm};
  assign b = alu_src ? sign_extended_imm : rdata2;
  id_exe_reg id_exe_reg(
    .clk(clk), .rst(rst), .next_pc(next_pc), .imm(sign_extended_imm), .rdata1(rdata1), .rdata2(rdata2),
    .reg_wen(reg_wen), .reg_waddr(inst[11:8]), .b(b), .alu_op(alu_op), .mem_wen(mem_wen),
    .mem_ren(mem_ren), .mem_to_reg(mem_to_reg), .branch(branch), .next_pc_out(next_pc_exe),
    .imm_out(imm_exe), .rdata1_out(rdata1_exe), .rdata2_out(rdata2_exe), .reg_wen_out(reg_wen_exe), .reg_waddr_out(reg_waddr_exe),
    .b_out(b_exe), .alu_op_out(alu_op_exe), .mem_wen_out(mem_wen_exe), .mem_ren_out(mem_ren_exe), 
    .mem_to_reg_out(mem_to_reg_exe), .branch_out(branch_exe)
  );

  wire pc_src = branch_exe && alu_result == 16'b0;
  assign next_pc_branch = next_pc_exe + imm_exe;
  assign next_pc_final = pc_src ? next_pc_branch : next_pc;
 
  alu alu(.op(alu_op_exe), .a(rdata1_exe), .b(b_exe), .result(alu_result));
 
  exe_mem_reg exe_mem_reg(
    .clk(clk), .rst(rst), .alu_result(alu_result), .rdata2(rdata2_exe),
    .mem_to_reg(mem_to_reg_exe), .reg_wen(reg_wen_exe), .reg_waddr(reg_waddr_exe), 
    .alu_result_out(alu_result_mem), .rdata2_out(rdata2_mem),
    .mem_to_reg_out(mem_to_reg_mem), .reg_wen_out(reg_wen_mem), .reg_waddr_out(reg_waddr_mem)
  );                
  
  memory#(.ROW_COUNT(256), .FILE("data.txt")) data_mem(
    .clk(clk), .rst(rst), .ren(mem_ren_exe), .wen(mem_wen_exe), 
    .addr(alu_result), .wdata(rdata2_mem), .data_out(mem_rdata)
  );
  
  mem_wb_reg mem_wb_reg(
    .clk(clk), .rst(rst), 
    .reg_wen(reg_wen_mem), .reg_waddr(reg_waddr_mem), .mem_rdata(mem_rdata), 
    .alu_result(alu_result_mem), .mem_to_reg(mem_to_reg_mem), 
    .reg_wen_out(reg_wen_wb), .reg_waddr_out(reg_waddr_wb), .mem_rdata_out(mem_rdata_wb), 
    .alu_result_out(alu_result_wb), .mem_to_reg_out(mem_to_reg_wb)
  );
  
  assign reg_wdata = mem_to_reg_wb ? alu_result_wb : mem_rdata_wb;
endmodule
