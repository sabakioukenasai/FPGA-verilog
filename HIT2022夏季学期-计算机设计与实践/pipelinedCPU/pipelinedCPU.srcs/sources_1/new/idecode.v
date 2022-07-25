`timescale 1ns / 1ps
/* 译码模块，解析指令，确定所有控制信号 */

`include "param.v"

module idecode(
// 输入指令的各个部分
    input   wire [ 6:0]     D_func7,
    input   wire [ 4:0]     D_rS2,
    input   wire [ 4:0]     D_rS1,
    input   wire [ 2:0]     D_func3,
    input   wire [ 4:0]     D_rW,
    input   wire [ 3:0]     D_optype,

    // 产生符号拓展后的立即数
    output  reg  [31:0]     imm_sext,       // 符号拓展后的立即数

    // 产生寄存器选择信号
    output  wire [ 4:0]     d_rS2,
    output  wire [ 4:0]     d_rS1,
    output  wire [ 4:0]     d_rW,

    // 产生选择和使能信号信号
    output  reg  [ 3:0]     alu_op,         // alu运算模块选择
    output  reg  [ 1:0]     wd_sel,         // 写回数据选择
    output  wire            rf_we,          // 寄存器文件读使能
    output  wire            alua_sel,       // alu第一运算数选择
    output  wire            alub_sel,       // alu第二运算数选择
    output  wire            IO_wr_e         // 内存写使能 
);

// 选择SEXT立即数扩展的方式
always @(*) begin
    case (D_optype)
        `NIFORMAT, `LWINST, `JALRINST: begin
            if (D_func3[1:0] == 2'b01)
                imm_sext = {27'b0, D_rS2};
            else 
                imm_sext = {{21{D_func7[6]}}, D_func7[5:0], D_rS2};
        end
        `SFORMAT:   imm_sext = {{21{D_func7[6]}}, D_func7[5:0], D_rW};
        `BFORMAT:   imm_sext = {{20{D_func7[6]}}, D_rW[0], D_func7[5:0], D_rW[4:1], 1'b0};
        `UFORMAT:   imm_sext = {D_func7, D_rS2, D_rS1, D_func3, 12'b0};
        `JFORMAT:   imm_sext = {{12{D_func7[6]}}, D_rS1, D_func3, D_rS2[0], D_func7[5:0], D_rS2[4:1], 1'b0};
        default:    imm_sext = 32'b0;
    endcase
end

// 确定 ALU 运算类型
always @(*) begin
    if (D_optype == `UFORMAT)                       alu_op = `ALUB;
    else if ((D_optype == `RFORMAT && {D_func7[5], D_func3} == 4'b0)
        || (D_optype == `NIFORMAT && D_func3 == 3'b000)
        || D_optype[3] == 1'b0)
                                                    alu_op = `ADD;          // add
    else if (D_optype == `RFORMAT && {D_func7[5], D_func3} == 4'b1000)
                                                    alu_op = `SUB;          // sub
    else if (D_func3 == 3'b111)                     alu_op = `AND;          // and
    else if (D_func3 == 3'b110)                     alu_op = `OR;           // or
    else if (D_func3 == 3'b100)                     alu_op = `XOR;          // xor
    else if (D_func3 == 3'b001)                     alu_op = `SLL;          // sll
    else if (D_func7[5] == 0)                       alu_op = `SRL;          // srl
    else                                            alu_op = `SRA;          // sra
end

// 选择寄存器
assign d_rS2 = (D_optype[1] == 1'b0)        ? 5'b00000 : D_rS2;
assign d_rS1 = (D_optype[2:0] == 3'b101)    ? 5'b00000 : D_rS1;
assign d_rW  = ({D_optype[3], D_optype[1:0]} == 3'b011) ? 5'b00000 : D_rW;

// 寄存器写使能
assign rf_we = ~({D_optype[3], D_optype[1:0]} == 3'b011);

// 选择 ALU 运算单元的操作数
assign alua_sel = {D_optype[3:2], D_optype[0]} == 3'b011;;
assign alub_sel = D_optype != `RFORMAT;

// IO读使能,IO写使能
// assign IO_rd_e  = D_optype == `LWINST;
assign IO_wr_e  = D_optype == `SFORMAT;

// 寄存器写数据选择
always @(D_optype) begin
    if (D_optype == `LWINST)    wd_sel = `WB_IO;
    else if (D_optype[3:1] == 3'b010)       // jalr 和 jal 指令
                                wd_sel = `WB_PC4;
    else if (D_optype[3:2] == 2'b11)        // 算数运算I型指令，U和R型指令
                                wd_sel = `WB_ALU;
    else                        wd_sel = `WB_NONE;
end

endmodule