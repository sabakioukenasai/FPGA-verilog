module calculator_anti_shake(
    input wire      clk_g,
    input wire      rst_n,
    input wire      button,
    output wire     button_good
);

reg [19:0]  cnt;
reg         button_r_next;
wire        cnt_end = cnt == 20'd1000000 - 1'b1;

always@(posedge clk_g or negedge rst_n) begin
    if (~rst_n)         cnt <= 20'b0;
    else if (cnt_end)   cnt <= 20'b0;
    else                cnt <= cnt + 1'b1; 
end

always@(posedge clk_g or negedge rst_n) begin
    if (~rst_n)         button_r_next <= 1'b0;
    else if (cnt_end)   button_r_next <= button;
end

assign  button_good = button_r_next;

endmodule