`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:14:01 10/19/2015
// Design Name:   cpu
// Module Name:   Y:/part1/cpu_test.v
// Project Name:  part1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cpu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cpu_test;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [15:0] pc;
	wire [15:0] next_pc;
	wire [15:0] next_pc_final;
	wire [15:0] inst;
	wire [15:0] rdata1;
	wire [15:0] rdata2;
	wire [2:0] alu_op;
	wire alu_src;
	wire reg_wen;
	wire reg_dst;
	wire mem_ren;
	wire mem_wen;
	wire mem_to_reg;
	wire branch;
  wire jal;
  wire jal_exe;
  wire jal_mem;
  wire jal_wb;
	wire [15:0] b;
	wire [15:0] next_pc_exe;
  wire [15:0] next_pc_branch;
	wire [15:0] imm_exe;
	wire [15:0] rdata1_exe;
  wire [15:0] rdata2_exe;
	wire reg_wen_exe;
	wire [3:0] reg_waddr_exe;
	wire [15:0] b_exe;
	wire [2:0] alu_op_exe;
	wire mem_wen_exe;
	wire mem_ren_exe;
	wire mem_to_reg_exe;
	wire branch_exe;
	wire [15:0] alu_result;
	wire [15:0] alu_result_mem;
	wire [15:0] rdata2_mem;
	wire mem_to_reg_mem;
	wire reg_wen_mem;
	wire [3:0] reg_waddr_mem;
  wire [15:0] next_pc_mem;
	wire [15:0] mem_rdata;
	wire reg_wen_wb;
	wire [3:0] reg_waddr_wb;
	wire [15:0] mem_rdata_wb;
	wire [15:0] alu_result_wb;
  wire [15:0] next_pc_wb;
	wire mem_to_reg_wb;
  wire [3:0] reg_waddr;
	wire [15:0] reg_wdata;

	// Instantiate the Unit Under Test (UUT)
	cpu uut (
		.clk(clk), 
		.rst(rst), 
		.pc(pc), 
		.next_pc(next_pc), 
		.next_pc_final(next_pc_final), 
		.inst(inst), 
		.rdata1(rdata1), 
		.rdata2(rdata2), 
		.alu_op(alu_op), 
		.alu_src(alu_src), 
		.reg_wen(reg_wen), 
		.reg_dst(reg_dst), 
		.mem_ren(mem_ren), 
		.mem_wen(mem_wen), 
		.mem_to_reg(mem_to_reg), 
		.branch(branch), 
    .jal(jal),
		.b(b), 
		.next_pc_exe(next_pc_exe),
    .next_pc_branch(next_pc_branch),
		.imm_exe(imm_exe), 
		.rdata1_exe(rdata1_exe), 
    .rdata2_exe(rdata2_exe),
		.reg_wen_exe(reg_wen_exe), 
		.reg_waddr_exe(reg_waddr_exe), 
		.b_exe(b_exe), 
		.alu_op_exe(alu_op_exe), 
		.mem_wen_exe(mem_wen_exe), 
		.mem_ren_exe(mem_ren_exe), 
		.mem_to_reg_exe(mem_to_reg_exe), 
		.branch_exe(branch_exe), 
    .jal_exe(jal_exe),
		.alu_result(alu_result), 
		.alu_result_mem(alu_result_mem), 
		.rdata2_mem(rdata2_mem),
    .next_pc_mem(next_pc_mem),
		.mem_to_reg_mem(mem_to_reg_mem), 
		.reg_wen_mem(reg_wen_mem), 
		.reg_waddr_mem(reg_waddr_mem), 
    .jal_mem(jal_mem),
		.mem_rdata(mem_rdata), 
		.reg_wen_wb(reg_wen_wb), 
		.reg_waddr_wb(reg_waddr_wb), 
		.mem_rdata_wb(mem_rdata_wb), 
		.alu_result_wb(alu_result_wb), 
    .next_pc_wb(next_pc_wb),
		.mem_to_reg_wb(mem_to_reg_wb), 
    .jal_wb(jal_wb),
    .reg_waddr(reg_waddr),
		.reg_wdata(reg_wdata)
	);
  
  always #15 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
    #25 rst = 1;
    #25 rst = 0;
	end
      
endmodule

