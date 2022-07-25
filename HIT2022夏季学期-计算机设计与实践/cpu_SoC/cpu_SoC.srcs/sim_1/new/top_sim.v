`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/12 18:33:12
// Design Name: 
// Module Name: top_sim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_sim(
);

reg clk;
reg rst;

initial begin
	clk = 1'b0;
	rst = 1'b1;
	#100 rst = 1'b0;
end

always #20 clk = ~clk;

top U_top(
	.clk_i 		(clk 	),
	.rst_i 		(rst 	)
);

endmodule
