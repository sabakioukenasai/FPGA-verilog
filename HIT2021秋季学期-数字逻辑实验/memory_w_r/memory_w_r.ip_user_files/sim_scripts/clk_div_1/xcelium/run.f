-makelib xcelium_lib/xil_defaultlib -sv \
  "D:/codeworkplace/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/codeworkplace/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "D:/codeworkplace/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../memory_w_r.srcs/sources_1/ip/clk_div_1/clk_div_clk_wiz.v" \
  "../../../../memory_w_r.srcs/sources_1/ip/clk_div_1/clk_div.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

