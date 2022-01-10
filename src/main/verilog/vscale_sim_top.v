`include "vscale_ctrl_constants.vh"
`include "vscale_csr_addr_map.vh"
`include "vscale_hasti_constants.vh"
`include "vscale_multicore_constants.vh"
`include "rv32_opcodes.vh"


module vscale_sim_top(
	input                        clk,
	input                        reset,
	input                        htif_pcr_req_valid,
	output                       htif_pcr_req_ready,
	input                        htif_pcr_req_rw,
	input [`CSR_ADDR_WIDTH-1:0]  htif_pcr_req_addr,
	input [`HTIF_PCR_WIDTH-1:0]  htif_pcr_req_data,
	output                       htif_pcr_resp_valid,
	input                        htif_pcr_resp_ready,
	output [`HTIF_PCR_WIDTH-1:0] htif_pcr_resp_data,
	// input
	input [`CORE_IDX_WIDTH-1:0]  arbiter_next_core,

	// new input for instruction
	input [`NUM_CORES*`HASTI_BUS_WIDTH-1:0]	inp_port_imem_hrdata
	);

	wire                                            resetn;


	// Signals between instruction memory and arbiter
	wire [`HASTI_ADDR_WIDTH-1:0]                    imem_haddr [0:`NUM_CORES-1];
	wire                                            imem_hwrite [0:`NUM_CORES-1];
	wire [`HASTI_SIZE_WIDTH-1:0]                    imem_hsize [0:`NUM_CORES-1];
	wire [`HASTI_BURST_WIDTH-1:0]                   imem_hburst [0:`NUM_CORES-1];
	wire                                            imem_hmastlock [0:`NUM_CORES-1];
	wire [`HASTI_PROT_WIDTH-1:0]                    imem_hprot [0:`NUM_CORES-1];
	wire [`HASTI_TRANS_WIDTH-1:0]                   imem_htrans [0:`NUM_CORES-1];
	wire [`HASTI_BUS_WIDTH-1:0]                     imem_hwdata [0:`NUM_CORES-1];
	// input to core
	wire [`HASTI_BUS_WIDTH-1:0]                     imem_hrdata [0:`NUM_CORES-1];
	wire                                            imem_hready [0:`NUM_CORES-1];
	wire [`HASTI_RESP_WIDTH-1:0]                    imem_hresp [0:`NUM_CORES-1];

	//Signals between cores and arbiter
	wire [`HASTI_ADDR_WIDTH-1:0]                    dmem_haddr [0:`NUM_CORES-1];
	wire                                            dmem_hwrite [0:`NUM_CORES-1];
	wire [`HASTI_SIZE_WIDTH-1:0]                    dmem_hsize [0:`NUM_CORES-1];
	wire [`HASTI_BURST_WIDTH-1:0]                   dmem_hburst [0:`NUM_CORES-1];
	wire                                            dmem_hmastlock [0:`NUM_CORES-1];
	wire [`HASTI_PROT_WIDTH-1:0]                    dmem_hprot [0:`NUM_CORES-1];
	wire [`HASTI_TRANS_WIDTH-1:0]                   dmem_htrans [0:`NUM_CORES-1];
	wire [`HASTI_BUS_WIDTH-1:0]                     dmem_hwdata [0:`NUM_CORES-1];
	wire [`HASTI_BUS_WIDTH-1:0]                     dmem_hrdata [0:`NUM_CORES-1];
	wire                                            dmem_hready [0:`NUM_CORES-1];
	wire [`HASTI_RESP_WIDTH-1:0]                    dmem_hresp [0:`NUM_CORES-1];




	// ************* Flattened ports for arbiter
	// Signals between instruction memory and cores
	wire [`NUM_CORES*`HASTI_ADDR_WIDTH-1:0]                    port_imem_haddr;
	wire [`NUM_CORES-1:0]                                           port_imem_hwrite;
	wire [`NUM_CORES*`HASTI_SIZE_WIDTH-1:0]                    port_imem_hsize;
	wire [`NUM_CORES*`HASTI_BURST_WIDTH-1:0]                   port_imem_hburst;
	wire [`NUM_CORES-1:0]                                           port_imem_hmastlock;
	wire [`NUM_CORES*`HASTI_PROT_WIDTH-1:0]                    port_imem_hprot;
	wire [`NUM_CORES*`HASTI_TRANS_WIDTH-1:0]                   port_imem_htrans;
	wire [`NUM_CORES*`HASTI_BUS_WIDTH-1:0]                     port_imem_hwdata;
	wire [`NUM_CORES*`HASTI_BUS_WIDTH-1:0]                     port_imem_hrdata;
	wire [`NUM_CORES-1:0]                                           port_imem_hready;
	wire [`NUM_CORES*`HASTI_RESP_WIDTH-1:0]                    port_imem_hresp;

	//Signals between cores and arbiter
	wire [`NUM_CORES*`HASTI_ADDR_WIDTH-1:0]                    port_dmem_haddr;
	wire [`NUM_CORES-1:0]                                           port_dmem_hwrite;
	wire [`NUM_CORES*`HASTI_SIZE_WIDTH-1:0]                    port_dmem_hsize;
	wire [`NUM_CORES*`HASTI_BURST_WIDTH-1:0]                   port_dmem_hburst;
	wire [`NUM_CORES-1:0]                                           port_dmem_hmastlock;
	wire [`NUM_CORES*`HASTI_PROT_WIDTH-1:0]                    port_dmem_hprot;
	wire [`NUM_CORES*`HASTI_TRANS_WIDTH-1:0]                   port_dmem_htrans;
	wire [`NUM_CORES*`HASTI_BUS_WIDTH-1:0]                     port_dmem_hwdata;
	wire [`NUM_CORES*`HASTI_BUS_WIDTH-1:0]                     port_dmem_hrdata;
	wire [`NUM_CORES-1:0]                                           port_dmem_hready;
	wire [`NUM_CORES*`HASTI_RESP_WIDTH-1:0]                    port_dmem_hresp;


    // for probes from memory
	wire [`NUM_CORES*`HASTI_BUS_WIDTH-1:0]                     mem_port_imem_hrdata;
	wire [`NUM_CORES-1:0]                                      mem_port_imem_hready;
	wire [`NUM_CORES*`HASTI_RESP_WIDTH-1:0]                    mem_port_imem_hresp;

`ifdef FROM_HEXFILE
	assign	port_imem_hrdata 	= mem_port_imem_hrdata;
	assign	port_imem_hready 	= mem_port_imem_hready;
	assign	port_imem_hresp 	= mem_port_imem_hresp;
	// ports are connected from memory/arbiter buses
`else
	// Hardcode instruction inputs:
	// assign	port_imem_hrdata 	= {`NUM_CORES{32'h00230313}};
	assign	port_imem_hrdata 	= inp_port_imem_hrdata;
	assign	port_imem_hready 	= {`NUM_CORES{1'b1}};
	assign	port_imem_hresp 	= {`NUM_CORES{`HASTI_RESP_WIDTH'd0}};
	// Hardcode (unused) data inputs:
	// assign	port_dmem_hrdata 	= {`NUM_CORES{32'h0}};
	// assign	port_dmem_hready 	= {`NUM_CORES{1'b1}};
	// assign	port_dmem_hresp 	= {`NUM_CORES{`HASTI_RESP_WIDTH'd0}};
`endif

	genvar i_flat;
    for (i_flat = 0; i_flat < `NUM_CORES; i_flat=i_flat+1) begin
		assign port_imem_haddr[`HASTI_ADDR_WIDTH*i_flat+`HASTI_ADDR_WIDTH-1:`HASTI_ADDR_WIDTH*i_flat] = imem_haddr[i_flat];
        assign port_imem_hwrite[i_flat:i_flat] = imem_hwrite[i_flat];
        assign port_imem_hsize[`HASTI_SIZE_WIDTH*i_flat+`HASTI_SIZE_WIDTH-1:`HASTI_SIZE_WIDTH*i_flat] = imem_hsize[i_flat];
        assign port_imem_hburst[`HASTI_BURST_WIDTH*i_flat+`HASTI_BURST_WIDTH-1:`HASTI_BURST_WIDTH*i_flat] = imem_hburst[i_flat];
        assign port_imem_hmastlock[i_flat:i_flat] = imem_hmastlock[i_flat];
        assign port_imem_hprot[`HASTI_PROT_WIDTH*i_flat+`HASTI_PROT_WIDTH-1:`HASTI_PROT_WIDTH*i_flat] = imem_hprot[i_flat];
        assign port_imem_htrans[`HASTI_TRANS_WIDTH*i_flat+`HASTI_TRANS_WIDTH-1:`HASTI_TRANS_WIDTH*i_flat] = imem_htrans[i_flat];
        assign port_imem_hwdata[`HASTI_BUS_WIDTH*i_flat+`HASTI_BUS_WIDTH-1:`HASTI_BUS_WIDTH*i_flat] = imem_hwdata[i_flat];

        assign imem_hrdata[i_flat] = port_imem_hrdata[`HASTI_BUS_WIDTH*i_flat+`HASTI_BUS_WIDTH-1:`HASTI_BUS_WIDTH*i_flat];
        assign imem_hready[i_flat] = port_imem_hready[i_flat:i_flat];
        assign imem_hresp[i_flat] = port_imem_hresp[`HASTI_RESP_WIDTH*i_flat+`HASTI_RESP_WIDTH-1:`HASTI_RESP_WIDTH*i_flat];


        assign port_dmem_haddr[`HASTI_ADDR_WIDTH*i_flat+`HASTI_ADDR_WIDTH-1:`HASTI_ADDR_WIDTH*i_flat] = dmem_haddr[i_flat];
        assign port_dmem_hwrite[i_flat:i_flat] = dmem_hwrite[i_flat];
        assign port_dmem_hsize[`HASTI_SIZE_WIDTH*i_flat+`HASTI_SIZE_WIDTH-1:`HASTI_SIZE_WIDTH*i_flat] = dmem_hsize[i_flat];
        assign port_dmem_hburst[`HASTI_BURST_WIDTH*i_flat+`HASTI_BURST_WIDTH-1:`HASTI_BURST_WIDTH*i_flat] = dmem_hburst[i_flat];
        assign port_dmem_hmastlock[i_flat:i_flat] = dmem_hmastlock[i_flat];
        assign port_dmem_hprot[`HASTI_PROT_WIDTH*i_flat+`HASTI_PROT_WIDTH-1:`HASTI_PROT_WIDTH*i_flat] = dmem_hprot[i_flat];
        assign port_dmem_htrans[`HASTI_TRANS_WIDTH*i_flat+`HASTI_TRANS_WIDTH-1:`HASTI_TRANS_WIDTH*i_flat] = dmem_htrans[i_flat];
        assign port_dmem_hwdata[`HASTI_BUS_WIDTH*i_flat+`HASTI_BUS_WIDTH-1:`HASTI_BUS_WIDTH*i_flat] = dmem_hwdata[i_flat];

        assign dmem_hrdata[i_flat] = port_dmem_hrdata[`HASTI_BUS_WIDTH*i_flat+`HASTI_BUS_WIDTH-1:`HASTI_BUS_WIDTH*i_flat];
        assign dmem_hready[i_flat] = port_dmem_hready[i_flat:i_flat];
        assign dmem_hresp[i_flat] = port_dmem_hresp[`HASTI_RESP_WIDTH*i_flat+`HASTI_RESP_WIDTH-1:`HASTI_RESP_WIDTH*i_flat];
    end

	// ************* Flattened Ports

    // ************* Flattened memory for ease of verification
    wire [`MEM_WORDS*`HASTI_BUS_WIDTH-1:0] port_mem;
    // *************

    wire [`XPR_LEN-1:0]  ports_PC_IF [`NUM_CORES-1:0];
    wire [`XPR_LEN-1:0]  ports_PC_DX [`NUM_CORES-1:0];
    wire [`XPR_LEN-1:0]  ports_PC_WB [`NUM_CORES-1:0];


	//Signals between arbiter and data memory
	wire [`HASTI_ADDR_WIDTH-1:0]                    arbiter_dmem_haddr;
	wire                                            arbiter_dmem_hwrite;
	wire [`HASTI_SIZE_WIDTH-1:0]                    arbiter_dmem_hsize;
	wire [`HASTI_BURST_WIDTH-1:0]                   arbiter_dmem_hburst;
	wire                                            arbiter_dmem_hmastlock;
	wire [`HASTI_PROT_WIDTH-1:0]                    arbiter_dmem_hprot;
	wire [`HASTI_TRANS_WIDTH-1:0]                   arbiter_dmem_htrans;
	wire [`HASTI_BUS_WIDTH-1:0]                     arbiter_dmem_hwdata;
	wire [`HASTI_BUS_WIDTH-1:0]                     arbiter_dmem_hrdata;
	wire                                            arbiter_dmem_hready;
	wire [`HASTI_RESP_WIDTH-1:0]                    arbiter_dmem_hresp;

	wire                                            htif_reset;

	wire                                            htif_ipi_req_ready = 0;
	wire                                            htif_ipi_req_valid;
	wire                                            htif_ipi_req_data;
	wire                                            htif_ipi_resp_ready;
	wire                                            htif_ipi_resp_valid = 0;
	wire                                            htif_ipi_resp_data = 0;
	wire                                            htif_debug_stats_pcr;
	
	assign resetn = ~reset;
	assign htif_reset = reset;

	genvar i;
	generate
	for (i = 0; i < `NUM_CORES ; i = i + 1) begin : core_gen_block
	   	vscale_core vscale(
			.clk(clk),
			.core_id(i),
			.imem_haddr(imem_haddr[i]),
			.imem_hwrite(imem_hwrite[i]),
			.imem_hsize(imem_hsize[i]),
			.imem_hburst(imem_hburst[i]),
			.imem_hmastlock(imem_hmastlock[i]),
			.imem_hprot(imem_hprot[i]),
			.imem_htrans(imem_htrans[i]),
			.imem_hwdata(imem_hwdata[i]),
			.imem_hrdata(imem_hrdata[i]),
			.imem_hready(imem_hready[i]),
			.imem_hresp(imem_hresp[i]),
			.dmem_haddr(dmem_haddr[i]),
			.dmem_hwrite(dmem_hwrite[i]),
			.dmem_hsize(dmem_hsize[i]),
			.dmem_hburst(dmem_hburst[i]),
			.dmem_hmastlock(dmem_hmastlock[i]),
			.dmem_hprot(dmem_hprot[i]),
			.dmem_htrans(dmem_htrans[i]),
			.dmem_hwdata(dmem_hwdata[i]),
			.dmem_hrdata(dmem_hrdata[i]),
			.dmem_hready(dmem_hready[i]),
			.dmem_hresp(dmem_hresp[i]),
			.htif_reset(htif_reset),
			.htif_id(1'b0),
			.htif_pcr_req_valid(htif_pcr_req_valid),
			.htif_pcr_req_ready(htif_pcr_req_ready),
			.htif_pcr_req_rw(htif_pcr_req_rw),
			.htif_pcr_req_addr(htif_pcr_req_addr),
			.htif_pcr_req_data(htif_pcr_req_data),
			.htif_pcr_resp_valid(htif_pcr_resp_valid),
			.htif_pcr_resp_ready(htif_pcr_resp_ready),
			.htif_pcr_resp_data(htif_pcr_resp_data),
			.htif_ipi_req_ready(htif_ipi_req_ready),
			.htif_ipi_req_valid(htif_ipi_req_valid),
			.htif_ipi_req_data(htif_ipi_req_data),
			.htif_ipi_resp_ready(htif_ipi_resp_ready),
			.htif_ipi_resp_valid(htif_ipi_resp_valid),
			.htif_ipi_resp_data(htif_ipi_resp_data),
			.htif_debug_stats_pcr(htif_debug_stats_pcr),
            .port_PC_IF(ports_PC_IF[i]),
            .port_PC_DX(ports_PC_DX[i]),
            .port_PC_WB(ports_PC_WB[i])
		);
	   	end
   	endgenerate

   	vscale_arbiter arbiter(
		.clk(clk),
		.reset(reset),
		.core_haddr(port_dmem_haddr),
		.core_hwrite(port_dmem_hwrite),
		.core_hsize(port_dmem_hsize),
		.core_hburst(port_dmem_hburst),
		.core_hmastlock(port_dmem_hmastlock),
		.core_hprot(port_dmem_hprot),
		.core_htrans(port_dmem_htrans),
		.core_hwdata(port_dmem_hwdata),
		.core_hrdata(port_dmem_hrdata),
		.core_hready(port_dmem_hready),
		.core_hresp(port_dmem_hresp),
		.dmem_haddr(arbiter_dmem_haddr),
		.dmem_hwrite(arbiter_dmem_hwrite),
		.dmem_hsize(arbiter_dmem_hsize),
		.dmem_hburst(arbiter_dmem_hburst),
		.dmem_hmastlock(arbiter_dmem_hmastlock),
		.dmem_hprot(arbiter_dmem_hprot),
		.dmem_htrans(arbiter_dmem_htrans),
		.dmem_hwdata(arbiter_dmem_hwdata),
		.dmem_hrdata(arbiter_dmem_hrdata),
		.dmem_hready(arbiter_dmem_hready),
		.dmem_hresp(arbiter_dmem_hresp),
		.next_core(arbiter_next_core)
	);

   	vscale_dp_hasti_sram hasti_mem(
		.hclk(clk),
		.hresetn(resetn),
		.p1_haddr(port_imem_haddr),
		.p1_hwrite(port_imem_hwrite),
		.p1_hsize(port_imem_hsize),
		.p1_hburst(port_imem_hburst),
		.p1_hmastlock(port_imem_hmastlock),
		.p1_hprot(port_imem_hprot),
		.p1_htrans(port_imem_htrans),
		.p1_hwdata(port_imem_hwdata),
		.p1_hrdata(mem_port_imem_hrdata),
		.p1_hready(mem_port_imem_hready),
		.p1_hresp(mem_port_imem_hresp),
		.p0_haddr(arbiter_dmem_haddr),
		.p0_hwrite(arbiter_dmem_hwrite),
		.p0_hsize(arbiter_dmem_hsize),
		.p0_hburst(arbiter_dmem_hburst),
		.p0_hmastlock(arbiter_dmem_hmastlock),
		.p0_hprot(arbiter_dmem_hprot),
		.p0_htrans(arbiter_dmem_htrans),
		.p0_hwdata(arbiter_dmem_hwdata),
		.p0_hrdata(arbiter_dmem_hrdata),
		.p0_hready(arbiter_dmem_hready),
		.p0_hresp(arbiter_dmem_hresp),
        .port_mem(port_mem)
	);

endmodule // vscale_sim_top
