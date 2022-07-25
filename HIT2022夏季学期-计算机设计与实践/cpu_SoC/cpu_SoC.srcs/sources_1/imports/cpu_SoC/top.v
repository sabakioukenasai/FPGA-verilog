// Add your code here, or replace this file
module top(
    input clk,
    input rst_n,
    output        debug_wb_have_inst,   // WB阶段是否有指令 (对单周期CPU，此flag恒为1)
    output [31:0] debug_wb_pc,          // WB阶段的PC (若wb_have_inst=0，此项可为任意值)
    output        debug_wb_ena,         // WB阶段的寄存器写使能 (若wb_have_inst=0，此项可为任意值)
    output [4:0]  debug_wb_reg,         // WB阶段写入的寄存器号 (若wb_ena或wb_have_inst=0，此项可为任意值)
    output [31:0] debug_wb_value        // WB阶段写入寄存器的值 (若wb_ena或wb_have_inst=0，此项可为任意值)
);

wire [31:0]     pc_i, instruction;
wire [31:0]     mem_addr;
wire [31:0]     mem_rd_e;
wire [31:0]     mem_rd_o;
wire [31:0]     mem_wr_e;
wire [31:0]     mem_wr_i;

mini_rv mini_rv_u (
    .clk_i(clk),
    .rst_n(rst_n),

    .instruction(instruction),          // 指令输入
    .pc_i       (pc_i       ),          // 指令地址

    .mem_addr(mem_addr),                // 访问内存地址
    .mem_rd_e(mem_rd_e),                // 读内存使能信号
    .mem_rd_o(mem_rd_o),                // 从内存读出数据
    .mem_wr_e(mem_wr_e),                // 写内存使能信号
    .mem_wr_i(mem_wr_i),                // 向内存写入数据

    .debug_wb_have_inst     (debug_wb_have_inst ),          // WB阶段是否有指令 (对单周期CPU，此flag恒为1)
    .debug_wb_pc            (debug_wb_pc        ),          // WB阶段的PC (若wb_have_inst=0，此项可为任意值)
    .debug_wb_ena           (debug_wb_ena       ),          // WB阶段的寄存器写使能 (若wb_have_inst=0，此项可为任意值)
    .debug_wb_reg           (debug_wb_reg       ),          // WB阶段写入的寄存器号 (若wb_ena或wb_have_inst=0，此项可为任意值)
    .debug_wb_value         (debug_wb_value     )           // WB阶段写入寄存器的值 (若wb_ena或wb_have_inst=0，此项可为任意值)
);

// // 下面两个模块，只需要实例化并连线，不需要添加文件
// inst_mem imem(
//     .a      (pc_i[17:2] ),
//     .spo    (instruction)
// );

// data_mem dmem(
//     .clk    (clk),              // input wire clka
//     .a      (mem_addr[17:2]),   // input wire [15:0] addra
//     .spo    (mem_rd_o),         // output wire [31:0] douta
//     .we     (mem_wr_e),         // input wire [0:0] wea
//     .d      (mem_wr_i)          // input wire [31:0] dina
// );

// 64KB IROM
prgrom U0_irom (
    .a      (pc_i[15:2]  ),     // input wire [13:0] a
    .spo    (instruction)       // output wire [31:0] spo
);


// 64KB DRAM
dram U_dram (
    .clk    (clk),             // input wire clka
    .a      (mem_addr[15:2]),    // input wire [13:0] addra
    .qspo   (mem_rd_o),          // output wire [31:0] douta
    .we     (mem_wr_e),          // input wire [0:0] wea
    .d      (mem_wr_i)           // input wire [31:0] dina
);

endmodule
