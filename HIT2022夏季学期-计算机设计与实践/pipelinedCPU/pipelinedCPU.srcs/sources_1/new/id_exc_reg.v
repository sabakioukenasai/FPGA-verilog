`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 200111028 WWH
// 
// Create Date: 2022/07/06 11:02:15
// Design Name: 
// Module Name: id_exc_reg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 执行阶段寄存器
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "param.v"

module id_exc_reg(
    input   wire    clk_i,
    input   wire    rst_n,
    input   [ 2:0]  ctl_E_state,

    input   [31:0]  D_pc,
    input   [ 2:0]  D_func3,
    input   [ 3:0]  D_optype,
    input   [31:0]  d_immsext,
    input   [31:0]  d_rD1,
    input   [31:0]  d_rD2,
    input   [ 4:0]  d_rW,
    input   [ 3:0]  d_alu_op,       // ALU 运算选择
    input   [ 1:0]  d_wd_sel,       // 写回寄存器数据选择
    input           d_rf_we,        // 写寄存器使能
    input           d_alua_sel,     // 选择ALU第一运算数
    input           d_alub_sel,     // 选择ALU第二运算数
    input           d_IO_wr_e,      // IO写使能

    output  reg [31:0]  E_pc,
    output  reg [ 2:0]  E_func3,
    output  reg [ 3:0]  E_optype,
    output  reg [31:0]  E_immsext,
    output  reg [31:0]  E_rD1,
    output  reg [31:0]  E_rD2,
    output  reg [ 4:0]  E_rW,
    output  reg [ 3:0]  E_alu_op,       // ALU 运算选择
    output  reg [ 1:0]  E_wd_sel,       // 写回寄存器数据选择
    output  reg         E_rf_we,        // 写寄存器使能
    output  reg         E_alua_sel,     // 选择ALU第一运算数
    output  reg         E_alub_sel,     // 选择ALU第二运算数
    output  reg         E_IO_wr_e       // IO写使能
);

always @(posedge clk_i or negedge rst_n) begin
    if (~rst_n || ctl_E_state == `STATE_IDLE) begin
        E_pc        <= 32'b0;
        E_func3     <= 3'b0;
        E_optype    <= `NONETYPE;
        E_immsext   <= 32'b0;
        E_rD1       <= 32'b0;
        E_rD2       <= 32'b0;
        E_rW        <= 5'b0;
        E_alu_op    <= `NONEOP;
        E_wd_sel    <= `WB_NONE;
        E_rf_we     <= 1'b0;
        E_alua_sel  <= `ALUA_RD1;
        E_alub_sel  <= `ALUB_RD2;
        E_IO_wr_e   <= 1'b0;     
    end
    else if (ctl_E_state == `STATE_WORK) begin
        E_pc        <= D_pc;
        E_func3     <= D_func3;
        E_optype    <= D_optype;
        E_immsext   <= d_immsext;
        E_rD1       <= d_rD1;
        E_rD2       <= d_rD2;
        E_rW        <= d_rW;
        E_alu_op    <= d_alu_op;
        E_wd_sel    <= d_wd_sel;
        E_rf_we     <= d_rf_we;
        E_alua_sel  <= d_alua_sel;
        E_alub_sel  <= d_alub_sel;
        E_IO_wr_e   <= d_IO_wr_e;
    end
end


endmodule
