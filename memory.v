`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:  16:16:23 10/18/2015 
// Design Name: 
// Module Name:  inst_mem 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//s
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`include "define.v"

module memory #(parameter ROW_COUNT = 256, parameter FILE = "data.txt")(
  input clk,
  input rst,
	input ren,
	input wen,
  input [15:0] addr,
	input [15:0] wdata,
  output [15:0] data_out
);
  reg [15:0] mem[0:ROW_COUNT - 1]; 
  reg [15:0] raddr;
  assign data_out = mem[raddr];
  
  //for file reading
  integer fp, c, tmp;
  reg [8 * `MAX_LINE_LEN:0] line;
  reg [ROW_COUNT - 1:0] row;
  reg [15:0] inst;
  
  always @ (posedge clk) begin
    if (rst) begin 
      raddr <= 16'b0;
      
      fp = $fopen(FILE, "r");
      while (!$feof(fp)) begin
        c = $fgetc(fp);
        if (c == "/" | c == "#" | c == "%") begin 
          tmp = $fgets(line, fp); //skip comments
        end else begin
          tmp = $ungetc(c, fp);
          tmp = $fscanf(fp, "%h %h", row, inst);
          mem[row] = inst;
        end
      end
      $fclose(fp);
    end else begin
			if (ren) begin
				raddr <= addr;
			end
			
			if (wen) begin
				mem[addr] <= wdata;
			end
    end
  end
endmodule
