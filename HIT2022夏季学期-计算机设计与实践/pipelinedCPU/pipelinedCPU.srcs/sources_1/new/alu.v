`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 200111028 WWH
// 
// Create Date: 2022/07/07 09:46:48
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// alu运算单元
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module alu (
    input   wire    [ 3:0]      alu_op,
    input   wire    [31:0]      A,
    input   wire    [31:0]      B,
    output  wire    [31:0]      result
);

wire [31:0] res [10:0];

assign res[0] = A + B;
assign res[1] = A + (~B + 1'b1);
assign res[2] = A & B;
assign res[3] = A | B;
assign res[4] = A ^ B;
assign res[5] = A << $unsigned(B[4:0]);
assign res[6] = A >> $unsigned(B[4:0]);
assign res[7] = $signed(A) >>> $unsigned(B[4:0]);
assign res[8] = A;
assign res[9] = B;
assign res[10] = 32'b0;;

assign result = res[alu_op];
    
endmodule