-makelib xcelium_lib/xil_defaultlib -sv \
  "D:/codeworkplace/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "D:/codeworkplace/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../pipelinedCPU.srcs/sources_1/ip/cpuclk/cpuclk_clk_wiz.v" \
  "../../../../pipelinedCPU.srcs/sources_1/ip/cpuclk/cpuclk.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

