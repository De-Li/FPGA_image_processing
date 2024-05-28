// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue May 14 13:43:44 2024
// Host        : DESKTOP-UHEMGO5 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/power/BRAM_practice/BRAM_practice.gen/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
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
  blk_mem_gen_0_blk_mem_gen_v8_4_7 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20864)
`pragma protect data_block
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
z8Q=
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
