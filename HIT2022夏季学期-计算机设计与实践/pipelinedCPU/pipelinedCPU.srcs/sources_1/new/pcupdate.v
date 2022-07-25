`timescale 1ns / 1ps

`include "param.v"

module pcupdate(
    input   wire            clk_i,
    input   wire            rst_n,
    input   wire [ 2:0]     f_state,
    input   wire            npc_sel,
    input   wire [31:0]     alu_res,
    output  reg  [31:0]     pc
);

wire [31:0] pc4;

// 更新pc使用时序逻辑
always @(posedge clk_i or negedge rst_n) begin
    if (~rst_n) pc <= 32'hFFFFFFFC;
    // 仅在当前处于工作状态是更新PC
    else if (f_state == `STATE_WORK) begin
        if (npc_sel == 1'b0)
            pc <= pc4;              // 如果不选择分支，设置pc为下一条指令
        else
            pc <= alu_res;          // 否则跳转到ALU指令执行结果
    end
end

assign pc4 = pc + 3'b100;       // 下一条指令的地址

endmodule