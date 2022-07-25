module execute (
    input   wire    [ 2:0]      alu_op,
    input   wire    [31:0]      A,
    input   wire    [31:0]      B,
    output  wire    [31:0]      result
);

wire [31:0] res [7:0];

assign res[0] = A + B;
assign res[1] = A + (~B + 1'b1);
assign res[2] = A & B;
assign res[3] = A | B;
assign res[4] = A ^ B;
assign res[5] = A << $unsigned(B[4:0]);
assign res[6] = A >> $unsigned(B[4:0]);
assign res[7] = $signed(A) >>> $unsigned(B[4:0]);

assign result = res[alu_op];
    
endmodule