// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue May 14 13:43:43 2024
// Host        : DESKTOP-UHEMGO5 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [7:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire ena;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [7:0]NLW_U0_doutb_UNCONNECTED;
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "8" *) 
  (* C_ADDRB_WIDTH = "8" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.3883 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_0.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "256" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "256" *) 
  (* C_WRITE_DEPTH_B = "256" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[7:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[7:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[7:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jLV29U0rrfMIZhYJzdoUrPoqB9eHQ5NXmWyCdqnN3Wgm+GU4C3zthrN1m4QGiaj0thPCIynZbX+0
7yjtkv+T5ByJ6NhiofAwWseGLvPXlYu6ERAPvi4SAYpF2VUqQHtPAbPmnPubGdDRgIEpeobF7hsz
rEcpEru1pyiScUriyuo=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
vsoizVrOONWw/DhjRLEYrtRmtji+Ok63CbpSg/l9VnoKAi8tAzqRbQ57atGB2N6IGGbKHkbK2Uzh
EHgWvYZeyt4hE+bpQX91vc9PNxfjQMGzPoFD3jCWk30EmEk+AND39eWx+DhJ8xhFuucoOQ2GwyAk
B+Mjs15naPE7DvlHel8hnD4dfSdYhGKp96oozu8JeBto8aHG6poOuYkxSwaut7NCI+mabCkMxtMp
RrydgmRuTvhRTbJMyx5CxFSZTRDrS5aU1vaRlnMiqKCI7g2KY9pemYaJsFeVodBuo6IyKGynyEhs
wr+VtUhQDtaVhMkwB95WwmMoDk9F2L5Au1I+TQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
W081dPMCWhKs5YlQD7n3zvf7+PTcnb8eFWxoVs8+zHLkxDMA1klITbsfztGYvJFce8Yao5XQLLqZ
oUE5Pq2arq+zwICFUcLjdMsmP1WmL82znHOPHm83zNwrxWMloHkySAqzFbgJeHa973uZqj0M8ydc
sYmzCYVlGVjt0QX0xqA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Zpc3MmdLWaVOv+S4z2POuoyslYoAbWc+Npxq2UyQRtDwf566IId3uwAetolMAgfLo/G3ezuSOXMn
8NznS37h9XvmVrxA50SAux68P87WgkLtiUYqM3CMBKkxNlZ/TR8WzTuQyFdvzkOE9lp8HC7LXnk5
RDsnOM+su46FW7ysY01COslo9Xc7rhs6WFqx29+Xcqk8+ZMLSzaJfuwZdNmJFS3Q1vhlq3ZeYqMl
wMieB731KsPxjxp7VKNHpTbgFryC2isqc4ohBDOt52M/Bz4B/rIpFeHfZ7X3jWSiKtSuBsDN2NXf
EMjfAT248dlK7NxJ+NBNPhS5sLxTiGyQhta57A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rPMYqnkKhJKV1wltOfDrKos9ZbucaoX3WGTuqsdLkGpcKObzslHBwlGrKtWV7bZYmS2SM+QuEMfa
CE+tCUdsSiprp+n5BuSQlJa6BJ8mlqccjoo/JLw2QEmUhyMXQ3TLGomGGoZdeTmMPXhUBAOyLPea
Ddc8mgtTN8Kpy117GOTXDKP+IKJqW01fLrPJpgEhFiJCbyElLgtCRWmI94gX+y4XNVS0Cd1YwNw6
4nHgnEdC7fXARDKcYO3VsWC/pdzPQgursXloNLrVYa6i2xr+8E1V0+nSWwNYQZP7XUIVqXKMU8Ea
bT4acXrRCF/5tJJ5B9JparYI0zxXSbaakn1dIw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mfroTgL8g2pyIXQ/mGO9YHm19cd5mOlJ++qpusOYeVxGmkIhvF4aKx+AyIUz2yGGAeCtOzIasHty
pyqKgZhibSqxcpHgR0m6GOxXXOXJiHaK8NzxUzXeRJovcBI/WjtDhXeb1LRMI1J97jVBtJPJQH0Y
fGOD7jWvkvQwxnrZdyLp6kPWgSIcavHHDbO7iJv4gnyGp6W3/FCDo2RKWNLoW+SNjSdLZ6YRP8a+
ldaGU8TYvJ03KWlmik7repuN6AwxCjg2KeQ+x1sBAEXzROXomuSbvX3ZAo8UiIKAQY1SJumHLG3L
QI/S4Wbl1Hz6LDTsttMwP480gq6+tb6s1E4oWw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QJIabgm8dx/gVHbOQFwt8maOKVHFgkpZTPR6dzD8fqoGo9M9oGPTqBqchtPZWgv2UYFF2KEUSlV4
L3SDXBKrLs+NsAVTcICaEMiEi6j82zj/C1LsPkQfS8RLrg0ab8lbDMb5YqJ7lkHs3iM65x2iN1Mf
66cTgCbkAdl3rDpab75btpTQt5ZKiq5CSY3RZfyIW0uWbTGTELm6liuRKM9+K8BQwTU7A+FFFQBA
/9eJwQYzNNA/iwoYJ2WTPd6pBlzXriNLu9M+/2bYicNBSuH1PBR9v2ESrTB6k7EiV1zvBXV9NuG/
sFt4MumWMuSNwP2W38bQATxxW/l0IrmaXGOC/w==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
lhKf/Vgj6pHpme1ji4HVe36BU8pMkam/2I9lFeyOiBnIbzgdEGfLJBcEvkL33A7s0hxa6LFbHnkT
upgMpPjmIghBz3xUQ13vpiY152thFec6qvlcdg1r+GTmnBOSFl6g/OfZ3eFUhfsve6ZjQHpXnKFo
a55hN2+eP1EG9+VxGeM7XkHaeFhEIry52qtnmg072KEFIwRiGs2d/TJ4AqupuIdIiP1kTN9k+oqa
2ta1vdtqPY0dDHqrf+5YSd0CejkhQeCqg/bauLP3755SwdOPRgooG5ANT8hUpTiFMFXtU+GC9NSp
evJtMHUy1NbgMmhFHO+w3URLEdjSaBxZPD7YLdWkF65jY526tJzoek+BzEKoBaGfCaY7O1nHKXm+
89k3rPUy0Xo4/0nHpno+N/Db09heJPbnGsCwN/l+KnR6Lz8kvWziBjZe0ijOkKI+T12y3T1VeOtY
H/aqtNlQt1mhFwrbw6ezaAiDPVbCQXnly6b4tbb8+nFsxWOGIGAfLozB

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PNsQ8uEcQYrl+GaDuBaq1tQ5br5aAdaqHnyrc0NVu/JnQUk53jaiLx8Oz5fNACvWelUUk2/C+P5I
b2rbU1bb/dC6TqC5J1N0yoMYRYw58u4Lrl8Kgqgt9Rlph5Qgzzfxp+oblXF/pO4mRyAXpZhpNkFT
0Ar9BUtPOTOtJ9/g53SRnZ6GjxzfeD+25J4fcXBNo2gCTgUkwiLSsJRwTB/cJmn+dZPwPdIOHEP9
TkfDK+OrbLYO3T+DFBTCMRNH2NB1J9sc5s+nPU8iYnjgPTo6HoGW+LIlCz6yNJMZzJzoeW708utc
0fJXkT7vLDVh7olvy3V9AAY8Do0YR1kiZlhVhQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zAz8RnGHFebkJFAS+gjC+mXHW7m7We+JgSmIz15mS01u/4+9Ng0sJfkeXOClmVPTQ2Mp2Yuv6/6f
ehzUTcANilWsqLM6Q1FToCPNX/NTqodlcHirGM7b5R9yevouNT/aqH12nmbunBQmBHmehNutdCjG
r6Z7kZgeZ2ZE7MMOF0rTy1XHEPkqgMNTRoS8R/pPWPTW4/j+bn3aJj0Q/fTz4Gi3mbSUKWs2fREQ
UKiuolNJkN6DiDvhlVYHUyytXNJG44ikmBXehoQQRLapkYaxnQmMRT1ok9uY6pKoy71CtvJ3Mt2x
EQv1GU2i4qQyAOwa0mkEohWXduicU6tDz3zQwQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TK3eE9V+v1z2P1KjG4GrjhA1n3qDOpNzLGXdtjnjhF0QBFPSuhC+nmNqTPOb3p2a9r5KD0miY3Cd
+KpjH6Ao09E2/LD2Go4aLQh6vP+9BldlSKEwCGfx2NjBQrXWVH21lQR7IRjOvyTOclpd7SgtUJLw
dvebETyLiKr9C6RfnIBeptuCA3iJlXfwkh6I0JfzD5WBizQkotioZmmrXv5105pCXQ4Ta1WThFsA
2ll9dZeSjEDHUxxhfyfjryv9m4VL89ZDU/rGITsdptwB1BC1jLqmPDymY05lyECnjA6NIR5GGfI4
K2y2f4GfikKoN5r9IOvFzw963Wm82ZZPtXOKGg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20880)
`pragma protect data_block
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
hzuXvZLJC4TuOjQHUDha3l9i
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
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
    reg GRESTORE_int;

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
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

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

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
