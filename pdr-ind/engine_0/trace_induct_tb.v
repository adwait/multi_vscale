`ifndef VERILATOR
module testbench;
  reg [4095:0] vcdfile;
  reg clock;
`else
module testbench(input clock, output reg genclock);
  initial genclock = 1;
`endif
  reg genclock = 1;
  reg [31:0] cycle = 0;
  reg [0:0] PI_htif_pcr_req_rw;
  reg [63:0] PI_htif_pcr_req_data;
  reg [0:0] PI_arbiter_next_core;
  reg [0:0] PI_htif_pcr_req_valid;
  wire [0:0] PI_clk = clock;
  reg [0:0] PI_htif_pcr_resp_ready;
  reg [11:0] PI_htif_pcr_req_addr;
  reg [0:0] PI_reset;
  vscale_sim_top UUT (
    .htif_pcr_req_rw(PI_htif_pcr_req_rw),
    .htif_pcr_req_data(PI_htif_pcr_req_data),
    .arbiter_next_core(PI_arbiter_next_core),
    .htif_pcr_req_valid(PI_htif_pcr_req_valid),
    .clk(PI_clk),
    .htif_pcr_resp_ready(PI_htif_pcr_resp_ready),
    .htif_pcr_req_addr(PI_htif_pcr_req_addr),
    .reset(PI_reset)
  );
`ifndef VERILATOR
  initial begin
    if ($value$plusargs("vcd=%s", vcdfile)) begin
      $dumpfile(vcdfile);
      $dumpvars(0, testbench);
    end
    #5 clock = 0;
    while (genclock) begin
      #5 clock = 0;
      #5 clock = 1;
    end
  end
`endif
  initial begin
`ifndef VERILATOR
    #1;
`endif
    // UUT.$formal$formal.\v:107$47_CHECK  = 1'b1;
    // UUT.$formal$formal.\v:107$47_EN  = 1'b0;
    UUT.arbiter.cur_core = 1'b1;
    UUT.arbiter.prev_core = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.PC_DX = 32'b00100100111111110111111010111111;
    UUT.\core_gen_block[0] .vscale.pipeline.PC_IF = 32'b00000000111101110110110000100111;
    UUT.\core_gen_block[0] .vscale.pipeline.PC_WB = 32'b00000101111001111111111000101011;
    UUT.\core_gen_block[0] .vscale.pipeline.alu_out_WB = 32'b11010001000110100100000101000000;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30759  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30762  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30765  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30768  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30771  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30774  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30777  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30780  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30783  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30786  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30789  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30792  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30795  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30798  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30801  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30804  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30807  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30810  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30813  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30816  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30819  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30822  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30825  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30828  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30831  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30834  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30837  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30840  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30843  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30846  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30849  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30852  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.cycle_full = 64'b1111111111111111111111111111111111111111111111111111111111111111;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.from_host = 32'b00000000000000000000000000000000;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[0]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[10]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[11]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[12]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[13]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[14]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[15]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[16]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[17]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[18]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[19]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[1]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[20]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[21]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[22]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[23]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[24]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[25]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[26]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[27]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[28]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[29]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[2]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[30]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[31]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[3]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[4]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[5]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[6]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[7]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[8]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\htif_resp_data_reg[9]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.htif_state = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.instret_full = 64'b0000000000000000000011111001011011111111101111000100100011111111;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.mbadaddr = 32'b11111111111111111111101100000000;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.mecode = 4'b0000;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[10]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[11]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[12]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[13]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[14]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[15]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[16]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[17]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[18]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[19]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[20]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[21]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[22]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[23]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[24]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[25]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[26]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[27]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[28]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[29]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[2]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[30]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[31]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[3]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[4]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[5]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[6]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[7]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[8]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[9]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.mint = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.mscratch = 32'b00100000000000000000100000000000;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.msie = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.msip = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.mtie = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.mtime_full = 64'b0000000000000000000000000000000010011111111000110100010000100111;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.mtimecmp = 32'b10010111010000000100010010101011;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.mtip = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[10]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[11]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[12]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[13]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[14]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[15]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[16]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[17]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[18]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[19]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[20]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[21]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[22]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[23]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[24]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[25]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[26]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[27]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[28]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[29]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[2]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[30]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[31]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[3]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[4]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[5]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[6]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[7]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[8]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[9]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.priv_stack = 6'b000110;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.time_full = 64'b1111111111111111111111111111111111111111111111111111111111111111;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.to_host = 32'b00000000000000000000000000000011;
    UUT.\core_gen_block[0] .vscale.pipeline.csr_rdata_WB = 32'b00000000000000000000010000000000;
    UUT.\core_gen_block[0] .vscale.pipeline.ctrl.dmem_en_WB = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.ctrl.had_ex_DX = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.ctrl.had_ex_WB = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.ctrl.\prev_ex_code_WB_reg[0]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.ctrl.\prev_ex_code_WB_reg[1]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.ctrl.\prev_ex_code_WB_reg[3]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.ctrl.prev_killed_DX = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.ctrl.prev_killed_WB = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.ctrl.reg_to_wr_WB = 5'b00000;
    UUT.\core_gen_block[0] .vscale.pipeline.ctrl.replay_IF = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.ctrl.store_in_WB = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.ctrl.uses_md_WB = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.ctrl.wb_src_sel_WB = 2'b11;
    UUT.\core_gen_block[0] .vscale.pipeline.ctrl.wr_reg_unkilled_WB = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.dmem_type_WB = 3'b001;
    UUT.\core_gen_block[0] .vscale.pipeline.inst_DX = 32'b00000000000000000001000000001111;
    UUT.\core_gen_block[0] .vscale.pipeline.md.a = 64'b0000000000000000000100000000000011110110100010101110101000010111;
    UUT.\core_gen_block[0] .vscale.pipeline.md.b = 64'b0001011111111111111111101101101101111110100000001000101000010001;
    UUT.\core_gen_block[0] .vscale.pipeline.md.counter = 5'b11110;
    UUT.\core_gen_block[0] .vscale.pipeline.md.negate_output = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.md.op = 2'b10;
    UUT.\core_gen_block[0] .vscale.pipeline.md.out_sel = 2'b10;
    UUT.\core_gen_block[0] .vscale.pipeline.md.result = 64'b0000100000000000000000000010000000001110100000100111100000010100;
    UUT.\core_gen_block[0] .vscale.pipeline.md.state = 2'b11;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[0]  = 32'b01101111001101000011010011001111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[10]  = 32'b10000010100000000000011001011101;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[11]  = 32'b00000100000000000000000000011101;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[12]  = 32'b00010000000000100000000001011101;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[13]  = 32'b00010100001000101000100011011111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[14]  = 32'b10011100001001100010100101011101;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[15]  = 32'b01011100000000000011000001001111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[16]  = 32'b00111100101001000001010011011101;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[17]  = 32'b00000100001000000000000000001111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[18]  = 32'b10100110100000000001010101011101;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[19]  = 32'b01000100000000000000000011111101;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[1]  = 32'b00000000000000000000010000000110;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[20]  = 32'b11111100101001000010000011011101;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[21]  = 32'b00111000001000100000000011001111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[22]  = 32'b11110100001000010010010111011101;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[23]  = 32'b01110110101000010000000001111111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[24]  = 32'b10111000001000000011010001011101;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[25]  = 32'b00111100001000000000100011011111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[26]  = 32'b00100000101000000001000001011101;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[27]  = 32'b00000100001000000000000000101111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[28]  = 32'b00000001000000000000100001011101;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[29]  = 32'b00100010101100100010001101011101;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[2]  = 32'b00000000000000010000000000000101;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[30]  = 32'b11001001000000000001000001011101;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[31]  = 32'b10000110001000000001100011101111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[3]  = 32'b00000100001000000000000100001110;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[4]  = 32'b10110000001000100001010101011101;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[5]  = 32'b10000000000000001000000001011111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[6]  = 32'b11110011000000101000000001011101;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[7]  = 32'b00000000000000000000000000111111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[8]  = 32'b11011100101000000001010001011101;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[9]  = 32'b01001000000110101100001011011111;
    UUT.\core_gen_block[0] .vscale.pipeline.store_data_WB = 32'b00000000000000000000000000000000;
    UUT.counter = 4'b0000;
    UUT.hasti_mem.\mem$rdreg_reg[32]$q[0]  = 1'b1;
    UUT.hasti_mem.\mem$rdreg_reg[32]$q[1]  = 1'b1;
    UUT.hasti_mem.\mem$rdreg_reg[32]$q[2]  = 1'b0;
    UUT.hasti_mem.\mem$rdreg_reg[32]$q[3]  = 1'b1;
    UUT.hasti_mem.\mem$rdreg_reg[32]$q[4]  = 1'b0;
    UUT.hasti_mem.\mem$rdreg_reg[33]$q[0]  = 1'b0;
    UUT.hasti_mem.\mem$rdreg_reg[33]$q[1]  = 1'b0;
    UUT.hasti_mem.\mem$rdreg_reg[33]$q[2]  = 1'b1;
    UUT.hasti_mem.\mem$rdreg_reg[33]$q[3]  = 1'b1;
    UUT.hasti_mem.\mem$rdreg_reg[33]$q[4]  = 1'b1;
    UUT.hasti_mem.\mem[0]  = 32'b11100110001111111101101111101111;
    UUT.hasti_mem.\mem[10]  = 32'b10000001101100101001101010010011;
    UUT.hasti_mem.\mem[11]  = 32'b10100000111101110111110100000111;
    UUT.hasti_mem.\mem[12]  = 32'b01111110111010000011111110111111;
    UUT.hasti_mem.\mem[13]  = 32'b11011111101111010011111111110111;
    UUT.hasti_mem.\mem[14]  = 32'b11111011101111110111110111110111;
    UUT.hasti_mem.\mem[15]  = 32'b11111011111111000111110111100111;
    UUT.hasti_mem.\mem[16]  = 32'b01111100111111111100111011101111;
    UUT.hasti_mem.\mem[17]  = 32'b01001001100101110111011111101011;
    UUT.hasti_mem.\mem[18]  = 32'b10111111000000011000111010100011;
    UUT.hasti_mem.\mem[19]  = 32'b00110100101110000111110100010011;
    UUT.hasti_mem.\mem[1]  = 32'b10000110111100010101000100110011;
    UUT.hasti_mem.\mem[20]  = 32'b00000100100000111000100110010011;
    UUT.hasti_mem.\mem[21]  = 32'b01001100111010111100111110111111;
    UUT.hasti_mem.\mem[22]  = 32'b01000000000010010011011100010111;
    UUT.hasti_mem.\mem[23]  = 32'b10001101110010011101011101110111;
    UUT.hasti_mem.\mem[24]  = 32'b00001110011001010000000001110011;
    UUT.hasti_mem.\mem[25]  = 32'b11011111111111000011111101101111;
    UUT.hasti_mem.\mem[26]  = 32'b11111110111011111111111011111111;
    UUT.hasti_mem.\mem[27]  = 32'b11101111111111111111111110111111;
    UUT.hasti_mem.\mem[28]  = 32'b11111110001110110111101110110001;
    UUT.hasti_mem.\mem[29]  = 32'b11111110111010111101111111111011;
    UUT.hasti_mem.\mem[2]  = 32'b00000011010100010000000001100011;
    UUT.hasti_mem.\mem[30]  = 32'b00000010111111110101111110110011;
    UUT.hasti_mem.\mem[31]  = 32'b01111001000110010001111111110011;
    UUT.hasti_mem.\mem[3]  = 32'b00000010111100010010001010110011;
    UUT.hasti_mem.\mem[4]  = 32'b00101111110100010000110100110011;
    UUT.hasti_mem.\mem[5]  = 32'b11101110111001011111110111100111;
    UUT.hasti_mem.\mem[6]  = 32'b11111001101111100011110010110001;
    UUT.hasti_mem.\mem[7]  = 32'b11111111111111011111110111011111;
    UUT.hasti_mem.\mem[8]  = 32'b11111110111011010111111111101101;
    UUT.hasti_mem.\mem[9]  = 32'b11011110111011111111111111101111;
    UUT.hasti_mem.p0_state = 1'b0;
    UUT.hasti_mem.p0_waddr = 32'b00000000000000000000000001001110;
    UUT.hasti_mem.p0_wsize = 3'b101;
    UUT.hasti_mem.p0_wvalid = 1'b1;
    UUT.hasti_mem.\p1_bypass[0]  = 1'b1;
    UUT.head_ptr = 2'b01;
    UUT.next_pc = 32'b11111111111111111111111111111100;
    UUT.\windows[0]  = 32'b00000000000000000000000000001110;
    UUT.\windows[1]  = 32'b00000000000000000000000000000000;
    UUT.\windows[2]  = 32'b00000000000000000000000000001000;
    UUT.events[2'b10] = 3'b001;
    UUT.events[2'b01] = 3'b111;
    UUT.events[2'b00] = 3'b111;

    // state 0
    PI_htif_pcr_req_rw = 1'b1;
    PI_htif_pcr_req_data = 64'b0000000000000000000000000000000000001011100000001010101111000111;
    PI_arbiter_next_core = 1'b0;
    PI_htif_pcr_req_valid = 1'b1;
    PI_htif_pcr_resp_ready = 1'b0;
    PI_htif_pcr_req_addr = 12'b011110000000;
    PI_reset = 1'b1;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_htif_pcr_req_rw <= 1'b0;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000000001110101100100000100111101001;
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_valid <= 1'b1;
      PI_htif_pcr_resp_ready <= 1'b0;
      PI_htif_pcr_req_addr <= 12'b011110000000;
      PI_reset <= 1'b0;
    end

    // state 2
    if (cycle == 1) begin
      PI_htif_pcr_req_rw <= 1'b0;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000010000110110100100010100111011101;
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_valid <= 1'b1;
      PI_htif_pcr_resp_ready <= 1'b1;
      PI_htif_pcr_req_addr <= 12'b011110000000;
      PI_reset <= 1'b0;
    end

    // state 3
    if (cycle == 2) begin
      PI_htif_pcr_req_rw <= 1'b0;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000000000000011000011111111111110010;
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_valid <= 1'b1;
      PI_htif_pcr_resp_ready <= 1'b1;
      PI_htif_pcr_req_addr <= 12'b111110000000;
      PI_reset <= 1'b0;
    end

    // state 4
    if (cycle == 3) begin
      PI_htif_pcr_req_rw <= 1'b1;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000000000101100001000101100010000011;
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_valid <= 1'b1;
      PI_htif_pcr_resp_ready <= 1'b1;
      PI_htif_pcr_req_addr <= 12'b011110000000;
      PI_reset <= 1'b0;
    end

    // state 5
    if (cycle == 4) begin
      PI_htif_pcr_req_rw <= 1'b0;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000000100000001010000000010000001000;
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_valid <= 1'b1;
      PI_htif_pcr_resp_ready <= 1'b1;
      PI_htif_pcr_req_addr <= 12'b011110000000;
      PI_reset <= 1'b0;
    end

    // state 6
    if (cycle == 5) begin
      PI_htif_pcr_req_rw <= 1'b0;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000010110010100000100100100010001001;
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_valid <= 1'b1;
      PI_htif_pcr_resp_ready <= 1'b1;
      PI_htif_pcr_req_addr <= 12'b011110000000;
      PI_reset <= 1'b0;
    end

    // state 7
    if (cycle == 6) begin
      PI_htif_pcr_req_rw <= 1'b0;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000000010000100000000001000000000010;
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_valid <= 1'b1;
      PI_htif_pcr_resp_ready <= 1'b1;
      PI_htif_pcr_req_addr <= 12'b111110000000;
      PI_reset <= 1'b0;
    end

    // state 8
    if (cycle == 7) begin
      PI_htif_pcr_req_rw <= 1'b1;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000000001011100000001010101111000111;
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_valid <= 1'b0;
      PI_htif_pcr_resp_ready <= 1'b0;
      PI_htif_pcr_req_addr <= 12'b011110000000;
      PI_reset <= 1'b0;
    end

    // state 9
    if (cycle == 8) begin
      PI_htif_pcr_req_rw <= 1'b1;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000000000010000001010010100111100101;
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_valid <= 1'b1;
      PI_htif_pcr_resp_ready <= 1'b1;
      PI_htif_pcr_req_addr <= 12'b011110000000;
      PI_reset <= 1'b0;
    end

    // state 10
    if (cycle == 9) begin
      PI_htif_pcr_req_rw <= 1'b1;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000010101011000100001000110010110010;
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_valid <= 1'b0;
      PI_htif_pcr_resp_ready <= 1'b0;
      PI_htif_pcr_req_addr <= 12'b011110000000;
      PI_reset <= 1'b0;
    end

    // state 11
    if (cycle == 10) begin
      PI_htif_pcr_req_rw <= 1'b1;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000010000110100000000000000111111101;
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_valid <= 1'b1;
      PI_htif_pcr_resp_ready <= 1'b0;
      PI_htif_pcr_req_addr <= 12'b111110000000;
      PI_reset <= 1'b0;
    end

    // state 12
    if (cycle == 11) begin
      PI_htif_pcr_req_rw <= 1'b1;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000000000000000000000000000100011001;
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_valid <= 1'b1;
      PI_htif_pcr_resp_ready <= 1'b1;
      PI_htif_pcr_req_addr <= 12'b011110000000;
      PI_reset <= 1'b0;
    end

    // state 13
    if (cycle == 12) begin
      PI_htif_pcr_req_rw <= 1'b1;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000000000010100001000000001001101101;
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_valid <= 1'b0;
      PI_htif_pcr_resp_ready <= 1'b0;
      PI_htif_pcr_req_addr <= 12'b011110000000;
      PI_reset <= 1'b0;
    end

    // state 14
    if (cycle == 13) begin
      PI_htif_pcr_req_rw <= 1'b1;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000000001111000000100000000001100110;
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_valid <= 1'b1;
      PI_htif_pcr_resp_ready <= 1'b0;
      PI_htif_pcr_req_addr <= 12'b011110000000;
      PI_reset <= 1'b0;
    end

    // state 15
    if (cycle == 14) begin
      PI_htif_pcr_req_rw <= 1'b1;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000000000010000000000000001100000001;
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_valid <= 1'b1;
      PI_htif_pcr_resp_ready <= 1'b1;
      PI_htif_pcr_req_addr <= 12'b011110000000;
      PI_reset <= 1'b0;
    end

    // state 16
    if (cycle == 15) begin
      PI_htif_pcr_req_rw <= 1'b1;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000000000011100000000000100000000111;
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_valid <= 1'b1;
      PI_htif_pcr_resp_ready <= 1'b0;
      PI_htif_pcr_req_addr <= 12'b010110000000;
      PI_reset <= 1'b1;
    end

    // state 17
    if (cycle == 16) begin
      PI_htif_pcr_req_rw <= 1'b1;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000000111111111111011111111111000001;
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_valid <= 1'b1;
      PI_htif_pcr_resp_ready <= 1'b1;
      PI_htif_pcr_req_addr <= 12'b010110000000;
      PI_reset <= 1'b0;
    end

    // state 18
    if (cycle == 17) begin
      PI_htif_pcr_req_rw <= 1'b1;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000000000000000000000000000000000100;
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_valid <= 1'b1;
      PI_htif_pcr_resp_ready <= 1'b0;
      PI_htif_pcr_req_addr <= 12'b111110000000;
      PI_reset <= 1'b0;
    end

    // state 19
    if (cycle == 18) begin
      PI_htif_pcr_req_rw <= 1'b0;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_valid <= 1'b0;
      PI_htif_pcr_resp_ready <= 1'b0;
      PI_htif_pcr_req_addr <= 12'b000000000000;
      PI_reset <= 1'b0;
    end

    // state 20
    if (cycle == 19) begin
      PI_htif_pcr_req_rw <= 1'b0;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_valid <= 1'b0;
      PI_htif_pcr_resp_ready <= 1'b0;
      PI_htif_pcr_req_addr <= 12'b000000000000;
      PI_reset <= 1'b0;
    end

    genclock <= cycle < 20;
    cycle <= cycle + 1;
  end
endmodule
