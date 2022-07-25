// 分支选择比较器, 输出两个有符号数的比较结果
module branchcmp(
    input   wire[31:0]      rD1,            // 有符号数一
    input   wire[31:0]      rD2,            // 有符号数二
    output  wire            bEq,            // 比较结果相等
    output  wire            bLt             // 第一个有符号数小于第二个有符号数
);

// 相等标志
assign bEq  = rD1 == rD2;

wire [31:0] subres = rD1 + (~rD2 + 1);

// 小于标志
assign bLt  =   
        ~(rD1[31] == 0 && rD2[31] == 1) &&      // 两数不能是 前正后负
        ((rD1[31] == 1 && rD2[31] == 0) ||      // 正数与负数
        subres[31] == 1 );

endmodule