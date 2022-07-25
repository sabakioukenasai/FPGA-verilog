module control(
    input   wire [31:0]     instruction,        // 指令
    input   wire            BrEq,               // 比较相等信号
    input   wire            BrLt,               // 比较小于信号
    output  reg  [ 2:0]     sext_op,            // 拓展器选择
    output  reg  [ 2:0]     alu_op,             // alu运算模块选择
    output  reg  [ 1:0]     wd_sel,             // 写回数据选择
    output  wire            npc_sel,            // 下一指令选择
    output  wire            rf_we,              // 寄存器文件读使能
    output  wire            alua_sel,           // alu第一运算数选择
    output  wire            alub_sel,           // alu第二运算数选择
    output  wire            IO_rd_e,            // 内存读使能
    output  wire            IO_wr_e             // 内存写使能 
);


// 必备24条指令中，opcode对应的指令类型
wire Rformat = instruction[6:2] == 5'b01100;
wire Iformat = instruction[6:2] == 5'b00100 || instruction[6:2] == 5'b00000 || instruction[6:2] == 5'b11001;
wire NIformat = instruction [6:2] == 5'b00100;
wire Sformat = instruction[6:2] == 5'b01000;
wire Bformat = instruction[6:2] == 5'b11000;
wire Uformat = instruction[6:2] == 5'b01101;
wire Jformat = instruction[6:2] == 5'b11011;

// 特殊的两条指令：lw 和 jalr
wire lwInst     = instruction[6:2] == 5'b00000;
wire jalrInst   = instruction[6:2] == 5'b11001;

/*
以下情况npc选择 ALU 的计算结果：
 1 B型指令满足跳转条件
 2 I型指令中的 jalr 指令
 4 J型指令中的 jal  指令
*/
assign npc_sel = Bformat && (BrEq && instruction[14:12] == 3'b000
                        || !BrEq && instruction[14:12] == 3'b001
                        ||  BrLt && instruction[14:12] == 3'b100
                        || !BrLt && instruction[14:12] == 3'b101)
                || jalrInst || Jformat;

// 寄存器写使能
assign rf_we = ~(Sformat || Bformat);

// 选择 ALU 运算单元的操作数
assign alua_sel = Bformat || Jformat;
assign alub_sel = ~Rformat;

// DRAM读使能
assign IO_rd_e  = lwInst || Sformat;

// DRAM写使能
assign IO_wr_e  = Sformat;

// 寄存器写数据选择
always @(*) begin
    if (lwInst)         wd_sel = 2'b01;
    else if (jalrInst || Jformat)
                        wd_sel = 2'b10;
    else if (Rformat || NIformat || Uformat)
                        wd_sel = 2'b00;
    else                wd_sel = 2'b11;
end

// 选择SEXT立即数扩展的方式
always @(*) begin
    if (Iformat) begin
        if (instruction[14:12] == 3'b001 || instruction == 3'b101)
            sext_op = 3'b011;
        else 
            sext_op = 3'b001;
    end
    else if (Sformat)   sext_op = 3'b000;
    else if (Bformat)   sext_op = 3'b010;
    else if (Uformat)   sext_op = 3'b100;
    else if (Jformat)   sext_op = 3'b110;
    else                sext_op = 3'b111;
end


// 确定 ALU 运算类型
always @(*) begin
    if ((Rformat && {instruction[30], instruction[14:12]} == 4'b0)
    || (Iformat && instruction[14:12] == 3'b000) || lwInst
    || Sformat || Bformat || Uformat || Jformat)
                                                    alu_op = 3'b000;        // add
    else if (Rformat && {instruction[30], instruction[14:12]} == 4'b1000)
                                                    alu_op = 3'b001;        // sub
    else if (instruction[14:12] == 3'b111)          alu_op = 3'b010;        // and
    else if (instruction[14:12] == 3'b110)          alu_op = 3'b011;        // or
    else if (instruction[14:12] == 3'b100)          alu_op = 3'b100;        // xor
    else if (instruction[14:12] == 3'b001)          alu_op = 3'b101;        // sll
    else if (instruction[30] == 0)                  alu_op = 3'b110;        // srl
    else                                            alu_op = 3'b111;        // sra
end

endmodule