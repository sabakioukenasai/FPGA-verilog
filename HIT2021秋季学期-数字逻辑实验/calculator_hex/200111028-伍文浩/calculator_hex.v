module calculator_hex(
    input wire          clk_g   ,
    input wire          rst_n   ,
    input wire          button  ,
    input wire [7:0]    num1    ,
    input wire [7:0]    num2    ,
    input wire [2:0]    func    ,
    output reg          error   ,
    output reg [31:0]   cal_result
);

reg         state, work;
reg [31:0]  num1_ff, num2_ff;

always@(posedge clk_g or negedge rst_n) begin
    if (~rst_n) begin
        work        <= 1'b0;
        state       <= 1'b0;
        error       <= 1'b0;
        num1_ff     <= 32'b0;
        num2_ff     <= 32'b0;
        cal_result  <= 32'b0;
        end
    else if (button && ~error) begin // 上一次计算未出错并且检测到button
        work    <= 1'b1;            // 应当进行一次计算
        if (state == 1'b0) begin
            num1_ff <= num1;
            num2_ff <= num2;
            end
        else if (state == 1'b1) begin
            num1_ff <= cal_result;
            num2_ff <= num2;
            end
        end
    else if (work && ~button) begin // 松开button且应当进行一次计算
        state   <= 1'b1;
        work    <= 1'b0;            // 计算完毕后，置为0
        case (func)
            3'b000:         //��
                cal_result  <= num1_ff + num2_ff;
            3'b001:         //��
                cal_result  <= num1_ff - num2_ff;
            3'b010:         //��
                cal_result  <= num1_ff * num2_ff;
            3'b011:         //����
                if (num2_ff == 32'b0)   error       <= 1'b1;
                else                    cal_result  <= num1_ff / num2_ff;
            3'b100:         //����
                if (num2_ff == 32'b0)   error       <= 1'b1;
                else                    cal_result  <= num1_ff % num2_ff;
            3'b101:         //ƽ��
                cal_result  <= num1_ff * num1_ff;
            default: begin
                cal_result  <= 32'b0;
                error       <= 1'b1;
                end
            endcase
        end
end

endmodule