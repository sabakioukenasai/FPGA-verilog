`timescale 1ns / 1ps

`include "param.v"

module forward(
// decode 阶段的信号
    input   [31:0]  d_rf_rD1,
    input   [31:0]  d_rf_rD2,
    input   [ 4:0]  d_rS1,
    input   [ 4:0]  d_rS2,

// execute 阶段的信号
    input   [31:0]  e_alu_res,
    input   [31:0]  E_pc,
    input   [ 4:0]  E_rW,       // 执行阶段的写寄存器
    input   [ 1:0]  E_wd_sel,   // 执行阶段写数据的选择信号

// memory 阶段的信号
    input   [31:0]  M_pc,
    input   [31:0]  M_alu_res,
    input   [31:0]  m_rd_data,  // 从IO读取的数据
    input   [ 4:0]  M_rW,       // 访存阶段写回的寄存器
    input   [ 1:0]  M_wd_sel,   // 写回数据的选择

// write back 阶段的信号
    input   [31:0]  w_rf_wD,    // 写回阶段决定的写回数据
    input   [ 4:0]  W_rW,       // 写回阶段写回的寄存器
    input   [ 1:0]  W_wd_sel,   // 选择写回数据

    output  reg     [31:0]  d_rD1,
    output  reg     [31:0]  d_rD2
);

// 数据转发控制(控制信号可能可以简化)
// 考察各个阶段是否存在对源寄存器一的转发
wire fw_E_1 = (E_wd_sel == `WB_PC4 || E_wd_sel == `WB_ALU) && E_rW != 5'b0 && E_rW == d_rS1;
wire fw_M_1 = M_wd_sel != `WB_NONE && M_rW != 5'b0 && M_rW == d_rS1;                           
wire fw_W_1 = W_wd_sel != `WB_NONE && W_rW != 5'b0 && W_rW == d_rS1;

// 考察各个阶段是否存在对对源寄存器二的转发
wire fw_E_2 = (E_wd_sel == `WB_PC4 || E_wd_sel == `WB_ALU) && E_rW != 5'b0 && E_rW == d_rS2;
wire fw_M_2 = M_wd_sel != `WB_NONE && M_rW != 5'b0 && M_rW == d_rS2;
wire fw_W_2 = W_wd_sel != `WB_NONE && W_rW != 5'b0 && W_rW == d_rS2;

// 实现对寄存器一的转发
always @(*) begin
    if (fw_E_1)         d_rD1   = E_wd_sel == `WB_PC4 ? E_pc + 3'b100 : e_alu_res;
    else if (fw_M_1)    d_rD1   = M_wd_sel == `WB_ALU ? M_alu_res
                                : M_wd_sel == `WB_PC4 ? M_pc + 3'b100
                                : m_rd_data;
    else if (fw_W_1)    d_rD1   = w_rf_wD;
    else                d_rD1   = d_rf_rD1;
end

// 实现对寄存器二的转发
always @(*) begin
    if (fw_E_2)         d_rD2   = E_wd_sel == `WB_PC4 ? E_pc + 3'b100 : e_alu_res;
    else if (fw_M_2)    d_rD2   = M_wd_sel == `WB_ALU ? M_alu_res
                                : M_wd_sel == `WB_PC4 ? M_pc + 3'b100
                                : m_rd_data;
    else if (fw_W_2)    d_rD2   = w_rf_wD;
    else                d_rD2   = d_rf_rD2;
end

endmodule