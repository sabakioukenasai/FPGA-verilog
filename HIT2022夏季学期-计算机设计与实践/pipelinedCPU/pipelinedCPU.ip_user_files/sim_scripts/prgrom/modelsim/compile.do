vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/dist_mem_gen_v8_0_12

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm
vmap dist_mem_gen_v8_0_12 modelsim_lib/msim/dist_mem_gen_v8_0_12

vlog -work xil_defaultlib -64 -incr -sv \
"D:/codeworkplace/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 -93 \
"D:/codeworkplace/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work dist_mem_gen_v8_0_12 -64 -incr \
"../../../ipstatic/simulation/dist_mem_gen_v8_0.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../../pipelinedCPU.srcs/sources_1/ip/prgrom/sim/prgrom.v" \


vlog -work xil_defaultlib \
"glbl.v"

