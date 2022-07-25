module register(
    input   wire            clk_i,      // 时钟
    input   wire            rst_n,      // 初始化信号
    input   wire [ 4:0]     rR1,        // 第一个寄存器
    input   wire [ 4:0]     rR2,        // 第二个寄存器
    input   wire [ 4:0]     wR,         // 写入寄存器
    input   wire [31:0]     wD,         // 写入数据
    input   wire            we,         // 写入使能
    output  wire [31:0]     rD1,        // 寄存器一中的数据
    output  wire [31:0]     rD2         // 寄存器二中的数据
);

reg [31:0] x [31:0];                    // 32个 32bits 寄存器

// 写入使用时序逻辑实现
always @(posedge clk_i or negedge rst_n) begin
    if (~rst_n) begin
        x[0] <= 32'b0;
        x[1] <= 32'b0;
        x[2] <= 32'b0;
        x[3] <= 32'b0;
        x[4] <= 32'b0;
        x[5] <= 32'b0;
        x[6] <= 32'b0;
        x[7] <= 32'b0;
        x[8] <= 32'b0;
        x[9] <= 32'b0;
        x[10] <= 32'b0;
        x[11] <= 32'b0;
        x[12] <= 32'b0;
        x[13] <= 32'b0;
        x[14] <= 32'b0;
        x[15] <= 32'b0;
        x[16] <= 32'b0;
        x[17] <= 32'b0;
        x[18] <= 32'b0;
        x[19] <= 32'b0;
        x[20] <= 32'b0;
        x[21] <= 32'b0;
        x[22] <= 32'b0;
        x[23] <= 32'b0;
        x[24] <= 32'b0;
        x[25] <= 32'b0;
        x[26] <= 32'b0;
        x[27] <= 32'b0;
        x[28] <= 32'b0;
        x[29] <= 32'b0;
        x[30] <= 32'b0;
        x[31] <= 32'b0;
    end
    else if (we == 1'b1 && wR != 5'b00000)
        x[wR] <= wD;
end

assign rD1 = x[rR1];                    // 读出作为组合逻辑
assign rD2 = x[rR2];

endmodule