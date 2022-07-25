module sequence_detection (
    input  wire       clk   ,
	input  wire       rst   ,
	input  wire       button,
	input  wire [7:0] switch,
	output reg        led
);
parameter IDLE  = 5'b00000;
parameter s0    = 5'b00001;
parameter s1    = 5'b00010;
parameter s2    = 5'b00100;
parameter s3    = 5'b01000;
parameter s4    = 5'b10000;

reg [4:0]   cnt;
reg         start;
reg [4:0]   state;
reg [4:0]   next_state;

wire    rst_n = ~rst;
wire    detect_end = (cnt == 4'b1111);

always @(posedge clk or negedge rst_n) begin
    if (~rst_n)     start   <= 1'b0;
    else if (button) begin
        state   <= IDLE;
        start   <= 1'b1;
        cnt     <= 4'd7;
        end
    else if (start) begin 
        state   <= next_state;
        cnt     <= detect_end ? cnt : cnt - 1'b1;
        end
end

always @(*) begin
    if (start && ~detect_end)
        case (state)
            IDLE:   
                if ( switch[cnt])   next_state = s0;
                else                next_state = IDLE;
            s0: if (~switch[cnt])   next_state = s1;
                else                next_state = s0;
            s1: if (~switch[cnt])   next_state = s2;
                else                next_state = s0;
            s2: if ( switch[cnt])   next_state = s3;
                else                next_state = IDLE;
            s3: if (~switch[cnt])   next_state = s4;
                else                next_state = s0;
            s4: if ( switch[cnt])   next_state = s0;
                else                next_state = s2;
            default:    next_state = IDLE;
        endcase
    else    next_state = IDLE;
end

always @(posedge clk or negedge rst_n) begin
    if (~rst_n||button) led <= 1'b0;
    else if (start)     led <= (state == s4) ? 1'b1 : led;
end
		   
endmodule