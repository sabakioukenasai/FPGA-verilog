module mini_rv(
    input   wire    rst_n,
    input   wire    clk_i,
    input  [31:0] instruction,          // 指令输入
    output [31:0] pc_i,                 // 指令地址(PC)
    
    // output [31:0] mem_addr,             // 访问内存地址
    // output        mem_rd_e,             // 读内存使能信号
    // output [31:0] mem_rd_o,             // 从内存读出数据
    // output        mem_wr_e,             // 写内存使能信号
    // output [31:0] mem_wr_i,             // 向内存写入数据

//  IO总线， 替代Mem接口
    output [31:0] IO_addr,             // 外设访问地址
    input  [31:0] IO_rd_data,          // 从IO读的数据
    output [31:0] IO_wr_data,          // 向IO写的数据
    output        IO_rd_e,             // IO读使能
    output        IO_wr_e              // IO写使能

    // output        debug_wb_have_inst,   // WB阶段是否有指令 (对单周期CPU，此flag恒为1)
    // output [31:0] debug_wb_pc,          // WB阶段的PC (若wb_have_inst=0，此项可为任意值)
    // output        debug_wb_ena,         // WB阶段的寄存器写使能 (若wb_have_inst=0，此项可为任意值)
    // output [4:0]  debug_wb_reg,         // WB阶段写入的寄存器号 (若wb_ena或wb_have_inst=0，此项可为任意值)
    // output [31:0] debug_wb_value        // WB阶段写入寄存器的值 (若wb_ena或wb_have_inst=0，此项可为任意值)
);

// 选择信号线路
wire [ 2:0] sext_op;            // 立即数拓展应当执行的操作
wire [ 2:0] alu_op;             // ALU 执行的运算工作
wire [ 1:0] wd_sel;             // 选择写回信号

// 更新PC信号线路
wire [31:0] pc4_i;              

// 寄存器文件接口线路
wire        rf_we;
wire [ 4:0] rf_rR1;
wire [ 4:0] rf_rR2;
wire [ 4:0] rf_wR;
wire [31:0] rf_rD1;
wire [31:0] rf_rD2;
reg  [31:0] rf_wD;                      // 写入寄存器的数据

// 立即数扩展
wire [24:0] imm_cut;
wire [31:0] imm_sext;

wire [31:0] alu_A = aluA_sel ? pc_i : rf_rD1;           // 选择alu运算源操作数A
wire [31:0] alu_B = aluB_sel ? imm_sext : rf_rD2;       // 选择alu运算源操作数B
wire [31:0] alu_res;                                    // ALU 计算结果

// debug信号
// assign debug_wb_have_inst   = 1'b1;         // 单周期CPU恒为1
// assign debug_wb_pc          = pc_i;         // 指令地址
// assign debug_wb_ena         = rf_we;
// assign debug_wb_reg         = rf_wR;
// assign debug_wb_value       = rf_wD;

assign IO_addr = (IO_rd_e || IO_wr_e) ? alu_res : 32'hFFFFFFFF;      // 设置读内存的地址
assign IO_wr_data = rf_rD2;                             // 设置写入内存的内容


// 取更新PC
pcUpdate U_pcUpdate (
    .clk_i          (clk_i          ),
    .rst_n          (rst_n          ),
    .npc_sel        (npc_sel        ),
    .alu_res        (alu_res        ),
    .pc             (pc_i           ),
    .pc4            (pc4_i          )
);

// 译码模块
idecode U_decoder(
    .instruction    (instruction    ),
    .rR1            (rf_rR1         ),
    .rR2            (rf_rR2         ),
    .wR             (rf_wR          ),
    .imm            (imm_cut        )
);

// 立即数拓展模块
sext U_sext(
    .sext_op        (sext_op    ),
    .imm            (imm_cut    ),
    .imm_sext       (imm_sext   )
);

// 选择写入寄存器的数据
always @(wd_sel or alu_res or IO_rd_data or pc4_i) begin
    case (wd_sel)
        2'b00:  rf_wD = alu_res;
        2'b01:  rf_wD = IO_rd_data;     // 从IO总线读入（内存连接在IO总线上）
        2'b10:  rf_wD = pc4_i;
        2'b11:  rf_wD = 32'b0;
    endcase
end

// 寄存器文件
register U_register(
    .clk_i          (clk_i  ),      // 时钟
    .rst_n          (rst_n  ),      // 复位信号
    .rR1            (rf_rR1 ),      // 第一个寄存器
    .rR2            (rf_rR2 ),      // 第二个寄存器
    .wR             (rf_wR  ),      // 写入寄存器
    .wD             (rf_wD  ),      // 写入数据
    .we             (rf_we  ),      // 写入使能
    .rD1            (rf_rD1 ),      // 寄存器一中的数据
    .rD2            (rf_rD2 )       // 寄存器二中的数据
);

// 比较器运算
branchcmp U_branchcmp(
    .rD1        (rf_rD1    ),
    .rD2        (rf_rD2    ),
    .bEq        (BrEq    ),
    .bLt        (BrLt    )
);

// ALU 运算模块
execute U_execute(
    .A          (alu_A      ),
    .alu_op     (alu_op     ),
    .B          (alu_B      ),
    .result     (alu_res    )
);

control U_control(
    .instruction    (instruction),          // 指令
    .BrEq           (BrEq       ),          // 比较相等信号
    .BrLt           (BrLt       ),          // 比较小于信号
    .sext_op        (sext_op    ),          // 拓展器选择
    .alu_op         (alu_op     ),          // alu运算模块选择
    .wd_sel         (wd_sel     ),          // 写回数据选择
    .npc_sel        (npc_sel    ),          // 下一指令选择
    .rf_we          (rf_we      ),          // 寄存器文件写使能
    .alua_sel       (aluA_sel   ),          // alu第一运算数选择
    .alub_sel       (aluB_sel   ),          // alu第二运算数选择
    .IO_rd_e        (IO_rd_e    ),          // IO读使能
    .IO_wr_e        (IO_wr_e    )           // IO写使能
);

endmodule