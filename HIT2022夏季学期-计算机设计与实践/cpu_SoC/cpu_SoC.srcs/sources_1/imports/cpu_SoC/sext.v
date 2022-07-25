module sext(
    input   wire [ 2:0]     sext_op,        // 操作选项
    input   wire [24:0]     imm,            // 输入的立即数
    output  reg  [31:0]     imm_sext        // 符号拓展
);

// I-format case 1    001
// I-format case 2    011
// S-format     000
// B-format     010
// U-format     100
// J-format     110

// assign imm_sext = 
// (sext_op[0] == 0) 
// ?   ( sext_op[2] == 0
//                             // Sformat                              & Bformat
//     ?   ( sext_op[1] == 0 ? {{20{imm[24]}}, imm[14:18], imm[4:0]} : {{20{imm[24]}}, imm[0] , imm[23:18], imm[4:1], 1'b0} )
//                             // Uformat      & Jformat
//     :   ( sext_op[1] == 0 ? {imm, 12'b0} : {{12{imm[24]}}, imm[12:5], imm[13], imm[23:14], 1'b0} )
//     )
// :   ( sext_op[2] == 0
//                             // Icase1                   & Icase2
//     ?   ( sext_op[1] == 0 ? {{20{imm[24]}}, imm[24:13]} : {27'b0, imm[17:13]} )
//     :   32'b0       // other case
//     );

always @(*) begin
    case (sext_op)
        3'b001:     imm_sext = {{20{imm[24]}}, imm[24:13]};     // Icase1
        3'b011:     imm_sext = {27'b0, imm[17:13]};             // Icase2
        3'b000:     imm_sext = {{21{imm[24]}}, imm[23:18], imm[4:0]};       // Sformat
        3'b010:     imm_sext = {{20{imm[24]}}, imm[0] , imm[23:18], imm[4:1], 1'b0};    // Bformat
        3'b100:     imm_sext = {imm[24:5], 12'b0};                    // Uformat
        3'b110:     imm_sext = {{12{imm[24]}}, imm[12:5], imm[13], imm[23:14], 1'b0};   // Jformat
        default:    imm_sext = 32'b0;
    endcase
end

endmodule