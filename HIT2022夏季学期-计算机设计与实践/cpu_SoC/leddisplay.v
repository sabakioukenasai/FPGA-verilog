module leddisplay
#(LEDADDR = 12'h060) (
    input   wire        clk,
    input   wire        rst_n,
    input   wire        dv_wr_e,
    input   wire [11:0] dv_addr,
    input   wire [31:0] data_fromcpu,
    output  reg  [23:0] led
);

wire work = dv_wr_e & (dv_addr == LEDADDR);

always @(posedge clk or negedge rst_n) begin
    if (~rst_n)
        led <= 24'b0;
    else if(work)
        led <= data_fromcpu[23:0];
    else
        led <= led;
end

endmodule