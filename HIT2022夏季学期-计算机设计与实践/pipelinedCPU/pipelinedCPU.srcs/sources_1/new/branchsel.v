`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 200111028 WWH
// 
// Create Date: 2022/07/07 09:15:06
// Design Name: 
// Module Name: branchsel
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 根据现有条件判断是否选择分支
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "param.v"

module branchsel(
	input	[31:0]	E_rD1,
	input	[31:0]	E_rD2,
	input	[ 3:0]	E_optype,
	input	[ 2:0]	E_func3,
	output	    	e_branch
);

// 相等标志
assign BrEq  = E_rD1 == E_rD2;

// 小于标志
assign BrLt  =   
        ~(E_rD1[31] == 0 && E_rD2[31] == 1) &&      // 两数不能是 前正后负
        ((E_rD1[31] == 1 && E_rD2[31] == 0) ||      // 正数与负数
        E_rD1 < E_rD2 );

assign e_branch = (E_optype == `BFORMAT 
                  && (BrEq && E_func3 == 3'b000
                    || !BrEq && E_func3 == 3'b001
                    ||  BrLt && E_func3 == 3'b100
                    || !BrLt && E_func3 == 3'b101))
                || E_optype[3:1] == 3'b010;

endmodule
