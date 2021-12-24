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
  reg [0:0] PI_arbiter_next_core;
  reg [63:0] PI_htif_pcr_req_data;
  reg [11:0] PI_htif_pcr_req_addr;
  reg [0:0] PI_htif_pcr_req_valid;
  reg [0:0] PI_reset;
  reg [0:0] PI_htif_pcr_req_rw;
  wire [0:0] PI_clk = clock;
  reg [0:0] PI_htif_pcr_resp_ready;
  vscale_sim_top UUT (
    .arbiter_next_core(PI_arbiter_next_core),
    .htif_pcr_req_data(PI_htif_pcr_req_data),
    .htif_pcr_req_addr(PI_htif_pcr_req_addr),
    .htif_pcr_req_valid(PI_htif_pcr_req_valid),
    .reset(PI_reset),
    .htif_pcr_req_rw(PI_htif_pcr_req_rw),
    .clk(PI_clk),
    .htif_pcr_resp_ready(PI_htif_pcr_resp_ready)
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
    // UUT.\$formal$formal-ind .\v:115$49_CHECK  = 1'b1;
    // UUT.\$formal$formal-ind .\v:115$49_EN  = 1'b0;
    UUT.arbiter.cur_core = 1'b1;
    UUT.arbiter.prev_core = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.PC_DX = 32'b11100000000000001011000001000110;
    UUT.\core_gen_block[0] .vscale.pipeline.PC_IF = 32'b11100000000000001011000001000100;
    UUT.\core_gen_block[0] .vscale.pipeline.PC_WB = 32'b01000001010001100010010110100100;
    UUT.\core_gen_block[0] .vscale.pipeline.alu_out_WB = 32'b00000101101000010001000100110111;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30776  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30779  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30782  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30785  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30788  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30791  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30794  = 1'b1;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30797  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30800  = 1'b1;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30803  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30806  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30809  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30812  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30815  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30818  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30821  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30824  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30827  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30830  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30833  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30836  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30839  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30842  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30845  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30848  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30851  = 1'b1;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30854  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30857  = 1'b1;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30860  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30863  = 1'b1;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30866  = 1'b0;
    // UUT.\core_gen_block[0] .vscale.pipeline.csr.$auto$async2sync.\cc:171:execute$30869  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.cycle_full = 64'b0110001000100010100001111110000011111111111111001111111111111001;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.from_host = 32'b10000100100010111111011101000101;
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
    UUT.\core_gen_block[0] .vscale.pipeline.csr.instret_full = 64'b1000111001011101001011000100111100000000000000001111111111110100;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.mbadaddr = 32'b00000000000000000111010101110110;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.mecode = 4'b0000;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[10]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[11]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[12]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[13]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[14]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[15]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[16]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[17]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[18]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[19]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[20]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[21]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[22]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[23]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[24]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[25]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[26]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[27]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[28]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[29]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[2]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[30]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[31]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[3]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[4]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[5]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[6]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[7]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[8]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mepc_reg[9]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.mint = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.mscratch = 32'b10000000000000000000000010011100;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.msie = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.msip = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.mtie = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.mtime_full = 64'b0000000000000000000000000001111101111111111111111111111111110011;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.mtimecmp = 32'b01111111111111111111111111111101;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.mtip = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[10]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[11]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[12]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[13]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[14]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[15]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[16]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[17]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[18]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[19]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[20]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[21]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[22]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[23]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[24]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[25]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[26]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[27]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[28]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[29]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[2]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[30]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[31]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[3]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[4]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[5]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[6]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[7]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[8]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.\mtvec_reg[9]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.priv_stack = 6'b101011;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.time_full = 64'b0000000000000000000000000000100100000000011111111111111111111111;
    UUT.\core_gen_block[0] .vscale.pipeline.csr.to_host = 32'b00000000000000000000000000000100;
    UUT.\core_gen_block[0] .vscale.pipeline.csr_rdata_WB = 32'b00000000000000000000000000000010;
    UUT.\core_gen_block[0] .vscale.pipeline.ctrl.dmem_en_WB = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.ctrl.had_ex_DX = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.ctrl.had_ex_WB = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.ctrl.\prev_ex_code_WB_reg[0]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.ctrl.\prev_ex_code_WB_reg[1]  = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.ctrl.\prev_ex_code_WB_reg[3]  = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.ctrl.prev_killed_DX = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.ctrl.prev_killed_WB = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.ctrl.reg_to_wr_WB = 5'b00001;
    UUT.\core_gen_block[0] .vscale.pipeline.ctrl.replay_IF = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.ctrl.store_in_WB = 1'b0;
    UUT.\core_gen_block[0] .vscale.pipeline.ctrl.uses_md_WB = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.ctrl.wb_src_sel_WB = 2'b10;
    UUT.\core_gen_block[0] .vscale.pipeline.ctrl.wr_reg_unkilled_WB = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.dmem_type_WB = 3'b001;
    UUT.\core_gen_block[0] .vscale.pipeline.inst_DX = 32'b00010000000101010101000111100011;
    UUT.\core_gen_block[0] .vscale.pipeline.md.a = 64'b0111101100010001000011011101101100110100000010111111010000101000;
    UUT.\core_gen_block[0] .vscale.pipeline.md.b = 64'b0100001010101101110110111000000101111100101111011111011100111100;
    UUT.\core_gen_block[0] .vscale.pipeline.md.counter = 5'b00100;
    UUT.\core_gen_block[0] .vscale.pipeline.md.negate_output = 1'b1;
    UUT.\core_gen_block[0] .vscale.pipeline.md.op = 2'b10;
    UUT.\core_gen_block[0] .vscale.pipeline.md.out_sel = 2'b10;
    UUT.\core_gen_block[0] .vscale.pipeline.md.result = 64'b0000000000000000000000000000001111101111001000111110000000110111;
    UUT.\core_gen_block[0] .vscale.pipeline.md.state = 2'b01;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[0]  = 32'b00000111101001010110101000001001;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[10]  = 32'b10110111110111111111011001101111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[11]  = 32'b10100000001010101100100101111111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[12]  = 32'b01111110101111111111111100100111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[13]  = 32'b11111111111111111111111101111111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[14]  = 32'b00010010100000100010000000001111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[15]  = 32'b00000000000000000000000000001111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[16]  = 32'b11100110010111100011111000111111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[17]  = 32'b11101111111111111111111111111111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[18]  = 32'b00100110110001010010010100101111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[19]  = 32'b11111110111001110011110011111111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[1]  = 32'b00000000100010000000000101000001;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[20]  = 32'b11111011010010110011101111101111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[21]  = 32'b01111111010110111111111111111111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[22]  = 32'b01001001000001000010001010001110;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[23]  = 32'b11111111111111111111111111111101;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[24]  = 32'b11111111111101111011011110101111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[25]  = 32'b11111110111111111111111101101111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[26]  = 32'b11111110110111111111011111111111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[27]  = 32'b11110101101000110110110100111111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[28]  = 32'b11111111011111110111111101101111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[29]  = 32'b11111111111111111111111111111111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[2]  = 32'b00011011101000100110011100100000;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[30]  = 32'b00100001100101000000011010001111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[31]  = 32'b10111110001010101011010011111111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[3]  = 32'b11111111101001111101010111110000;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[4]  = 32'b00011001001110001010001101001101;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[5]  = 32'b11111111011111111111111111111111;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[6]  = 32'b00000000000000000000000000000110;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[7]  = 32'b10000000011100010001000011000001;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[8]  = 32'b11101101110111100011001100100000;
    UUT.\core_gen_block[0] .vscale.pipeline.regfile.\data[9]  = 32'b11011101111101111111111101111111;
    UUT.\core_gen_block[0] .vscale.pipeline.store_data_WB = 32'b10010000101000001110011111000101;
    UUT.counter = 3'b101;
    UUT.hasti_mem.\mem$rdreg_reg[32]$q[0]  = 1'b0;
    UUT.hasti_mem.\mem$rdreg_reg[32]$q[1]  = 1'b0;
    UUT.hasti_mem.\mem$rdreg_reg[32]$q[2]  = 1'b0;
    UUT.hasti_mem.\mem$rdreg_reg[32]$q[3]  = 1'b0;
    UUT.hasti_mem.\mem$rdreg_reg[32]$q[4]  = 1'b1;
    UUT.hasti_mem.\mem$rdreg_reg[33]$q[0]  = 1'b1;
    UUT.hasti_mem.\mem$rdreg_reg[33]$q[1]  = 1'b0;
    UUT.hasti_mem.\mem$rdreg_reg[33]$q[2]  = 1'b1;
    UUT.hasti_mem.\mem$rdreg_reg[33]$q[3]  = 1'b0;
    UUT.hasti_mem.\mem$rdreg_reg[33]$q[4]  = 1'b1;
    UUT.hasti_mem.\mem[0]  = 32'b11111110111011011011111010101101;
    UUT.hasti_mem.\mem[10]  = 32'b11111111111111111111111111111111;
    UUT.hasti_mem.\mem[11]  = 32'b11111111111011011111111111011111;
    UUT.hasti_mem.\mem[12]  = 32'b11111111101111111111111111100111;
    UUT.hasti_mem.\mem[13]  = 32'b11111111111111111111111011101111;
    UUT.hasti_mem.\mem[14]  = 32'b11111111001111111110111001010111;
    UUT.hasti_mem.\mem[15]  = 32'b11111111111111111111111011011101;
    UUT.hasti_mem.\mem[16]  = 32'b11111110111011011111111011101101;
    UUT.hasti_mem.\mem[17]  = 32'b11110001010101011111010000000011;
    UUT.hasti_mem.\mem[18]  = 32'b00001001000101111000001011101111;
    UUT.hasti_mem.\mem[19]  = 32'b01011000111100001111011010000111;
    UUT.hasti_mem.\mem[1]  = 32'b11111111110111011111111100001110;
    UUT.hasti_mem.\mem[20]  = 32'b11111110111011011111111011101111;
    UUT.hasti_mem.\mem[21]  = 32'b11111110111011111111111111111111;
    UUT.hasti_mem.\mem[22]  = 32'b00001000001000001000001100000011;
    UUT.hasti_mem.\mem[23]  = 32'b10010110011100110001101010110011;
    UUT.hasti_mem.\mem[24]  = 32'b11111110111011011111111011101101;
    UUT.hasti_mem.\mem[25]  = 32'b11111111111111011011111111011011;
    UUT.hasti_mem.\mem[26]  = 32'b10101110101001111001111000110111;
    UUT.hasti_mem.\mem[27]  = 32'b01111111111001011111111010100011;
    UUT.hasti_mem.\mem[28]  = 32'b11111110101011011100111011111111;
    UUT.hasti_mem.\mem[29]  = 32'b11111100000111111110111111011011;
    UUT.hasti_mem.\mem[2]  = 32'b11111111110000111101111101110111;
    UUT.hasti_mem.\mem[30]  = 32'b00110010000101111110101011100011;
    UUT.hasti_mem.\mem[31]  = 32'b01110110111001111110111111101011;
    UUT.hasti_mem.\mem[3]  = 32'b10111111111111110111111111011111;
    UUT.hasti_mem.\mem[4]  = 32'b01010110000100011111110101110011;
    UUT.hasti_mem.\mem[5]  = 32'b11010110101100101111110000001110;
    UUT.hasti_mem.\mem[6]  = 32'b11111111111011111111111111111011;
    UUT.hasti_mem.\mem[7]  = 32'b01111111111111111111111111111111;
    UUT.hasti_mem.\mem[8]  = 32'b01111110111011011111111111111111;
    UUT.hasti_mem.\mem[9]  = 32'b11111111111111111111111111111111;
    UUT.hasti_mem.p0_state = 1'b0;
    UUT.hasti_mem.p0_waddr = 32'b11110100000010111110100010110000;
    UUT.hasti_mem.p0_wsize = 3'b010;
    UUT.hasti_mem.p0_wvalid = 1'b1;
    UUT.hasti_mem.\p1_bypass[0]  = 1'b0;
    UUT.head_ptr = 2'b01;
    UUT.init = 1'b0;
    UUT.next_pc = 32'b00000000000000000000000001110100;
    UUT.\windows[0]  = 32'b00000000000000000000000001111001;
    UUT.\windows[1]  = 32'b01000001010001100010010110100100;
    UUT.\windows[2]  = 32'b11100000000000001011000001000100;
    UUT.events[2'b10] = 3'b011;
    UUT.events[2'b01] = 3'b011;
    UUT.events[2'b00] = 3'b011;

    // state 0
    PI_arbiter_next_core = 1'b0;
    PI_htif_pcr_req_data = 64'b0000000000000000000000000000000011010011111101110000101110001011;
    PI_htif_pcr_req_addr = 12'b011110000000;
    PI_htif_pcr_req_valid = 1'b1;
    PI_reset = 1'b0;
    PI_htif_pcr_req_rw = 1'b1;
    PI_htif_pcr_resp_ready = 1'b0;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000011010010011101100000100111011100;
      PI_htif_pcr_req_addr <= 12'b011110000000;
      PI_htif_pcr_req_valid <= 1'b1;
      PI_reset <= 1'b0;
      PI_htif_pcr_req_rw <= 1'b1;
      PI_htif_pcr_resp_ready <= 1'b1;
    end

    // state 2
    if (cycle == 1) begin
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000001001010101011111111111110100011;
      PI_htif_pcr_req_addr <= 12'b110100101010;
      PI_htif_pcr_req_valid <= 1'b1;
      PI_reset <= 1'b0;
      PI_htif_pcr_req_rw <= 1'b0;
      PI_htif_pcr_resp_ready <= 1'b1;
    end

    // state 3
    if (cycle == 2) begin
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000011000110011101100001100111001100;
      PI_htif_pcr_req_addr <= 12'b011110000000;
      PI_htif_pcr_req_valid <= 1'b1;
      PI_reset <= 1'b0;
      PI_htif_pcr_req_rw <= 1'b1;
      PI_htif_pcr_resp_ready <= 1'b1;
    end

    // state 4
    if (cycle == 3) begin
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000000111111101110111110110010111110;
      PI_htif_pcr_req_addr <= 12'b111110000000;
      PI_htif_pcr_req_valid <= 1'b1;
      PI_reset <= 1'b0;
      PI_htif_pcr_req_rw <= 1'b1;
      PI_htif_pcr_resp_ready <= 1'b1;
    end

    // state 5
    if (cycle == 4) begin
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000011000011000100100001110100001101;
      PI_htif_pcr_req_addr <= 12'b111110000000;
      PI_htif_pcr_req_valid <= 1'b1;
      PI_reset <= 1'b0;
      PI_htif_pcr_req_rw <= 1'b1;
      PI_htif_pcr_resp_ready <= 1'b1;
    end

    // state 6
    if (cycle == 5) begin
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000000100111000010111111111110011011;
      PI_htif_pcr_req_addr <= 12'b111110000000;
      PI_htif_pcr_req_valid <= 1'b1;
      PI_reset <= 1'b0;
      PI_htif_pcr_req_rw <= 1'b0;
      PI_htif_pcr_resp_ready <= 1'b1;
    end

    // state 7
    if (cycle == 6) begin
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000010000100000011100000110010100111;
      PI_htif_pcr_req_addr <= 12'b111110000000;
      PI_htif_pcr_req_valid <= 1'b1;
      PI_reset <= 1'b0;
      PI_htif_pcr_req_rw <= 1'b1;
      PI_htif_pcr_resp_ready <= 1'b1;
    end

    // state 8
    if (cycle == 7) begin
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000010000010100110001100011001010100;
      PI_htif_pcr_req_addr <= 12'b110100101010;
      PI_htif_pcr_req_valid <= 1'b0;
      PI_reset <= 1'b0;
      PI_htif_pcr_req_rw <= 1'b0;
      PI_htif_pcr_resp_ready <= 1'b0;
    end

    // state 9
    if (cycle == 8) begin
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000010001000000000000110100100101001;
      PI_htif_pcr_req_addr <= 12'b111110000000;
      PI_htif_pcr_req_valid <= 1'b1;
      PI_reset <= 1'b0;
      PI_htif_pcr_req_rw <= 1'b1;
      PI_htif_pcr_resp_ready <= 1'b1;
    end

    // state 10
    if (cycle == 9) begin
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000000101010010000000000110010101101;
      PI_htif_pcr_req_addr <= 12'b110100101010;
      PI_htif_pcr_req_valid <= 1'b1;
      PI_reset <= 1'b0;
      PI_htif_pcr_req_rw <= 1'b1;
      PI_htif_pcr_resp_ready <= 1'b1;
    end

    // state 11
    if (cycle == 10) begin
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000000101100001000000000000010001000;
      PI_htif_pcr_req_addr <= 12'b111110000000;
      PI_htif_pcr_req_valid <= 1'b0;
      PI_reset <= 1'b0;
      PI_htif_pcr_req_rw <= 1'b1;
      PI_htif_pcr_resp_ready <= 1'b0;
    end

    // state 12
    if (cycle == 11) begin
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000000000010100000001110110111011110;
      PI_htif_pcr_req_addr <= 12'b010110000000;
      PI_htif_pcr_req_valid <= 1'b1;
      PI_reset <= 1'b0;
      PI_htif_pcr_req_rw <= 1'b1;
      PI_htif_pcr_resp_ready <= 1'b1;
    end

    // state 13
    if (cycle == 12) begin
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000000011010110011111001111111101100;
      PI_htif_pcr_req_addr <= 12'b011110000000;
      PI_htif_pcr_req_valid <= 1'b1;
      PI_reset <= 1'b0;
      PI_htif_pcr_req_rw <= 1'b0;
      PI_htif_pcr_resp_ready <= 1'b1;
    end

    // state 14
    if (cycle == 13) begin
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000000010010110011111001111110001110;
      PI_htif_pcr_req_addr <= 12'b010110000000;
      PI_htif_pcr_req_valid <= 1'b1;
      PI_reset <= 1'b0;
      PI_htif_pcr_req_rw <= 1'b1;
      PI_htif_pcr_resp_ready <= 1'b1;
    end

    // state 15
    if (cycle == 14) begin
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000000000000000001101110111011010110;
      PI_htif_pcr_req_addr <= 12'b011110000000;
      PI_htif_pcr_req_valid <= 1'b1;
      PI_reset <= 1'b0;
      PI_htif_pcr_req_rw <= 1'b1;
      PI_htif_pcr_resp_ready <= 1'b0;
    end

    // state 16
    if (cycle == 15) begin
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      PI_htif_pcr_req_addr <= 12'b000000000000;
      PI_htif_pcr_req_valid <= 1'b0;
      PI_reset <= 1'b0;
      PI_htif_pcr_req_rw <= 1'b0;
      PI_htif_pcr_resp_ready <= 1'b0;
    end

    // state 17
    if (cycle == 16) begin
      PI_arbiter_next_core <= 1'b0;
      PI_htif_pcr_req_data <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      PI_htif_pcr_req_addr <= 12'b000000000000;
      PI_htif_pcr_req_valid <= 1'b0;
      PI_reset <= 1'b0;
      PI_htif_pcr_req_rw <= 1'b0;
      PI_htif_pcr_resp_ready <= 1'b0;
    end

    genclock <= cycle < 17;
    cycle <= cycle + 1;
  end
endmodule
