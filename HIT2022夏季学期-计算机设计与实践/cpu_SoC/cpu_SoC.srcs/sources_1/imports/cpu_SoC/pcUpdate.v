module pcUpdate(
    input   wire            clk_i,
    input   wire            rst_n,
    input   wire            npc_sel,
    input   wire [31:0]     alu_res,
    output  reg  [31:0]     pc,
    output  wire [31:0]     pc4
);

// 更新pc使用时序逻辑
always @(posedge clk_i or negedge rst_n) begin
    if (~rst_n) begin
        pc <= 32'hFFFFFFFC;
    end
    else if (npc_sel == 1'b0)
        pc <= pc4;              // 如果不选择分支，设置pc为下一条指令
    else
        pc <= alu_res;          // 否则跳转到ALU指令执行结果
end

assign pc4 = pc + 3'b100;       // 下一条指令的地址

endmodule