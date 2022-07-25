module led_display_ctrl 
#(parameter ZERO = 7'b1000000, ONE = 7'b1111001, TWO = 7'b0100100, THREE = 7'b0110000, FOUR = 7'b0011001,
            FIVE = 7'b0010010, SIX = 7'b0000010, SEVEN = 7'b1111000, EIGHT = 7'b0000000, NINE = 7'b0011000,
            NONE = 7'b1111111, twkle = 4, cnt_end = 32 ) (                  
                //每个七位数码管工作4个时钟周期，每32个时钟周期倒计时一次
    input  wire       clk   ,
	input  wire       rst   ,
	input  wire       button,
	output reg  [7:0] led_en,
	output reg        led_ca,
	output reg        led_cb,
    output reg        led_cc,
	output reg        led_cd,
	output reg        led_ce,
	output reg        led_cf,
	output reg        led_cg,
	output wire       led_dp 
);

wire rst_n = ~rst;

reg         times, start;
reg [ 4:0]  num, led_num;
reg [19:0]  cnt2;
reg [29:0]  cnt1;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n)         start <= 1'b0;
    else if (button)    start <= 1'b1;
end

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        num     <= 4'd10;
        cnt1    <= 30'b0;
        cnt2    <= 20'b0;
        times   <=  1'b0;
        led_en  <= 8'hff;
        led_num <=  4'd7;
        {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= NONE;
        end
    else if (start) begin
        if (cnt1 == cnt_end-1) begin
            cnt1    <= 30'b0;
            if (num > 0)                num <= num - 1;
            else if (num == 0 && times) num <= 4'd0;
            else begin
                times <= ~times;
                num <= 10;
                end
            end
        else begin
            cnt1    <= cnt1 + 1;
            if (cnt2 == twkle-2) begin
                cnt2 <= cnt2 + 1;
                if (led_num == 7)   led_en <= 8'b01111111;
                else                led_en <= {led_en[0], led_en[7:1]};
                case(led_num)
                    4'd7:   if (num == 10)  {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= ONE;
                            else            {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= ZERO;
                    4'd6: begin
                        case (num)
                            4'd10:  {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= ZERO;
                            4'd9:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= NINE;
                            4'd8:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= EIGHT;
                            4'd7:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= SEVEN;
                            4'd6:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= SIX;
                            4'd5:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= FIVE;
                            4'd4:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= FOUR;
                            4'd3:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= THREE;
                            4'd2:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= TWO;
                            4'd1:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= ONE;
                            4'd0:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= ZERO;
                            default:{led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= NONE;
                            endcase
                        end
                    4'd5:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= TWO;
                    4'd4:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= ZERO;
                    4'd3:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= ONE;
                    4'd2:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= ZERO;
                    4'd1:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= TWO;
                    4'd0:   {led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= EIGHT;
                    default:{led_cg, led_cf, led_ce, led_cd, led_cc, led_cb, led_ca} <= NONE;
                    endcase
                end
            else if (cnt2 == twkle-1) begin
                cnt2    <= 20'b0;
                if (led_num == 0)   led_num <= 4'd7;
                else                led_num <= led_num - 1;
                end
            else    cnt2 <= cnt2 + 1;
            end
        end
end
endmodule