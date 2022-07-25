`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 200111028 WWH
// 
// Create Date: 2022/07/07 10:39:48
// Design Name: 
// Module Name: mmr_wb_reg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "param.v"

module mmr_wb_reg(

    input   wire    clk_i,
    input   wire    rst_n,

    input   [31:0]  M_pc,
    input   [ 4:0]  M_rW,
    input   [ 3:0]  M_optype,
    input   [ 1:0]  M_wd_sel,       // 写回寄存器数据选择
    input           M_rf_we,        // 写寄存器使能
    input   [31:0]  M_alu_res,
    input   [31:0]  m_rd_data,

    output  reg [31:0]  W_pc,
    output  reg [ 4:0]  W_rW,
    output  reg [ 3:0]  W_optype,
    output  reg [ 1:0]  W_wd_sel,       // 写回寄存器数据选择
    output  reg         W_rf_we,        // 写寄存器使能
    output  reg [31:0]  W_alu_res,      // 执行阶段的计算结果
    output  reg [31:0]  W_rd_data
);

always @(posedge clk_i or negedge rst_n) begin
    if (~rst_n) begin
        W_pc        <= 32'b0;
        W_rW        <= 5'b0;
        W_optype    <= `NONETYPE;
        W_wd_sel    <= `WB_NONE;
        W_rf_we     <= 1'b0;
        W_alu_res   <= 32'b0;
        W_rd_data   <= 32'b0;
    end
    else begin
        W_pc        <= M_pc;
        W_rW        <= M_rW;
        W_optype    <= M_optype;
        W_wd_sel    <= M_wd_sel;
        W_rf_we     <= M_rf_we;
        W_alu_res   <= M_alu_res;
        W_rd_data   <= m_rd_data;
    end
end

endmodule
