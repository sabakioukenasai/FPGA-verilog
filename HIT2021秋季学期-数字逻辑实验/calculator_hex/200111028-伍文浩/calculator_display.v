module calculator_display(
    input wire       clk_g  ,
    input wire       rst_n  ,
    input wire       error  ,
    input wire[31:0] cal_result ,
	output reg [7:0] led_en ,
	output reg       led_ca ,
	output reg       led_cb ,
    output reg       led_cc ,
	output reg       led_cd ,
	output reg       led_ce ,
	output reg       led_cf ,
	output reg       led_cg ,
	output wire      led_dp 
);
parameter   ZERO = 7'b1000000, ONE = 7'b1111001, TWO = 7'b0100100,
            THREE = 7'b0110000, FOUR = 7'b0011001,FIVE = 7'b0010010,
            SIX = 7'b0000010, SEVEN = 7'b1111000, EIGHT = 7'b0000000,
            NINE = 7'b0011000, A = 7'b0001000, B = 7'b0000011, C = 7'b0100111,
            D = 7'b0100001, E = 7'b0000110, F = 7'b0001110, NONE = 7'b1111111,
            r = 7'b0101111, o = 7'b0100011, twcle = 10000;


reg [15:0]  cnt;
reg [ 3:0]  led_num;
wire before_end = (cnt == twcle - 2);
wire cnt_end = (cnt == twcle - 1);
wire cnt_inc = (cnt < twcle - 1);

assign  led_dp = 1'b1;

always@(posedge clk_g or negedge rst_n) begin
    if (~rst_n)         cnt <= 16'b0;
    else if (cnt_end)   cnt <= 16'b0;
    else if (cnt_inc)   cnt <= cnt + 16'b1;
end

always@(posedge clk_g or negedge rst_n) begin
    if (~rst_n) begin
        led_en  <= 8'b11111111;
        led_num <= 4'd7;
        {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= NONE;
        end     // end if(~rst_n)
    else begin
        if (before_end) begin
            if (led_num == 4'd7)    led_en <= 8'b01111111;
            else                    led_en <= {led_en[0], led_en[7:1]};
            if (error)          //when error occurs
                case(led_num)
                    4'd7:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= NONE;
                    4'd6:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= NONE;
                    4'd5:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= NONE;
                    4'd4:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= E;
                    4'd3:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= r;
                    4'd2:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= r;
                    4'd1:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= o;
                    4'd0:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= r;
                    default:    {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= NONE;
                    endcase
            else
                case({cal_result[4*led_num + 3], cal_result[4*led_num + 2], cal_result[4*led_num + 1], cal_result[4*led_num] })
                    4'h0:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= ZERO;
                    4'h1:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= ONE;
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