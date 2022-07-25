// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Fri Jul 15 09:42:34 2022
// Host        : DESKTOP-vovohao running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ prgrom_sim_netlist.v
// Design      : prgrom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "prgrom,dist_mem_gen_v8_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_12,Vivado 2018.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (a,
    spo);
  input [13:0]a;
  output [31:0]spo;

  wire [13:0]a;
  wire [31:0]spo;
  wire [31:0]NLW_U0_dpo_UNCONNECTED;
  wire [31:0]NLW_U0_qdpo_UNCONNECTED;
  wire [31:0]NLW_U0_qspo_UNCONNECTED;

  (* C_FAMILY = "artix7" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_DPO = "0" *) 
  (* C_HAS_DPRA = "0" *) 
  (* C_HAS_I_CE = "0" *) 
  (* C_HAS_QDPO = "0" *) 
  (* C_HAS_QDPO_CE = "0" *) 
  (* C_HAS_QDPO_CLK = "0" *) 
  (* C_HAS_QDPO_RST = "0" *) 
  (* C_HAS_QDPO_SRST = "0" *) 
  (* C_HAS_WE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_PIPELINE_STAGES = "0" *) 
  (* C_QCE_JOINED = "0" *) 
  (* C_QUALIFY_WE = "0" *) 
  (* C_REG_DPRA_INPUT = "0" *) 
  (* c_addr_width = "14" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "16384" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_clk = "0" *) 
  (* c_has_qspo = "0" *) 
  (* c_has_qspo_ce = "0" *) 
  (* c_has_qspo_rst = "0" *) 
  (* c_has_qspo_srst = "0" *) 
  (* c_has_spo = "1" *) 
  (* c_mem_init_file = "prgrom.mif" *) 
  (* c_parser_type = "1" *) 
  (* c_read_mif = "1" *) 
  (* c_reg_a_d_inputs = "0" *) 
  (* c_sync_enable = "1" *) 
  (* c_width = "32" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_12 U0
       (.a(a),
        .clk(1'b0),
        .d({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dpo(NLW_U0_dpo_UNCONNECTED[31:0]),
        .dpra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .i_ce(1'b1),
        .qdpo(NLW_U0_qdpo_UNCONNECTED[31:0]),
        .qdpo_ce(1'b1),
        .qdpo_clk(1'b0),
        .qdpo_rst(1'b0),
        .qdpo_srst(1'b0),
        .qspo(NLW_U0_qspo_UNCONNECTED[31:0]),
        .qspo_ce(1'b1),
        .qspo_rst(1'b0),
        .qspo_srst(1'b0),
        .spo(spo),
        .we(1'b0));
endmodule

(* C_ADDR_WIDTH = "14" *) (* C_DEFAULT_DATA = "0" *) (* C_DEPTH = "16384" *) 
(* C_ELABORATION_DIR = "./" *) (* C_FAMILY = "artix7" *) (* C_HAS_CLK = "0" *) 
(* C_HAS_D = "0" *) (* C_HAS_DPO = "0" *) (* C_HAS_DPRA = "0" *) 
(* C_HAS_I_CE = "0" *) (* C_HAS_QDPO = "0" *) (* C_HAS_QDPO_CE = "0" *) 
(* C_HAS_QDPO_CLK = "0" *) (* C_HAS_QDPO_RST = "0" *) (* C_HAS_QDPO_SRST = "0" *) 
(* C_HAS_QSPO = "0" *) (* C_HAS_QSPO_CE = "0" *) (* C_HAS_QSPO_RST = "0" *) 
(* C_HAS_QSPO_SRST = "0" *) (* C_HAS_SPO = "1" *) (* C_HAS_WE = "0" *) 
(* C_MEM_INIT_FILE = "prgrom.mif" *) (* C_MEM_TYPE = "0" *) (* C_PARSER_TYPE = "1" *) 
(* C_PIPELINE_STAGES = "0" *) (* C_QCE_JOINED = "0" *) (* C_QUALIFY_WE = "0" *) 
(* C_READ_MIF = "1" *) (* C_REG_A_D_INPUTS = "0" *) (* C_REG_DPRA_INPUT = "0" *) 
(* C_SYNC_ENABLE = "1" *) (* C_WIDTH = "32" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_12
   (a,
    d,
    dpra,
    clk,
    we,
    i_ce,
    qspo_ce,
    qdpo_ce,
    qdpo_clk,
    qspo_rst,
    qdpo_rst,
    qspo_srst,
    qdpo_srst,
    spo,
    dpo,
    qspo,
    qdpo);
  input [13:0]a;
  input [31:0]d;
  input [13:0]dpra;
  input clk;
  input we;
  input i_ce;
  input qspo_ce;
  input qdpo_ce;
  input qdpo_clk;
  input qspo_rst;
  input qdpo_rst;
  input qspo_srst;
  input qdpo_srst;
  output [31:0]spo;
  output [31:0]dpo;
  output [31:0]qspo;
  output [31:0]qdpo;

  wire \<const0> ;
  wire [13:0]a;
  wire [31:1]\^spo ;

  assign dpo[31] = \<const0> ;
  assign dpo[30] = \<const0> ;
  assign dpo[29] = \<const0> ;
  assign dpo[28] = \<const0> ;
  assign dpo[27] = \<const0> ;
  assign dpo[26] = \<const0> ;
  assign dpo[25] = \<const0> ;
  assign dpo[24] = \<const0> ;
  assign dpo[23] = \<const0> ;
  assign dpo[22] = \<const0> ;
  assign dpo[21] = \<const0> ;
  assign dpo[20] = \<const0> ;
  assign dpo[19] = \<const0> ;
  assign dpo[18] = \<const0> ;
  assign dpo[17] = \<const0> ;
  assign dpo[16] = \<const0> ;
  assign dpo[15] = \<const0> ;
  assign dpo[14] = \<const0> ;
  assign dpo[13] = \<const0> ;
  assign dpo[12] = \<const0> ;
  assign dpo[11] = \<const0> ;
  assign dpo[10] = \<const0> ;
  assign dpo[9] = \<const0> ;
  assign dpo[8] = \<const0> ;
  assign dpo[7] = \<const0> ;
  assign dpo[6] = \<const0> ;
  assign dpo[5] = \<const0> ;
  assign dpo[4] = \<const0> ;
  assign dpo[3] = \<const0> ;
  assign dpo[2] = \<const0> ;
  assign dpo[1] = \<const0> ;
  assign dpo[0] = \<const0> ;
  assign qdpo[31] = \<const0> ;
  assign qdpo[30] = \<const0> ;
  assign qdpo[29] = \<const0> ;
  assign qdpo[28] = \<const0> ;
  assign qdpo[27] = \<const0> ;
  assign qdpo[26] = \<const0> ;
  assign qdpo[25] = \<const0> ;
  assign qdpo[24] = \<const0> ;
  assign qdpo[23] = \<const0> ;
  assign qdpo[22] = \<const0> ;
  assign qdpo[21] = \<const0> ;
  assign qdpo[20] = \<const0> ;
  assign qdpo[19] = \<const0> ;
  assign qdpo[18] = \<const0> ;
  assign qdpo[17] = \<const0> ;
  assign qdpo[16] = \<const0> ;
  assign qdpo[15] = \<const0> ;
  assign qdpo[14] = \<const0> ;
  assign qdpo[13] = \<const0> ;
  assign qdpo[12] = \<const0> ;
  assign qdpo[11] = \<const0> ;
  assign qdpo[10] = \<const0> ;
  assign qdpo[9] = \<const0> ;
  assign qdpo[8] = \<const0> ;
  assign qdpo[7] = \<const0> ;
  assign qdpo[6] = \<const0> ;
  assign qdpo[5] = \<const0> ;
  assign qdpo[4] = \<const0> ;
  assign qdpo[3] = \<const0> ;
  assign qdpo[2] = \<const0> ;
  assign qdpo[1] = \<const0> ;
  assign qdpo[0] = \<const0> ;
  assign qspo[31] = \<const0> ;
  assign qspo[30] = \<const0> ;
  assign qspo[29] = \<const0> ;
  assign qspo[28] = \<const0> ;
  assign qspo[27] = \<const0> ;
  assign qspo[26] = \<const0> ;
  assign qspo[25] = \<const0> ;
  assign qspo[24] = \<const0> ;
  assign qspo[23] = \<const0> ;
  assign qspo[22] = \<const0> ;
  assign qspo[21] = \<const0> ;
  assign qspo[20] = \<const0> ;
  assign qspo[19] = \<const0> ;
  assign qspo[18] = \<const0> ;
  assign qspo[17] = \<const0> ;
  assign qspo[16] = \<const0> ;
  assign qspo[15] = \<const0> ;
  assign qspo[14] = \<const0> ;
  assign qspo[13] = \<const0> ;
  assign qspo[12] = \<const0> ;
  assign qspo[11] = \<const0> ;
  assign qspo[10] = \<const0> ;
  assign qspo[9] = \<const0> ;
  assign qspo[8] = \<const0> ;
  assign qspo[7] = \<const0> ;
  assign qspo[6] = \<const0> ;
  assign qspo[5] = \<const0> ;
  assign qspo[4] = \<const0> ;
  assign qspo[3] = \<const0> ;
  assign qspo[2] = \<const0> ;
  assign qspo[1] = \<const0> ;
  assign qspo[0] = \<const0> ;
  assign spo[31:30] = \^spo [31:30];
  assign spo[29] = \^spo [31];
  assign spo[28] = \^spo [31];
  assign spo[27:1] = \^spo [27:1];
  assign spo[0] = \^spo [1];
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_12_synth \synth_options.dist_mem_inst 
       (.a(a),
        .spo({\^spo [31:30],\^spo [27:1]}));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_12_synth
   (spo,
    a);
  output [28:0]spo;
  input [13:0]a;

  wire [13:0]a;
  wire [28:0]spo;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rom \gen_rom.rom_inst 
       (.a(a),
        .spo(spo));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rom
   (spo,
    a);
  output [28:0]spo;
  input [13:0]a;

  wire [13:0]a;
  wire [28:0]spo;
  wire \spo[0]_INST_0_i_1_n_0 ;
  wire \spo[10]_INST_0_i_1_n_0 ;
  wire \spo[10]_INST_0_i_2_n_0 ;
  wire \spo[11]_INST_0_i_1_n_0 ;
  wire \spo[11]_INST_0_i_2_n_0 ;
  wire \spo[12]_INST_0_i_1_n_0 ;
  wire \spo[13]_INST_0_i_1_n_0 ;
  wire \spo[13]_INST_0_i_2_n_0 ;
  wire \spo[14]_INST_0_i_1_n_0 ;
  wire \spo[14]_INST_0_i_2_n_0 ;
  wire \spo[15]_INST_0_i_1_n_0 ;
  wire \spo[15]_INST_0_i_2_n_0 ;
  wire \spo[16]_INST_0_i_1_n_0 ;
  wire \spo[16]_INST_0_i_2_n_0 ;
  wire \spo[17]_INST_0_i_1_n_0 ;
  wire \spo[18]_INST_0_i_1_n_0 ;
  wire \spo[18]_INST_0_i_2_n_0 ;
  wire \spo[19]_INST_0_i_1_n_0 ;
  wire \spo[19]_INST_0_i_2_n_0 ;
  wire \spo[20]_INST_0_i_1_n_0 ;
  wire \spo[20]_INST_0_i_2_n_0 ;
  wire \spo[20]_INST_0_i_3_n_0 ;
  wire \spo[21]_INST_0_i_1_n_0 ;
  wire \spo[21]_INST_0_i_2_n_0 ;
  wire \spo[22]_INST_0_i_1_n_0 ;
  wire \spo[22]_INST_0_i_2_n_0 ;
  wire \spo[23]_INST_0_i_1_n_0 ;
  wire \spo[23]_INST_0_i_2_n_0 ;
  wire \spo[24]_INST_0_i_1_n_0 ;
  wire \spo[24]_INST_0_i_2_n_0 ;
  wire \spo[25]_INST_0_i_1_n_0 ;
  wire \spo[25]_INST_0_i_2_n_0 ;
  wire \spo[26]_INST_0_i_1_n_0 ;
  wire \spo[26]_INST_0_i_2_n_0 ;
  wire \spo[27]_INST_0_i_1_n_0 ;
  wire \spo[27]_INST_0_i_2_n_0 ;
  wire \spo[28]_INST_0_i_1_n_0 ;
  wire \spo[28]_INST_0_i_2_n_0 ;
  wire \spo[28]_INST_0_i_3_n_0 ;
  wire \spo[2]_INST_0_i_1_n_0 ;
  wire \spo[30]_INST_0_i_1_n_0 ;
  wire \spo[30]_INST_0_i_2_n_0 ;
  wire \spo[3]_INST_0_i_1_n_0 ;
  wire \spo[3]_INST_0_i_2_n_0 ;
  wire \spo[4]_INST_0_i_1_n_0 ;
  wire \spo[4]_INST_0_i_2_n_0 ;
  wire \spo[5]_INST_0_i_1_n_0 ;
  wire \spo[5]_INST_0_i_2_n_0 ;
  wire \spo[6]_INST_0_i_1_n_0 ;
  wire \spo[6]_INST_0_i_2_n_0 ;
  wire \spo[7]_INST_0_i_1_n_0 ;
  wire \spo[7]_INST_0_i_2_n_0 ;
  wire \spo[8]_INST_0_i_1_n_0 ;
  wire \spo[8]_INST_0_i_2_n_0 ;
  wire \spo[9]_INST_0_i_1_n_0 ;

  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \spo[0]_INST_0 
       (.I0(\spo[0]_INST_0_i_1_n_0 ),
        .I1(a[0]),
        .I2(\spo[3]_INST_0_i_2_n_0 ),
        .I3(a[5]),
        .I4(a[4]),
        .I5(\spo[20]_INST_0_i_1_n_0 ),
        .O(spo[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \spo[0]_INST_0_i_1 
       (.I0(a[3]),
        .I1(\spo[20]_INST_0_i_1_n_0 ),
        .I2(a[2]),
        .O(\spo[0]_INST_0_i_1_n_0 ));
  MUXF7 \spo[10]_INST_0 
       (.I0(\spo[10]_INST_0_i_1_n_0 ),
        .I1(\spo[10]_INST_0_i_2_n_0 ),
        .O(spo[9]),
        .S(a[4]));
  LUT6 #(
    .INIT(64'h82020000980F0000)) 
    \spo[10]_INST_0_i_1 
       (.I0(a[5]),
        .I1(a[1]),
        .I2(a[0]),
        .I3(a[3]),
        .I4(\spo[20]_INST_0_i_1_n_0 ),
        .I5(a[2]),
        .O(\spo[10]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000050004020)) 
    \spo[10]_INST_0_i_2 
       (.I0(a[5]),
        .I1(a[2]),
        .I2(\spo[20]_INST_0_i_1_n_0 ),
        .I3(a[3]),
        .I4(a[1]),
        .I5(a[0]),
        .O(\spo[10]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h2F20)) 
    \spo[11]_INST_0 
       (.I0(\spo[11]_INST_0_i_1_n_0 ),
        .I1(a[5]),
        .I2(a[4]),
        .I3(\spo[11]_INST_0_i_2_n_0 ),
        .O(spo[10]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h3700)) 
    \spo[11]_INST_0_i_1 
       (.I0(a[1]),
        .I1(a[3]),
        .I2(a[2]),
        .I3(\spo[20]_INST_0_i_1_n_0 ),
        .O(\spo[11]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7D6F0000DD500000)) 
    \spo[11]_INST_0_i_2 
       (.I0(a[5]),
        .I1(a[1]),
        .I2(a[0]),
        .I3(a[2]),
        .I4(\spo[20]_INST_0_i_1_n_0 ),
        .I5(a[3]),
        .O(\spo[11]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000)) 
    \spo[12]_INST_0 
       (.I0(\spo[28]_INST_0_i_1_n_0 ),
        .I1(a[5]),
        .I2(\spo[14]_INST_0_i_1_n_0 ),
        .I3(a[0]),
        .I4(a[4]),
        .I5(\spo[12]_INST_0_i_1_n_0 ),
        .O(spo[11]));
  LUT6 #(
    .INIT(64'h2821000057640000)) 
    \spo[12]_INST_0_i_1 
       (.I0(a[5]),
        .I1(a[0]),
        .I2(a[1]),
        .I3(a[2]),
        .I4(\spo[20]_INST_0_i_1_n_0 ),
        .I5(a[3]),
        .O(\spo[12]_INST_0_i_1_n_0 ));
  MUXF7 \spo[13]_INST_0 
       (.I0(\spo[13]_INST_0_i_1_n_0 ),
        .I1(\spo[13]_INST_0_i_2_n_0 ),
        .O(spo[12]),
        .S(a[4]));
  LUT6 #(
    .INIT(64'h0200000001170000)) 
    \spo[13]_INST_0_i_1 
       (.I0(a[5]),
        .I1(a[0]),
        .I2(a[2]),
        .I3(a[1]),
        .I4(\spo[20]_INST_0_i_1_n_0 ),
        .I5(a[3]),
        .O(\spo[13]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000A0042000800)) 
    \spo[13]_INST_0_i_2 
       (.I0(a[5]),
        .I1(a[1]),
        .I2(a[3]),
        .I3(\spo[20]_INST_0_i_1_n_0 ),
        .I4(a[2]),
        .I5(a[0]),
        .O(\spo[13]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000)) 
    \spo[14]_INST_0 
       (.I0(\spo[28]_INST_0_i_1_n_0 ),
        .I1(a[5]),
        .I2(\spo[14]_INST_0_i_1_n_0 ),
        .I3(a[0]),
        .I4(a[4]),
        .I5(\spo[14]_INST_0_i_2_n_0 ),
        .O(spo[13]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \spo[14]_INST_0_i_1 
       (.I0(a[2]),
        .I1(\spo[20]_INST_0_i_1_n_0 ),
        .I2(a[3]),
        .I3(a[1]),
        .O(\spo[14]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8821000013460000)) 
    \spo[14]_INST_0_i_2 
       (.I0(a[5]),
        .I1(a[0]),
        .I2(a[1]),
        .I3(a[2]),
        .I4(\spo[20]_INST_0_i_1_n_0 ),
        .I5(a[3]),
        .O(\spo[14]_INST_0_i_2_n_0 ));
  MUXF7 \spo[15]_INST_0 
       (.I0(\spo[15]_INST_0_i_1_n_0 ),
        .I1(\spo[15]_INST_0_i_2_n_0 ),
        .O(spo[14]),
        .S(a[4]));
  LUT6 #(
    .INIT(64'h6400440065003400)) 
    \spo[15]_INST_0_i_1 
       (.I0(a[5]),
        .I1(a[0]),
        .I2(a[3]),
        .I3(\spo[20]_INST_0_i_1_n_0 ),
        .I4(a[2]),
        .I5(a[1]),
        .O(\spo[15]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0044044C00000088)) 
    \spo[15]_INST_0_i_2 
       (.I0(a[5]),
        .I1(\spo[20]_INST_0_i_1_n_0 ),
        .I2(a[2]),
        .I3(a[3]),
        .I4(a[1]),
        .I5(a[0]),
        .O(\spo[15]_INST_0_i_2_n_0 ));
  MUXF7 \spo[16]_INST_0 
       (.I0(\spo[16]_INST_0_i_1_n_0 ),
        .I1(\spo[16]_INST_0_i_2_n_0 ),
        .O(spo[15]),
        .S(a[4]));
  LUT6 #(
    .INIT(64'hD051000041A40000)) 
    \spo[16]_INST_0_i_1 
       (.I0(a[5]),
        .I1(a[0]),
        .I2(a[3]),
        .I3(a[1]),
        .I4(\spo[20]_INST_0_i_1_n_0 ),
        .I5(a[2]),
        .O(\spo[16]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h003703F300000000)) 
    \spo[16]_INST_0_i_2 
       (.I0(a[0]),
        .I1(a[5]),
        .I2(a[1]),
        .I3(a[3]),
        .I4(a[2]),
        .I5(\spo[20]_INST_0_i_1_n_0 ),
        .O(\spo[16]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000)) 
    \spo[17]_INST_0 
       (.I0(\spo[28]_INST_0_i_1_n_0 ),
        .I1(a[5]),
        .I2(\spo[20]_INST_0_i_1_n_0 ),
        .I3(a[0]),
        .I4(a[4]),
        .I5(\spo[17]_INST_0_i_1_n_0 ),
        .O(spo[16]));
  LUT6 #(
    .INIT(64'hB29B000012260000)) 
    \spo[17]_INST_0_i_1 
       (.I0(a[5]),
        .I1(a[0]),
        .I2(a[2]),
        .I3(a[1]),
        .I4(\spo[20]_INST_0_i_1_n_0 ),
        .I5(a[3]),
        .O(\spo[17]_INST_0_i_1_n_0 ));
  MUXF7 \spo[18]_INST_0 
       (.I0(\spo[18]_INST_0_i_1_n_0 ),
        .I1(\spo[18]_INST_0_i_2_n_0 ),
        .O(spo[17]),
        .S(a[4]));
  LUT6 #(
    .INIT(64'h400F000020000000)) 
    \spo[18]_INST_0_i_1 
       (.I0(a[2]),
        .I1(a[1]),
        .I2(a[5]),
        .I3(a[3]),
        .I4(\spo[20]_INST_0_i_1_n_0 ),
        .I5(a[0]),
        .O(\spo[18]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0004040400000000)) 
    \spo[18]_INST_0_i_2 
       (.I0(a[1]),
        .I1(\spo[20]_INST_0_i_1_n_0 ),
        .I2(a[3]),
        .I3(a[0]),
        .I4(a[2]),
        .I5(a[5]),
        .O(\spo[18]_INST_0_i_2_n_0 ));
  MUXF7 \spo[19]_INST_0 
       (.I0(\spo[19]_INST_0_i_1_n_0 ),
        .I1(\spo[19]_INST_0_i_2_n_0 ),
        .O(spo[18]),
        .S(a[4]));
  LUT6 #(
    .INIT(64'hFDEB000013360000)) 
    \spo[19]_INST_0_i_1 
       (.I0(a[5]),
        .I1(a[0]),
        .I2(a[1]),
        .I3(a[2]),
        .I4(\spo[20]_INST_0_i_1_n_0 ),
        .I5(a[3]),
        .O(\spo[19]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h051D575D00000000)) 
    \spo[19]_INST_0_i_2 
       (.I0(a[5]),
        .I1(a[1]),
        .I2(a[3]),
        .I3(a[2]),
        .I4(a[0]),
        .I5(\spo[20]_INST_0_i_1_n_0 ),
        .O(\spo[19]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000)) 
    \spo[20]_INST_0 
       (.I0(\spo[28]_INST_0_i_1_n_0 ),
        .I1(a[5]),
        .I2(\spo[20]_INST_0_i_1_n_0 ),
        .I3(a[0]),
        .I4(a[4]),
        .I5(\spo[20]_INST_0_i_2_n_0 ),
        .O(spo[19]));
  LUT3 #(
    .INIT(8'h04)) 
    \spo[20]_INST_0_i_1 
       (.I0(a[6]),
        .I1(\spo[20]_INST_0_i_3_n_0 ),
        .I2(a[8]),
        .O(\spo[20]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB0B3000026860000)) 
    \spo[20]_INST_0_i_2 
       (.I0(a[5]),
        .I1(a[0]),
        .I2(a[3]),
        .I3(a[1]),
        .I4(\spo[20]_INST_0_i_1_n_0 ),
        .I5(a[2]),
        .O(\spo[20]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \spo[20]_INST_0_i_3 
       (.I0(a[10]),
        .I1(a[7]),
        .I2(a[13]),
        .I3(a[12]),
        .I4(a[9]),
        .I5(a[11]),
        .O(\spo[20]_INST_0_i_3_n_0 ));
  MUXF7 \spo[21]_INST_0 
       (.I0(\spo[21]_INST_0_i_1_n_0 ),
        .I1(\spo[21]_INST_0_i_2_n_0 ),
        .O(spo[20]),
        .S(a[4]));
  LUT6 #(
    .INIT(64'hC400000040001400)) 
    \spo[21]_INST_0_i_1 
       (.I0(a[5]),
        .I1(a[0]),
        .I2(a[2]),
        .I3(\spo[20]_INST_0_i_1_n_0 ),
        .I4(a[3]),
        .I5(a[1]),
        .O(\spo[21]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000000A2A0000)) 
    \spo[21]_INST_0_i_2 
       (.I0(a[0]),
        .I1(a[1]),
        .I2(a[3]),
        .I3(a[2]),
        .I4(\spo[20]_INST_0_i_1_n_0 ),
        .I5(a[5]),
        .O(\spo[21]_INST_0_i_2_n_0 ));
  MUXF7 \spo[22]_INST_0 
       (.I0(\spo[22]_INST_0_i_1_n_0 ),
        .I1(\spo[22]_INST_0_i_2_n_0 ),
        .O(spo[21]),
        .S(a[4]));
  LUT6 #(
    .INIT(64'hC4000E006000BE00)) 
    \spo[22]_INST_0_i_1 
       (.I0(a[5]),
        .I1(a[0]),
        .I2(a[2]),
        .I3(\spo[20]_INST_0_i_1_n_0 ),
        .I4(a[3]),
        .I5(a[1]),
        .O(\spo[22]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000CCCCC080)) 
    \spo[22]_INST_0_i_2 
       (.I0(a[2]),
        .I1(\spo[20]_INST_0_i_1_n_0 ),
        .I2(a[3]),
        .I3(a[1]),
        .I4(a[0]),
        .I5(a[5]),
        .O(\spo[22]_INST_0_i_2_n_0 ));
  MUXF7 \spo[23]_INST_0 
       (.I0(\spo[23]_INST_0_i_1_n_0 ),
        .I1(\spo[23]_INST_0_i_2_n_0 ),
        .O(spo[22]),
        .S(a[4]));
  LUT6 #(
    .INIT(64'h00580000010C0000)) 
    \spo[23]_INST_0_i_1 
       (.I0(a[5]),
        .I1(a[0]),
        .I2(a[1]),
        .I3(a[3]),
        .I4(\spo[20]_INST_0_i_1_n_0 ),
        .I5(a[2]),
        .O(\spo[23]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h10000A0000000800)) 
    \spo[23]_INST_0_i_2 
       (.I0(a[5]),
        .I1(a[1]),
        .I2(a[3]),
        .I3(\spo[20]_INST_0_i_1_n_0 ),
        .I4(a[2]),
        .I5(a[0]),
        .O(\spo[23]_INST_0_i_2_n_0 ));
  MUXF7 \spo[24]_INST_0 
       (.I0(\spo[24]_INST_0_i_1_n_0 ),
        .I1(\spo[24]_INST_0_i_2_n_0 ),
        .O(spo[23]),
        .S(a[4]));
  LUT6 #(
    .INIT(64'hC6D6000043FE0000)) 
    \spo[24]_INST_0_i_1 
       (.I0(a[5]),
        .I1(a[0]),
        .I2(a[1]),
        .I3(a[3]),
        .I4(\spo[20]_INST_0_i_1_n_0 ),
        .I5(a[2]),
        .O(\spo[24]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1146000054440000)) 
    \spo[24]_INST_0_i_2 
       (.I0(a[5]),
        .I1(a[0]),
        .I2(a[1]),
        .I3(a[3]),
        .I4(\spo[20]_INST_0_i_1_n_0 ),
        .I5(a[2]),
        .O(\spo[24]_INST_0_i_2_n_0 ));
  MUXF7 \spo[25]_INST_0 
       (.I0(\spo[25]_INST_0_i_1_n_0 ),
        .I1(\spo[25]_INST_0_i_2_n_0 ),
        .O(spo[24]),
        .S(a[4]));
  LUT6 #(
    .INIT(64'hC000090040008C00)) 
    \spo[25]_INST_0_i_1 
       (.I0(a[5]),
        .I1(a[0]),
        .I2(a[2]),
        .I3(\spo[20]_INST_0_i_1_n_0 ),
        .I4(a[3]),
        .I5(a[1]),
        .O(\spo[25]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0044044C00080080)) 
    \spo[25]_INST_0_i_2 
       (.I0(a[5]),
        .I1(\spo[20]_INST_0_i_1_n_0 ),
        .I2(a[2]),
        .I3(a[3]),
        .I4(a[1]),
        .I5(a[0]),
        .O(\spo[25]_INST_0_i_2_n_0 ));
  MUXF7 \spo[26]_INST_0 
       (.I0(\spo[26]_INST_0_i_1_n_0 ),
        .I1(\spo[26]_INST_0_i_2_n_0 ),
        .O(spo[25]),
        .S(a[4]));
  LUT6 #(
    .INIT(64'h8000010000000400)) 
    \spo[26]_INST_0_i_1 
       (.I0(a[5]),
        .I1(a[0]),
        .I2(a[2]),
        .I3(\spo[20]_INST_0_i_1_n_0 ),
        .I4(a[3]),
        .I5(a[1]),
        .O(\spo[26]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5000400000200000)) 
    \spo[26]_INST_0_i_2 
       (.I0(a[5]),
        .I1(a[2]),
        .I2(\spo[20]_INST_0_i_1_n_0 ),
        .I3(a[3]),
        .I4(a[1]),
        .I5(a[0]),
        .O(\spo[26]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000A8080808)) 
    \spo[27]_INST_0 
       (.I0(a[0]),
        .I1(\spo[27]_INST_0_i_1_n_0 ),
        .I2(a[5]),
        .I3(\spo[27]_INST_0_i_2_n_0 ),
        .I4(a[1]),
        .I5(a[4]),
        .O(spo[26]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0090)) 
    \spo[27]_INST_0_i_1 
       (.I0(a[1]),
        .I1(a[3]),
        .I2(\spo[20]_INST_0_i_1_n_0 ),
        .I3(a[2]),
        .O(\spo[27]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \spo[27]_INST_0_i_2 
       (.I0(a[3]),
        .I1(\spo[20]_INST_0_i_1_n_0 ),
        .I2(a[2]),
        .O(\spo[27]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB833B800B800B800)) 
    \spo[28]_INST_0 
       (.I0(\spo[28]_INST_0_i_1_n_0 ),
        .I1(a[4]),
        .I2(\spo[28]_INST_0_i_2_n_0 ),
        .I3(a[5]),
        .I4(\spo[28]_INST_0_i_3_n_0 ),
        .I5(a[0]),
        .O(spo[28]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00001000)) 
    \spo[28]_INST_0_i_1 
       (.I0(a[1]),
        .I1(a[3]),
        .I2(\spo[20]_INST_0_i_1_n_0 ),
        .I3(a[2]),
        .I4(a[0]),
        .O(\spo[28]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \spo[28]_INST_0_i_2 
       (.I0(a[1]),
        .I1(a[3]),
        .I2(\spo[20]_INST_0_i_1_n_0 ),
        .I3(a[2]),
        .I4(a[0]),
        .O(\spo[28]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \spo[28]_INST_0_i_3 
       (.I0(a[2]),
        .I1(\spo[20]_INST_0_i_1_n_0 ),
        .I2(a[3]),
        .I3(a[1]),
        .O(\spo[28]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hB888BBBBB8888888)) 
    \spo[2]_INST_0 
       (.I0(\spo[2]_INST_0_i_1_n_0 ),
        .I1(a[4]),
        .I2(\spo[3]_INST_0_i_2_n_0 ),
        .I3(a[0]),
        .I4(a[5]),
        .I5(\spo[28]_INST_0_i_3_n_0 ),
        .O(spo[1]));
  LUT6 #(
    .INIT(64'h5000400000000080)) 
    \spo[2]_INST_0_i_1 
       (.I0(a[5]),
        .I1(a[2]),
        .I2(\spo[20]_INST_0_i_1_n_0 ),
        .I3(a[3]),
        .I4(a[1]),
        .I5(a[0]),
        .O(\spo[2]_INST_0_i_1_n_0 ));
  MUXF7 \spo[30]_INST_0 
       (.I0(\spo[30]_INST_0_i_1_n_0 ),
        .I1(\spo[30]_INST_0_i_2_n_0 ),
        .O(spo[27]),
        .S(a[4]));
  LUT6 #(
    .INIT(64'h8012000001040000)) 
    \spo[30]_INST_0_i_1 
       (.I0(a[5]),
        .I1(a[0]),
        .I2(a[1]),
        .I3(a[3]),
        .I4(\spo[20]_INST_0_i_1_n_0 ),
        .I5(a[2]),
        .O(\spo[30]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000012000000)) 
    \spo[30]_INST_0_i_2 
       (.I0(a[5]),
        .I1(a[1]),
        .I2(a[3]),
        .I3(\spo[20]_INST_0_i_1_n_0 ),
        .I4(a[2]),
        .I5(a[0]),
        .O(\spo[30]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0A0A0C000C000)) 
    \spo[3]_INST_0 
       (.I0(\spo[28]_INST_0_i_1_n_0 ),
        .I1(\spo[3]_INST_0_i_1_n_0 ),
        .I2(a[4]),
        .I3(a[0]),
        .I4(\spo[3]_INST_0_i_2_n_0 ),
        .I5(a[5]),
        .O(spo[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hC080)) 
    \spo[3]_INST_0_i_1 
       (.I0(a[1]),
        .I1(a[3]),
        .I2(\spo[20]_INST_0_i_1_n_0 ),
        .I3(a[2]),
        .O(\spo[3]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0070)) 
    \spo[3]_INST_0_i_2 
       (.I0(a[2]),
        .I1(a[1]),
        .I2(\spo[20]_INST_0_i_1_n_0 ),
        .I3(a[3]),
        .O(\spo[3]_INST_0_i_2_n_0 ));
  MUXF7 \spo[4]_INST_0 
       (.I0(\spo[4]_INST_0_i_1_n_0 ),
        .I1(\spo[4]_INST_0_i_2_n_0 ),
        .O(spo[3]),
        .S(a[4]));
  LUT6 #(
    .INIT(64'h33F6BF7700000000)) 
    \spo[4]_INST_0_i_1 
       (.I0(a[5]),
        .I1(a[0]),
        .I2(a[2]),
        .I3(a[3]),
        .I4(a[1]),
        .I5(\spo[20]_INST_0_i_1_n_0 ),
        .O(\spo[4]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000001FF0000)) 
    \spo[4]_INST_0_i_2 
       (.I0(a[1]),
        .I1(a[3]),
        .I2(a[2]),
        .I3(a[5]),
        .I4(\spo[20]_INST_0_i_1_n_0 ),
        .I5(a[0]),
        .O(\spo[4]_INST_0_i_2_n_0 ));
  MUXF7 \spo[5]_INST_0 
       (.I0(\spo[5]_INST_0_i_1_n_0 ),
        .I1(\spo[5]_INST_0_i_2_n_0 ),
        .O(spo[4]),
        .S(a[4]));
  LUT6 #(
    .INIT(64'hC62A0000D4AF0000)) 
    \spo[5]_INST_0_i_1 
       (.I0(a[5]),
        .I1(a[0]),
        .I2(a[1]),
        .I3(a[3]),
        .I4(\spo[20]_INST_0_i_1_n_0 ),
        .I5(a[2]),
        .O(\spo[5]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5546000054EE0000)) 
    \spo[5]_INST_0_i_2 
       (.I0(a[5]),
        .I1(a[0]),
        .I2(a[1]),
        .I3(a[3]),
        .I4(\spo[20]_INST_0_i_1_n_0 ),
        .I5(a[2]),
        .O(\spo[5]_INST_0_i_2_n_0 ));
  MUXF7 \spo[6]_INST_0 
       (.I0(\spo[6]_INST_0_i_1_n_0 ),
        .I1(\spo[6]_INST_0_i_2_n_0 ),
        .O(spo[5]),
        .S(a[4]));
  LUT6 #(
    .INIT(64'hF02040A000000000)) 
    \spo[6]_INST_0_i_1 
       (.I0(a[5]),
        .I1(a[2]),
        .I2(\spo[20]_INST_0_i_1_n_0 ),
        .I3(a[3]),
        .I4(a[1]),
        .I5(a[0]),
        .O(\spo[6]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FF000010000000)) 
    \spo[6]_INST_0_i_2 
       (.I0(a[1]),
        .I1(a[3]),
        .I2(a[2]),
        .I3(a[5]),
        .I4(\spo[20]_INST_0_i_1_n_0 ),
        .I5(a[0]),
        .O(\spo[6]_INST_0_i_2_n_0 ));
  MUXF7 \spo[7]_INST_0 
       (.I0(\spo[7]_INST_0_i_1_n_0 ),
        .I1(\spo[7]_INST_0_i_2_n_0 ),
        .O(spo[6]),
        .S(a[4]));
  LUT6 #(
    .INIT(64'hA2CB07FB00000000)) 
    \spo[7]_INST_0_i_1 
       (.I0(a[5]),
        .I1(a[0]),
        .I2(a[1]),
        .I3(a[3]),
        .I4(a[2]),
        .I5(\spo[20]_INST_0_i_1_n_0 ),
        .O(\spo[7]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h3304000030000000)) 
    \spo[7]_INST_0_i_2 
       (.I0(a[0]),
        .I1(a[5]),
        .I2(a[1]),
        .I3(a[3]),
        .I4(\spo[20]_INST_0_i_1_n_0 ),
        .I5(a[2]),
        .O(\spo[7]_INST_0_i_2_n_0 ));
  MUXF7 \spo[8]_INST_0 
       (.I0(\spo[8]_INST_0_i_1_n_0 ),
        .I1(\spo[8]_INST_0_i_2_n_0 ),
        .O(spo[7]),
        .S(a[4]));
  LUT6 #(
    .INIT(64'h1A11000014A40000)) 
    \spo[8]_INST_0_i_1 
       (.I0(a[5]),
        .I1(a[0]),
        .I2(a[3]),
        .I3(a[1]),
        .I4(\spo[20]_INST_0_i_1_n_0 ),
        .I5(a[2]),
        .O(\spo[8]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000005150000)) 
    \spo[8]_INST_0_i_2 
       (.I0(a[0]),
        .I1(a[1]),
        .I2(a[3]),
        .I3(a[2]),
        .I4(\spo[20]_INST_0_i_1_n_0 ),
        .I5(a[5]),
        .O(\spo[8]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h2F20)) 
    \spo[9]_INST_0 
       (.I0(\spo[11]_INST_0_i_1_n_0 ),
        .I1(a[5]),
        .I2(a[4]),
        .I3(\spo[9]_INST_0_i_1_n_0 ),
        .O(spo[8]));
  LUT6 #(
    .INIT(64'h75DB0000F0400000)) 
    \spo[9]_INST_0_i_1 
       (.I0(a[5]),
        .I1(a[0]),
        .I2(a[2]),
        .I3(a[1]),
        .I4(\spo[20]_INST_0_i_1_n_0 ),
        .I5(a[3]),
        .O(\spo[9]_INST_0_i_1_n_0 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
