module flowing_water_lights
#(parameter countnum = 100000000) (
    input  wire       clk   ,
	input  wire       rst   ,
	input  wire       button,
	output reg  [7:0] led
);

reg [31:0] cnt = 32'b0;
reg start = 0;

always @(posedge clk or posedge rst) begin
    if (button == 1) start <= 1;
    else             start <= start;
    if (rst == 1) begin
        start <= 0;
        led <= 8'b11111111;
        cnt <= 32'b0;
        end
    else if (start) begin
        if (cnt == countnum-1) begin
            cnt <= 32'b0;
            led <= {led[6:0], led[7]};
            end
        else cnt <= cnt+1;
        end
    else led=8'b00000001;
end

endmodule