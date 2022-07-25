module holiday_lights 
#(parameter countnum = 100000000) (
    input  wire        clk   ,
	input  wire        rst   ,
	input  wire        button,
    input  wire [ 2:0] switch,
	output reg  [15:0] led
);

reg [31:0] cnt = 32'b0;
reg [7:0] num = 8'b1;
reg start = 0;

always @(posedge clk or posedge rst) begin
    if (button == 1) start <= 1;
    else             start <= start;
    if (rst == 1) begin
        start <= 0;
        cnt <= 32'b0;
        end
    else if (start) begin
        if (cnt == countnum-1) begin
            cnt <= 32'b0;
            led <= {led[14:0], led[15]};
            end
        else cnt <= cnt+1;
        end
    else
        case (switch) 
            8'd0: led <= 16'b0000000000000001;
            8'd1: led <= 16'b0000000000000011;
            8'd2: led <= 16'b0000000000000111;
            8'd3: led <= 16'b0000000000001111;
            8'd4: led <= 16'b0000000000011111;
            8'd5: led <= 16'b0000000000111111;
            8'd6: led <= 16'b0000000001111111;
            8'd7: led <= 16'b0000000011111111;
            default: led <= 16'b0;
            endcase     
end

endmodule