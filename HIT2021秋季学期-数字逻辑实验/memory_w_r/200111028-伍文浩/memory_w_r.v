`timescale 1ns / 1ps

module memory_w_r
#(parameter cnt_end = 30'd6) (              //计数器参数，仿真时计数器计数终点
    input   wire        rst     ,
    input   wire        clka    ,
    input   wire        button  ,
    input   wire [15:0] douta   ,
    output  reg         ena     ,
    output  reg         wea     ,
    output  reg [15:0]  led     ,
    output  reg [15:0]  dina    ,
    output  reg [ 3:0]  addra
);

reg         work;
reg [29:0]  cnt;

always@(posedge clka or posedge rst)
begin
    if(rst) begin
        led     <= 16'b0;
        ena     <=  1'b0;
        work    <=  1'b0;
        end
    else if(button) begin
        wea     <=  1'b1;
        ena     <=  1'b1;
        work    <=  1'b1;
        addra   <=  4'b0;
        dina    <= 16'd1;
        cnt     <= 30'b0;
        end
    else if (addra < 4'b1111 && work && wea) begin
        dina    <= {dina[14:0], 1'b1};
        addra   <= addra + 4'd1;
        end
    else if (addra == 4'b1111 && work && wea) begin
        ena     <=  1'b0;
        wea     <=  1'b0;
        addra   <=  4'b0;
        led     <= 16'b0;
        end           
    else if (cnt == cnt_end - 30'd2 && work && ~wea) begin
        ena <= 1'b1;
        cnt <= cnt + 32'd1;
    end
    else if (cnt == cnt_end && work && ~wea) begin
        ena <=  1'b0;
        cnt <= 32'b0;
        led <= douta;
        if (addra == 4'b1111)   work    <= 1'b0;
        else                    addra   <= addra + 1;
    end
    else    cnt <= work&&~wea ? cnt + 1 : cnt;
end

endmodule