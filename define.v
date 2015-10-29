`define ADD 4'b0000 //0 $rd $rs $rt
`define SUB 4'b0001 //1
`define AND 4'b0010 //2
`define XOR 4'b0011 //3 $rd $rs imm
`define SLL 4'b0100 //4
`define SRL 4'b0101 //5
`define COM 4'b0110 //6
`define MUL 4'b0111 //7
`define SW  4'b1000 //8 $rd $rs imm
`define LW  4'b1001 //9
`define BEQ 4'b1010 //a $rd $rs imm
`define JUMP 4'b1011 //b target
`define JR 4'b1100   //c $rs
`define JAL 4'b1101  //d target

`define MAX_LINE_LEN 100