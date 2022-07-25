module iobus(
// 与CPU连接的IO信号
    input   [31:0]  addr_fromcpu,   // 从CPU获得的IO地址
    input   [31:0]  data_fromcpu,   // 从CPU获得的数据
    output  [31:0]  data_tocpu,     // 传回CPU的数据
    input           tocpu_e,        // IO读使能
    input           fromcpu_e,      // IO写使能

// 与内存连接的IO信号
    output  [31:0]  mem_addr,       // 访问内存的地址
    input   [31:0]  mem_rd_data,    // 读内存数据
    output  [31:0]  mem_wr_data,    // 写内存数据
    output          mem_wr_e,       // 写内存使能

// 与其他外设的IO信号
    output  [11:0]  dv_addr,        // 在本次实验中使用截断的IO地址 
    output  [31:0]  dv_wr_data,
    input   [31:0]  dv_rd_data,
    output          dv_wr_e,
    output          dv_rd_e         // 从其他外设读入的使能信号
);

// 是否是读写内存的信号
wire    isMEMaddr   = ~(addr_fromcpu[31:12] == 20'hFFFFF);

// 设置读写内存的信号
assign  mem_addr    = isMEMaddr                 ? addr_fromcpu : 32'hFFFFFFFF;
assign  mem_wr_data = (isMEMaddr & fromcpu_e)   ? data_fromcpu : 32'b0;
assign  mem_wr_e    = isMEMaddr & fromcpu_e;

// 设置访问其他外设的信号
assign  dv_addr     = ~isMEMaddr                ? addr_fromcpu[11:0]    : 12'hFFF;
assign  dv_wr_data  = (~isMEMaddr & fromcpu_e)  ? data_fromcpu          : 32'b0;
assign  dv_rd_e     = ~isMEMaddr & tocpu_e;
assign  dv_wr_e     = ~isMEMaddr & fromcpu_e;

assign data_tocpu   = tocpu_e ? (isMEMaddr ? mem_rd_data : dv_rd_data) : data_tocpu;

endmodule