    `timescale 1ns / 1ps
    //////////////////////////////////////////////////////////////////////////////////
    // Company: HITSZ CS 2020 Class 2001110
    // Engineer: 200111028 WWH
    // 
    // Create Date: 2022/07/05 19:52:37
    // Design Name: 
    // Module Name: D_reg
    // Project Name: 
    // Target Devices: 
    // Tool Versions: 
    // Description: 
    //  译码阶段寄存器
    // Dependencies: 
    // 
    // Revision:
    // Revision 0.01 - File Created
    // Additional Comments:
    // 
    //////////////////////////////////////////////////////////////////////////////////

    `include "param.v"

    module if_id_reg(
        input   wire    clk_i,
        input   wire    rst_n,
        input   [ 2:0]  ctl_D_state,

        input   [31:0]  f_pc,
        input   [ 6:0]  f_func7,
        input   [ 4:0]  f_rS1,
        input   [ 4:0]  f_rS2,
        input   [ 2:0]  f_func3,
        input   [ 4:0]  f_rW,
        input   [ 3:0]  f_optype,

        output  reg [31:0]  D_pc,
        output  reg [ 6:0]  D_func7,
        output  reg [ 4:0]  D_rS1,
        output  reg [ 4:0]  D_rS2,
        output  reg [ 2:0]  D_func3,
        output  reg [ 4:0]  D_rW,
        output  reg [ 3:0]  D_optype
    );

    always @(posedge clk_i or negedge rst_n) begin
        if (~rst_n || ctl_D_state == `STATE_IDLE) begin
            D_pc        <= 32'b0;
            D_func7     <= 7'b0;
            D_rS1       <= 5'b0;
            D_rS2       <= 5'b0;
            D_func3     <= 3'b0;
            D_rW        <= 5'b0;
            D_optype    <= `NONETYPE;
        end
        else if (ctl_D_state == `STATE_WORK) begin
            D_pc      <= f_pc;
            D_func7   <= f_func7;
            D_rS1     <= f_rS1;
            D_rS2     <= f_rS2;
            D_func3   <= f_func3;
            D_rW      <= f_rW;
            D_optype  <= f_optype;
        end
    end

    endmodule
