module DIPswitch
#(parameter DIPADDR = 12'h070) (
    input   wire [11:0]     dv_addr,
    input   wire [23:0]     swtch,
    output       [31:0]     data_tocpu
);

assign data_tocpu = (dv_addr == DIPADDR) ? {8'b0, swtch} : 32'b0;

endmodule