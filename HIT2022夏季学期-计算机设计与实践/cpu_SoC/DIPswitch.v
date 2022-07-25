module DIPswitch
#(parameter DIPADDR = 12'h070) (
    input   wire            clk,
    input   wire            rst_n,
    input   wire            rd_ena,
    input   wire [11:0]     dv_addr,
    input   wire [23:0]     switch,
    output  reg  [31:0]     data_tocpu
);

// 工作信号
wire working = rd_ena & (dv_addr == DIPADDR);

always @(*) begin
    if (~rst_n)
        data_tocpu = 32'b0;
    else if(working)
        data_tocpu = {8'b0, switch};
end

endmodule