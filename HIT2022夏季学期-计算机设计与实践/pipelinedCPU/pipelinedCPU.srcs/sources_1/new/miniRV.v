`timescale 1ns / 1ps

module mini_rv(
    input   wire  rst_n,
    input   wire  clk_i,
    input  [31:0] instruction,          // 指令
    output [31:0] pc_i,                 // PC

//  IO信号
    output [31:0] IO_addr,             // IO地址
    input  [31:0] IO_rd_data,          // 从IO读的数据
    output [31:0] IO_wr_data,          // 向IO写的数据
    output        IO_wr_e              // IO 写使能

// // debug 信号
//     output        debug_wb_have_inst,   // WBé˜¶æ®µæ˜¯å¦æœ‰æŒ‡ä»? (å¯¹å•å‘¨æœŸCPUï¼Œæ­¤flagæ’ä¸º1)
//     output [31:0] debug_wb_pc,          // WBé˜¶æ®µçš„PC (è‹¥wb_have_inst=0ï¼Œæ­¤é¡¹å¯ä¸ºä»»æ„å??)
//     output        debug_wb_ena,         // WBé˜¶æ®µçš„å¯„å­˜å™¨å†™ä½¿èƒ? (è‹¥wb_have_inst=0ï¼Œæ­¤é¡¹å¯ä¸ºä»»æ„å??)
//     output [4:0]  debug_wb_reg,         // WBé˜¶æ®µå†™å…¥çš„å¯„å­˜å™¨å? (è‹¥wb_enaæˆ–wb_have_inst=0ï¼Œæ­¤é¡¹å¯ä¸ºä»»æ„å??)
//     output [31:0] debug_wb_value        // WBé˜¶æ®µå†™å…¥å¯„å­˜å™¨çš„å€? (è‹¥wb_enaæˆ–wb_have_inst=0ï¼Œæ­¤é¡¹å¯ä¸ºä»»æ„å??)
);

// State 控制信号
wire [ 2:0] ctl_F_state;        // 更新PC、取值阶段的状态
wire [ 2:0] ctl_D_state;        // 取值阶段的状态
wire [ 2:0] ctl_E_state;        // 执行阶段的状态


/* =======================================================================
                              更新PC、取值阶段
========================================================================== */

// PC预测模块

// 定义此阶段的线路
wire    [31:0]      f_pc;
wire    [ 6:0]      f_func7 = instruction[31:25];
wire    [ 4:0]      f_rS2   = instruction[24:20];
wire    [ 4:0]      f_rS1   = instruction[19:15];
wire    [ 2:0]      f_func3 = instruction[14:12];
wire    [ 4:0]      f_rW    = instruction[11: 7];
wire    [ 6:0]      f_opcode= instruction[ 6: 0];
reg     [ 3:0]      f_optype;

// 提前声明 Execute 阶段的信号
wire    [31:0]  e_alu_res;
wire            e_branch;

// 更新PC
pcupdate U_pcupdate (
    .clk_i          (clk_i          ),
    .rst_n          (rst_n          ),
    .f_state        (ctl_F_state    ),
    .npc_sel        (e_branch       ),      // 使用执行阶段的分支选择结果
    .alu_res        (e_alu_res      ),      // 使用执行阶段计算出的结果
    .pc             (f_pc           )
);

assign pc_i = f_pc;             // PC为取指阶段的PC

// 计算编码类型
always @(f_opcode) begin
    case (f_opcode)
        7'b0000011:     f_optype = `LWINST;
        7'b1100111:     f_optype = `JALRINST;
        7'b0100011:     f_optype = `SFORMAT;
        7'b1101111:     f_optype = `JFORMAT;    
        7'B1100011:     f_optype = `BFORMAT;
        7'b0010011:     f_optype = `NIFORMAT;
        7'b0110111:     f_optype = `UFORMAT;
        7'b0110011:     f_optype = `RFORMAT;
        default:        f_optype = `NONETYPE;
    endcase
end

/* =======================================================================
                                  译码阶段
========================================================================== */

// 定义译码阶段寄存器引出的线路
wire    [31:0]      D_pc;
wire    [ 6:0]      D_func7;
wire    [ 4:0]      D_rS2;
wire    [ 4:0]      D_rS1;
wire    [ 2:0]      D_func3;
wire    [ 4:0]      D_rW;
wire    [ 3:0]      D_optype;

// 取指——译码阶段寄存器
if_id_reg   U_if_id_reg(
    .clk_i      (clk_i      ),
    .rst_n      (rst_n      ),
    .ctl_D_state(ctl_D_state),

    .f_pc       (f_pc       ),
    .f_func7    (f_func7    ),
    .f_rS2      (f_rS2      ),
    .f_rS1      (f_rS1      ),
    .f_func3    (f_func3    ),
    .f_rW       (f_rW       ),
    .f_optype   (f_optype   ),

    .D_pc       (D_pc       ),
    .D_func7    (D_func7    ),
    .D_rS2      (D_rS2      ),
    .D_rS1      (D_rS1      ),
    .D_func3    (D_func3    ),
    .D_rW       (D_rW       ),
    .D_optype   (D_optype   )
);

// 定义译码阶段计算出的线路
wire    [31:0]      d_immsext;      // 符号扩展后的立即数
wire    [ 4:0]      d_rS2;          // 根据optype重新指定寄存器
wire    [ 4:0]      d_rS1;          // 根据optype重新指定寄存器
wire    [ 4:0]      d_rW;           // 根据optype重新指定寄存器
wire    [ 3:0]      d_alu_op;       // ALU 运算选择
wire    [ 1:0]      d_wd_sel;       // 写回寄存器数据选择
wire                d_rf_we;        // 写寄存器使能
wire                d_alua_sel;     // 选择ALU第一运算数
wire                d_alub_sel;     // 选择ALU第二运算数
wire                d_IO_wr_e;      // IO写使能


/**
 * 译码模块
 * 1 根据指令的各个部分完成立即数拓展
 * 2 改写rS1、rS2和rW，如果没有用到寄存器，则将相应寄存器编号置为0
 * 3 计算alu运算选择信号、写回寄存器数据选择信号、写回寄存器使能、alua选择信号、
 *     alub选择信号、IO读信号和IO写信号
 */
idecode U_decoder(
    .D_func7    (D_func7    ),
    .D_rS2      (D_rS2      ),
    .D_rS1      (D_rS1      ),
    .D_func3    (D_func3    ),
    .D_rW       (D_rW       ),
    .D_optype   (D_optype   ),
    .imm_sext   (d_immsext  ),
    .d_rS2      (d_rS2      ),
    .d_rS1      (d_rS1      ),
    .d_rW       (d_rW       ),
    .alu_op     (d_alu_op   ),
    .wd_sel     (d_wd_sel   ),
    .rf_we      (d_rf_we    ),
    .alua_sel   (d_alua_sel ),
    .alub_sel   (d_alub_sel ),
    .IO_wr_e    (d_IO_wr_e  )
);

// 定义读写寄存器的线路
wire    [31:0]  d_rf_rD1;           // 从寄存器一读出的数据
wire    [31:0]  d_rf_rD2;           // 从寄存器二读出的数据

// 真正进入下一阶段的数据——通过数据转发实现
// 在控制模块中的forward中为这两条线路赋值
wire    [31:0]  d_rD1;
wire    [31:0]  d_rD2;

// 提前定义 Write back 阶段的线路
wire        W_rf_we;        // 写寄存器使能
wire [ 4:0] W_rW;          // 写寄存器编号
wire [31:0] w_rf_wD;        // 写回寄存器的数据

// 寄存器文件
// 数据转发的方法并不是提前写回，而是“篡改”从寄存器读出的数据
regfile U_regfile(
    .clk_i          (clk_i      ),      // 时钟信号
    .rst_n          (rst_n      ),      // rst_n 复位信号
    .rS1            (d_rS1      ),      // 寄存器一编号
    .rS2            (d_rS2      ),      // 寄存器二编号
    .rW             (W_rW       ),      // 写回寄存器编号
    .wD             (w_rf_wD    ),      // 使用写回阶段计算出的 写回寄存器的数据
    .we             (W_rf_we    ),      // 使用写回阶段计算出的 写寄存器使能
    .rD1            (d_rf_rD1   ),      // 从寄存器一读出的数据
    .rD2            (d_rf_rD2   )       // 从寄存器二读出的数据
);

// // 此处方便后文进行转发拓展
// assign d_rD1    = rf_rD1;
// assign d_rD2    = rf_rD2;

/* =======================================================================
                                  执行阶段
========================================================================== */

// 定义执行阶段从寄存器引出的线路
wire    [31:0]  E_pc;
wire    [ 2:0]  E_func3;
wire    [ 3:0]  E_optype;
wire    [31:0]  E_immsext;
wire    [31:0]  E_rD1;
wire    [31:0]  E_rD2;
wire    [ 4:0]  E_rW;
wire    [ 3:0]  E_alu_op;
wire    [ 2:0]  E_state;
wire    [ 1:0]  E_wd_sel;
wire            E_rf_we;
wire            E_alua_sel;
wire            E_alub_sel;
wire            E_IO_wr_e;


// 译码——执行阶段的寄存器
id_exc_reg U_id_exc_reg(
    .clk_i      (clk_i      ),
    .rst_n      (rst_n      ),
    .ctl_E_state(ctl_E_state),

    .D_pc       (D_pc       ),
    .D_func3    (D_func3    ),
    .D_optype   (D_optype   ),
    .d_immsext  (d_immsext  ),
    .d_rD1      (d_rD1      ),
    .d_rD2      (d_rD2      ),
    .d_rW       (d_rW       ),
    .d_alu_op   (d_alu_op   ),      // ALU 运算选择
    .d_wd_sel   (d_wd_sel   ),      // 写回寄存器数据选择
    .d_rf_we    (d_rf_we    ),      // 写寄存器使能
    .d_alua_sel (d_alua_sel ),      // 选择ALU第一运算数
    .d_alub_sel (d_alub_sel ),      // 选择ALU第二运算数
    .d_IO_wr_e  (d_IO_wr_e  ),      // IO写使能

    .E_pc       (E_pc       ),
    .E_func3    (E_func3    ),
    .E_optype   (E_optype   ),
    .E_immsext  (E_immsext  ),
    .E_rD1      (E_rD1      ),
    .E_rD2      (E_rD2      ),
    .E_rW       (E_rW       ),
    .E_alu_op   (E_alu_op   ),      // ALU 运算选择
    .E_wd_sel   (E_wd_sel   ),      // 写回寄存器数据选择
    .E_rf_we    (E_rf_we    ),      // 写寄存器使能
    .E_alua_sel (E_alua_sel ),      // 选择ALU第一运算数
    .E_alub_sel (E_alub_sel ),      // 选择ALU第二运算数
    .E_IO_wr_e  (E_IO_wr_e  )       // IO写使能
);

// 分支选择模块，根据计算较结果选择分支
branchsel U_branchsel(
    .E_rD1      (E_rD1      ),
    .E_rD2      (E_rD2      ),
    .E_optype   (E_optype   ),
    .E_func3    (E_func3    ),
    .e_branch   (e_branch   )
);

// 定义在此阶段计算出的线路
wire    [31:0]  e_alu_A = E_alua_sel ? E_pc      : E_rD1;            
wire    [31:0]  e_alu_B = E_alub_sel ? E_immsext : E_rD2;

// ALU 运算模块
alu U_alu(
    .alu_op     (E_alu_op     ),
    .A          (e_alu_A      ),
    .B          (e_alu_B      ),
    .result     (e_alu_res    )
);

/* =======================================================================
                                 访存阶段
========================================================================== */

// 定义访存阶段的线路
wire [31:0] M_pc;
wire [31:0] M_rD2;
wire [ 4:0] M_rW;
wire [ 3:0] M_optype;
wire [ 1:0] M_wd_sel;       // 写回寄存器数据选择
wire        M_rf_we;        // 写寄存器使能
wire        M_IO_wr_e;      // IO写使能
wire [31:0] M_alu_res;      // 执行阶段的计算结果

// 执行——访存阶段寄存器
exc_mmr_reg U_exc_mmr_reg(
    .clk_i      (clk_i      ),
    .rst_n      (rst_n      ),

    .E_pc       (E_pc       ),
    .E_rD2      (E_rD2      ),
    .E_rW       (E_rW       ),
    .E_optype   (E_optype   ),
    .E_wd_sel   (E_wd_sel   ),      // 写回寄存器数据选择
    .E_rf_we    (E_rf_we    ),      // 写寄存器使能
    .E_IO_wr_e  (E_IO_wr_e  ),      // IO写使能
    .e_alu_res  (e_alu_res  ),      // ALU 运算结果

    .M_pc       (M_pc       ),
    .M_rD2      (M_rD2      ),
    .M_rW       (M_rW       ),
    .M_optype   (M_optype   ),
    .M_wd_sel   (M_wd_sel   ),      // 写回寄存器数据选择
    .M_rf_we    (M_rf_we    ),      // 写寄存器使能
    .M_IO_wr_e  (M_IO_wr_e  ),      // IO写使能
    .M_alu_res  (M_alu_res  )
);

// 连接到IO的数据通路
wire [31:0] m_rd_data = IO_rd_data;     // 访存阶段从IO读入的数据
assign IO_addr = M_alu_res;             // 地址
assign IO_wr_e = M_IO_wr_e;             // 写使能
assign IO_wr_data = M_rD2;              // 写数据

/* =======================================================================
                                 写回阶段
========================================================================== */      

// 定义写回阶段的信号
wire [31:0] W_pc;
wire [ 3:0] W_optype;
wire [ 1:0] W_wd_sel;       // 写回寄存器数据选择
wire [31:0] W_alu_res;      // 执行阶段的计算结果
wire [31:0] W_rd_data;      // 访存阶段读取的数据


// 写回阶段的寄存器
mmr_wb_reg U_mmr_wb_reg(
    .clk_i      (clk_i      ),
    .rst_n      (rst_n      ),

    .M_pc       (M_pc       ),
    .M_rW       (M_rW       ),
    .M_optype   (M_optype   ),
    .M_wd_sel   (M_wd_sel   ),      // 写回寄存器数据选择
    .M_rf_we    (M_rf_we    ),      // 写寄存器使能
    .M_alu_res  (M_alu_res  ),      // ALU 运算结果
    .m_rd_data  (m_rd_data  ),      // 访存阶段读入的数据

    .W_pc       (W_pc       ),
    .W_rW       (W_rW       ),
    .W_optype   (W_optype   ),
    .W_wd_sel   (W_wd_sel   ),      // 写回寄存器数据选择
    .W_rf_we    (W_rf_we    ),      // 写寄存器使能
    .W_alu_res  (W_alu_res  ),      // ALU 计算结果
    .W_rd_data  (W_rd_data  )       // 访存阶段计算的数据
);

// 定义写回阶段产生的数据
// 写回寄存器的数据
assign w_rf_wD  = W_wd_sel == `WB_ALU   ? W_alu_res
                : W_wd_sel == `WB_IO    ? W_rd_data
                : W_wd_sel == `WB_PC4   ? W_pc + 3'b100
                : 32'b0;

// // 写回阶段 debug 信号
// assign debug_wb_have_inst   = W_optype != `NONETYPE;
// assign debug_wb_pc          = W_pc;
// assign debug_wb_ena         = W_rf_we;
// assign debug_wb_reg         = W_rW;
// assign debug_wb_value       = W_rf_we ? w_rf_wD : 32'b0;


/* =======================================================================
                                 控制模块
========================================================================== */      

// 控制模块一：转发控制模块（解决数据冒险）
forward U_forward(
// decode 阶段信号
    .d_rf_rD1   (d_rf_rD1   ),
    .d_rf_rD2   (d_rf_rD2   ),
    .d_rS1      (d_rS1      ),
    .d_rS2      (d_rS2      ),

// execute 阶段信号
    .e_alu_res  (e_alu_res  ),
    .E_pc       (E_pc       ),
    .E_rW       (E_rW       ),
    .E_wd_sel   (E_wd_sel   ),

// memory 阶段信号
    .M_pc       (M_pc       ),
    .M_alu_res  (M_alu_res  ),
    .m_rd_data  (m_rd_data  ),
    .M_rW       (M_rW       ),
    .M_wd_sel   (M_wd_sel   ),

// 写回阶段信号
    .w_rf_wD    (w_rf_wD    ),
    .W_rW       (W_rW       ),
    .W_wd_sel   (W_wd_sel   ),

// 转发后选择出的信号
    .d_rD1      (d_rD1      ),
    .d_rD2      (d_rD2      )
);

haltctrl U_haltctrl(
    .d_rS1          (d_rS1          ),
    .d_rS2          (d_rS2          ),

    .E_rW           (E_rW           ),
    .E_wd_sel       (E_wd_sel       ),
    .e_branch       (e_branch       ),

    .ctl_F_state    (ctl_F_state    ),
    .ctl_D_state    (ctl_D_state    ),
    .ctl_E_state    (ctl_E_state    )
);


endmodule