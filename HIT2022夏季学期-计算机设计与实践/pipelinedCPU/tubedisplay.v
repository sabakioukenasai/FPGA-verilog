module tubedisplay(
    input   wire        clk,
    input   wire        rst_n,
    input   wire        disp_ena,
    input   wire [11:0] dv_addr,
    input   wire [31:0] disp_data,

    output reg  [ 7:0]  led_en,
    output reg          led_ca,
    output reg          led_cb,
    output reg          led_cc,
    output reg          led_cd,
    output reg          led_ce,
    output reg          led_cf,
    output reg          led_cg,
    output wire         led_dp
);

parameter   ZERO = 7'b1000000, ONE = 7'b1111001, TWO = 7'b0100100, THREE = 7'b0110000, FOUR = 7'b0011001,
             FIVE = 7'b0010010, SIX = 7'b0000010, SEVEN = 7'b1111000, EIGHT = 7'b0000000, NINE = 7'b0011000,
             A = 7'b0001000, B = 7'b0000011, C = 7'b0100111, D = 7'b0100001, E = 7'b0000110, F = 7'b0001110,
             NONE = 7'b1111111;
parameter   twcle = 10000, TUBEADDR = 12'h000;

reg [31:0]  disp_data_reg;
reg [15:0]  cnt;
reg [ 3:0]  led_num;

wire before_end = (cnt == twcle - 2);
wire cnt_end = (cnt == twcle - 1);
wire cnt_inc = (cnt < twcle - 1);

wire work = disp_ena & (dv_addr == TUBEADDR);       // 定义工作信号

assign  led_dp = 1'b1;

always@(posedge clk or negedge rst_n) begin
    if (~rst_n)         cnt <= 16'b0;
    else if (cnt_inc)   cnt <= cnt + 16'b1;
    else                cnt <= 16'b0;
end

always @(posedge clk or negedge rst_n) begin
    if (~rst_n)         disp_data_reg <= 32'b0;
    else if (work)      disp_data_reg <= disp_data;
    else                disp_data_reg <= disp_data_reg;
end

always@(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        led_en  <= 8'b11111111;
        led_num <= 4'd7;
        {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= NONE;
        end     // end if(~rst_n)
    else begin
        if (before_end) begin
            if (led_num == 4'd7)    led_en <= 8'b01111111;
            else                    led_en <= {led_en[0], led_en[7:1]};
            case({disp_data_reg[4*led_num + 3], disp_data_reg[4*led_num + 2], disp_data_reg[4*led_num + 1], disp_data_reg[4*led_num] })
                4'h0:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= ZERO ;
                4'h1:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= ONE ;
                4'h2:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= TWO;
                4'h3:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= THREE;
                4'h4:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= FOUR;
                4'h5:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= FIVE;
                4'h6:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= SIX;
                4'h7:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= SEVEN;
                4'h8:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= EIGHT;
                4'h9:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= NINE;
                4'hA:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= A;
                4'hB:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= B;
                4'hC:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= C;
                4'hD:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= D;
                4'hE:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= E;
                4'hF:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= F;
                default:    {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= NONE;
                endcase
            end     //end if (before_end)
        else if (cnt_end) begin
            if (led_num == 4'b0)    led_num <= 4'd7;
            else                    led_num <= led_num - 4'd1;
            end     //end if (cnt_end)
        end
end

endmodule