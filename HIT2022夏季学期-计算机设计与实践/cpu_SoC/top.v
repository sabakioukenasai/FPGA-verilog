// Add your code here, or replace this file
module top(
    input clk_i,
    input rst_i,
    // output        debug_wb_have_inst,   // WB阶段是否有指令 (对单周期CPU，此flag恒为1)
    // output [31:0] debug_wb_pc,          // WB阶段的PC (若wb_have_inst=0，此项可为任意值)
    // output        debug_wb_ena,         // WB阶段的寄存器写使能 (若wb_have_inst=0，此项可为任意值)
    // output [4:0]  debug_wb_reg,         // WB阶段写入的寄存器号 (若wb_ena或wb_have_inst=0，此项可为任意值)
    // output [31:0] debug_wb_value        // WB阶段写入寄存器的值 (若wb_ena或wb_have_inst=0，此项可为任意值)

// 八个数码管的使能信号
    output [ 7:0] led_en,

// 单个数码管显示信号
    output wire led_ca,
    output wire led_cb,
    output wire led_cc,
    output wire led_cd,
    output wire led_ce,
    output wire led_cf,
    output wire led_cg,
    output wire led_dp,

// 拨码开关输入信号
    input  [23:0]   switch,

// LED输出信号
    output [23:0]   led
);

wire            clk_unstb;
wire            clk_g = clk_unstb & locked;
wire            rst_n = ~rst_i;
wire [31:0]     pc_i, instruction;

// 从CPU接出的IO线路
wire [31:0]     IO_addr;
wire            IO_rd_e;
wire [31:0]     IO_rd_data;
wire            IO_wr_e;
wire [31:0]     IO_wr_data;

// 连接内存的IO线路
wire            mem_wr_e;
wire [31:0]     mem_addr;
wire [31:0]     mem_rd_data;
wire [31:0]     mem_wr_data;

// 连接其他外设的IO线路
wire [11:0]     dv_addr;
wire [31:0]     dv_rd_data;
wire [31:0]     dv_wr_data;
wire            dv_rd_e;
wire            dv_wr_e;

// 时钟分频
cpuclk U_cpuclk(
    .clk_in1    (clk_i      ),
    .clk_div    (clk_unstb  ),
    .locked     (locked     )
);

mini_rv mini_rv_u (
    .clk_i(clk_g),
    .rst_n(rst_n),

    .instruction(instruction),          // 指令输入
    .pc_i       (pc_i       ),          // 指令地址

    .IO_addr    (IO_addr),              // 访问内存地址
    .IO_rd_e    (IO_rd_e),              // 读IO使能信号
    .IO_rd_data (IO_rd_data),           // 从IO读出数据
    .IO_wr_e    (IO_wr_e),              // 写IO使能信号
    .IO_wr_data (IO_wr_data)            // 向IO写的数据

    // .debug_wb_have_inst     (debug_wb_have_inst ),          // WB阶段是否有指令 (对单周期CPU，此flag恒为1)
    // .debug_wb_pc            (debug_wb_pc        ),          // WB阶段的PC (若wb_have_inst=0，此项可为任意值)
    // .debug_wb_ena           (debug_wb_ena       ),          // WB阶段的寄存器写使能 (若wb_have_inst=0，此项可为任意值)
    // .debug_wb_reg           (debug_wb_reg       ),          // WB阶段写入的寄存器号 (若wb_ena或wb_have_inst=0，此项可为任意值)
    // .debug_wb_value         (debug_wb_value     )           // WB阶段写入寄存器的值 (若wb_ena或wb_have_inst=0，此项可为任意值)
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
    .a      (pc_i[15:2]  ),         // input wire [13:0] a
    .spo    (instruction )          // output wire [31:0] spo
);

// IO总线模块
iobus U_iobus(
    .addr_fromcpu       (IO_addr    ),
    .data_fromcpu       (IO_wr_data ),
    .data_tocpu         (IO_rd_data ),
    .tocpu_e            (IO_rd_e    ),
    .fromcpu_e          (IO_wr_e    ),

    .mem_addr           (mem_addr   ),
    .mem_rd_data        (mem_rd_data),
    .mem_wr_data        (mem_wr_data),
    .mem_wr_e           (mem_wr_e   ),

    .dv_addr            (dv_addr    ),
    .dv_wr_data         (dv_wr_data ),
    .dv_rd_data         (dv_rd_data ),
    .dv_wr_e            (dv_wr_e    ),
    .dv_rd_e            (dv_rd_e    )
);


/* ========== 下面模块最终集成到IO总线上 ========== */
// 64KB DRAM
dram U_dram (
    .clk    (clk_g),             // input wire clka
    .a      (mem_addr[15:2]),    // input wire [13:0] addra
    .spo    (mem_rd_data),       // output wire [31:0] douta
    .we     (mem_wr_e),          // input wire [0:0] wea
    .d      (mem_wr_data)        // input wire [31:0] dina
);

// 拨码开关 070
DIPswitch U_dipSwitch(
    .clk        (clk_g      ),
    .rst_n      (rst_n      ),
    .rd_ena     (dv_rd_e    ),
    .dv_addr    (dv_addr    ),
    .switch     (switch     ),
    .data_tocpu (dv_rd_data )
);

// LED 显示控制器 060
leddisplay U_leddisplay(
    .clk            (clk_g),
    .rst_n          (rst_n),
    .dv_wr_e        (dv_wr_e),
    .dv_addr        (dv_addr),
    .data_fromcpu   (dv_wr_data),
    .led            (led)
);

// 数码管显示控制器 000
tubedisplay U_tubedisplay(
    .clk            (clk_g),
    .rst_n          (rst_n),
    .disp_ena       (dv_wr_e),
    .dv_addr        (dv_addr),
    .disp_data      (dv_wr_data),
    .led_en         (led_en),
    .led_ca         (led_ca),
    .led_cb         (led_cb),
    .led_cc         (led_cc),
    .led_cd         (led_cd),
    .led_ce         (led_ce),
    .led_cf         (led_cf),
    .led_cg         (led_cg),
    .led_dp         (led_dp)
);

endmodule
