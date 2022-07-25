module calculator_top (
    input  wire       clk   ,
	input  wire       rst   ,
	input  wire       button,
	input  wire [2:0] func  ,
	input  wire [7:0] num1  ,
	input  wire [7:0] num2  ,
 	output wire [7:0] led_en,
	output wire       led_ca,
	output wire       led_cb,
    output wire       led_cc,
	output wire       led_cd,
	output wire       led_ce,
	output wire       led_cf,
	output wire       led_cg,
	output wire       led_dp 
);

wire        clk_g       ;
wire        error       ;
wire [31:0] cal_result  ;
wire        rst_n = ~rst;

clk_div u_clk_div (
    .clk_in1  (clk   ),
	.clk_out1 (clk_g ),
	.locked   (locked)
);

calculator_anti_shake u_calculator_anti_shake(
    .clk_g      (clk_g      ),
    .rst_n      (rst_n      ),
    .button     (button     ),
    .button_good(button_good)
);

calculator_hex u_calculator_hex (
    .clk_g      (clk_g      ),
    .rst_n      (rst_n      ),
    .button     (button_good),
    .num1       (num1       ),
    .num2       (num2       ),
    .func       (func       ),
    .error      (error      ),
    .cal_result (cal_result ) 
);

calculator_display u_calculator_display (
    .clk_g      (clk_g      ),
    .rst_n      (rst_n      ),
    .error      (error      ),
    .led_en     (led_en     ),
    .led_ca     (led_ca     ),
    .led_cb     (led_cb     ),
    .led_cc     (led_cc     ),
    .led_cd     (led_cd     ),
    .led_ce     (led_ce     ),
    .led_cf     (led_cf     ),
    .led_cg     (led_cg     ),
	.cal_result (cal_result )
);

endmodule