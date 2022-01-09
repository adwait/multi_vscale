`define SRC_A_SEL_WIDTH 2
`define SRC_A_RS1  `SRC_A_SEL_WIDTH'd0
`define SRC_A_PC   `SRC_A_SEL_WIDTH'd1
`define SRC_A_ZERO `SRC_A_SEL_WIDTH'd2

`define SRC_B_SEL_WIDTH 2
`define SRC_B_RS2  `SRC_B_SEL_WIDTH'd0
`define SRC_B_IMM  `SRC_B_SEL_WIDTH'd1
`define SRC_B_FOUR `SRC_B_SEL_WIDTH'd2
`define SRC_B_ZERO `SRC_B_SEL_WIDTH'd3

`define PC_SRC_SEL_WIDTH 3
`define PC_PLUS_FOUR     `PC_SRC_SEL_WIDTH'd0
`define PC_BRANCH_TARGET `PC_SRC_SEL_WIDTH'd1
`define PC_JAL_TARGET    `PC_SRC_SEL_WIDTH'd2
`define PC_JALR_TARGET   `PC_SRC_SEL_WIDTH'd3
`define PC_REPLAY        `PC_SRC_SEL_WIDTH'd4
`define PC_HANDLER       `PC_SRC_SEL_WIDTH'd5
`define PC_EPC           `PC_SRC_SEL_WIDTH'd6

`define IMM_TYPE_WIDTH 2
`define IMM_I `IMM_TYPE_WIDTH'd0
`define IMM_S `IMM_TYPE_WIDTH'd1
`define IMM_U `IMM_TYPE_WIDTH'd2
`define IMM_J `IMM_TYPE_WIDTH'd3

`define WB_SRC_SEL_WIDTH 2
`define WB_SRC_ALU  `WB_SRC_SEL_WIDTH'd0
`define WB_SRC_MEM  `WB_SRC_SEL_WIDTH'd1
`define WB_SRC_CSR  `WB_SRC_SEL_WIDTH'd2
`define WB_SRC_MD   `WB_SRC_SEL_WIDTH'd3

`define MEM_TYPE_WIDTH 3
`define MEM_TYPE_LB  `MEM_TYPE_WIDTH'd0
`define MEM_TYPE_LH  `MEM_TYPE_WIDTH'd1
`define MEM_TYPE_LW  `MEM_TYPE_WIDTH'd2
`define MEM_TYPE_LD  `MEM_TYPE_WIDTH'd3
`define MEM_TYPE_LBU `MEM_TYPE_WIDTH'd4
`define MEM_TYPE_LHU `MEM_TYPE_WIDTH'd5
`define MEM_TYPE_LWU `MEM_TYPE_WIDTH'd6

`define MEM_TYPE_WIDTH 3
`define MEM_TYPE_SB  `MEM_TYPE_WIDTH'd0
`define MEM_TYPE_SH  `MEM_TYPE_WIDTH'd1
`define MEM_TYPE_SW  `MEM_TYPE_WIDTH'd2
`define MEM_TYPE_SD  `MEM_TYPE_WIDTH'd3

`define HTIF_PCR_WIDTH 64

/** ================================= 
    // INFO: need to set/unset this depending upon whether you want hexfile instruction stream or manual/symbolic istream  
    ================================= **/
// `define FROM_HEXFILE 1   