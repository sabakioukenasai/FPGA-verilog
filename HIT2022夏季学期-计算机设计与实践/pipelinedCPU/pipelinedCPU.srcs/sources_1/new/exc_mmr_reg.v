`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 200111028 WWH
// 
// Create Date: 2022/07/07 09:50:21
// Design Name: 
// Module Name: exc_mmr_reg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 访存阶段的寄存器
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "param.v"

module exc_mmr_reg(
    input   wire    clk_i,
    input   wire    rst_n,

    input   [31:0]  E_pc,
    input   [31:0]  E_rD2,
    input   [ 4:0]  E_rW,
    input   [ 3:0]  E_optype,
    input   [ 1:0]  E_wd_sel,       // 写回寄存器数据选择
    input           E_rf_we,        // 写寄存器使能
    input           E_IO_wr_e,      // IO写使能
    input   [31:0]  e_alu_res,

    output  reg [31:0]  M_pc,
    output  reg [31:0]  M_rD2,
    output  reg [ 4:0]  M_rW,
    output  reg [ 3:0]  M_optype,
    output  reg [ 1:0]  M_wd_sel,       // 写回寄存器数据选择
    output  reg         M_rf_we,        // 写寄存器使能
    output  reg         M_IO_wr_e,      // IO写使能
    output  reg [31:0]  M_alu_res       // 执行阶段的计算结果
);

always @(posedge clk_i or negedge rst_n) begin
    M_state <= next_state;
    if (~rst_n) begin
        M_pc        <= 32'b0;
        M_rD2       <= 32'b0;
        M_rW        <= 5'b0;
        M_optype    <= `NONETYPE;
        M_wd_sel    <= `WB_NONE;
        M_rf_we     <= 1'b0;
        M_IO_wr_e   <= 1'b0;
        M_alu_res   <= 32'b0;
    end
    else begin
        M_pc        <= E_pc;
        M_rD2       <= E_rD2;
        M_rW        <= E_rW;
        M_optype    <= E_optype;
        M_wd_sel    <= E_wd_sel;
        M_rf_we     <= E_rf_we;
        M_IO_wr_e   <= E_IO_wr_e;
        M_alu_res   <= e_alu_res;
    end
end

endmodule
