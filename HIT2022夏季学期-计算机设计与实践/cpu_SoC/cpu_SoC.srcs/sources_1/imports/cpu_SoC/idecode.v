
module idecode(
    input   wire [31:0]     instruction,    // 指令
    output  wire [ 4:0]     rR1,            // 第一源寄存器
    output  wire [ 4:0]     rR2,            // 第二源寄存器
    output  wire [ 4:0]     wR,             // 写寄存器
    output  wire [24:0]     imm             // 所有立即数共用的范围
);

// R-format opcode          01100 11
// I-format opcode          00100 11
//          load opcode     00000 11
//          jalr opcode     11001 11
// S-format opcode          01000 11
// B-format opcode          11000 11
// U-format opcode  lui     01101 11
// J-format opcode          11011 11


// wire Rformat = instruction[6:2] == 5'b01100;
wire Iformat = instruction[6:2] == 5'b00100 || instruction[6:2] == 5'b00000 || instruction[6:2] == 5'b11001;
wire Sformat = instruction[6:2] == 5'b01000;
wire Bformat = instruction[6:2] == 5'b11000;
wire Uformat = instruction[6:2] == 5'b01101;
wire Jformat = instruction[6:2] == 5'b11011;

assign rR1  = (           Uformat || Jformat) ? 5'b00000 : instruction[19:15];
assign rR2  = (Iformat || Uformat || Jformat) ? 5'b00000 : instruction[24:20];
assign wR   = (Sformat || Bformat           ) ? 5'b00000 : instruction[11:7];
assign imm  = instruction[31:7];

endmodule