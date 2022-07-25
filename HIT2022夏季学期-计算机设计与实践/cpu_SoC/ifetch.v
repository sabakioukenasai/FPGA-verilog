module ifetch(
    input   wire            clk_i,
    input   wire            rst_i,
    input   wire            npc_sel,
    input   wire [15:0]     alu_res,
    output  reg  [15:0]     pc,
    output  wire [15:0]     pc4
);

always @(rst_i) begin
    if (rst_i)    pc = 16'b0;
end

assign pc4 = pc + 3'b100;       // 下一条指令的地址

// 更新pc使用时序逻辑
always @(posedge clk_i) begin
    if (npc_sel == 1'b0)
        pc <= pc4;              // 如果不选择分支，设置pc为下一条指令
    else
        pc <= alu_res;          // 否则跳转到ALU指令执行结果
end


endmodule