`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 200111028 WWH 
// 
// Create Date: 2022/07/08 09:57:25
// Design Name: 
// Module Name: haltctrl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 通过插入停顿处理控制冒险
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "param.v"

module haltctrl(
	input 	[ 4:0]  d_rS1,
	input	[ 4:0] 	d_rS2,

	input	[ 4:0]	E_rW,
    input   [ 1:0]  E_wd_sel,   // 执行阶段写数据的选择信号
    input			e_branch,	// 执行阶段分支选择信号

// 更新PC、取值阶段的STATE信号
    output  reg [ 2:0]	ctl_F_state,
// 译码阶段的STATE信号
    output  reg [ 2:0]  ctl_D_state,
// 执行阶段的STATE信号
    output  reg [ 2:0]  ctl_E_state
);

wire	load_use 	= E_wd_sel == `WB_IO && E_rW != 5'b00000 
					&& (E_rW == d_rS1 || E_rW == d_rS2);

// Fetch 阶段控制指令
always @(*) begin
	// 处理加载/使用冒险
	if (load_use) 	ctl_F_state = `STATE_PAUS;
	// 其余情况
	else 			ctl_F_state = `STATE_WORK;
	// // 处理分支
	// else if (e_branch) begin
	// 	ctl_F_state 	= `STATE_WORK;
	// 	ctl_F_state_e	= 1'b0;
	// end
end

// Decode 阶段控制指令
always @(*) begin
	// 处理加载/使用冒险
	if (load_use) 	ctl_D_state = `STATE_PAUS;
	// 处理分支
	else if (e_branch) 
					ctl_D_state = `STATE_IDLE;
	else  			ctl_D_state = `STATE_WORK;
end

// Execute 阶段控制指令
always @(*) begin
	// 处理加载/使用冒险
	if (load_use || e_branch)
					ctl_E_state = `STATE_IDLE;
	else 			ctl_E_state = `STATE_WORK;
end

endmodule
