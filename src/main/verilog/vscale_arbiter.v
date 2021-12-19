`include "vscale_ctrl_constants.vh"
`include "vscale_csr_addr_map.vh"
`include "vscale_hasti_constants.vh"
`include "vscale_multicore_constants.vh"

module vscale_arbiter(
        input                                            clk,
        input                                            reset,
        // info: these are from the dmem addresses of cores
        input [`NUM_CORES*`HASTI_ADDR_WIDTH-1:0]         core_haddr,
        input [`NUM_CORES-1:0]                           core_hwrite,
        input [`NUM_CORES*`HASTI_SIZE_WIDTH-1:0]         core_hsize,
        input [`NUM_CORES*`HASTI_BURST_WIDTH-1:0]                   core_hburst,
        input [`NUM_CORES-1:0]                           core_hmastlock,
        input [`NUM_CORES*`HASTI_PROT_WIDTH-1:0]                    core_hprot,
        input [`NUM_CORES*`HASTI_TRANS_WIDTH-1:0]                   core_htrans,
        input [`NUM_CORES*`HASTI_BUS_WIDTH-1:0]                     core_hwdata,
        // INFO: these are now wires, take care!
        output [`NUM_CORES*`HASTI_BUS_WIDTH-1:0]                core_hrdata,
        output [`NUM_CORES-1:0]                           core_hready,
        output [`NUM_CORES*`HASTI_RESP_WIDTH-1:0]               core_hresp,
        output reg [`HASTI_ADDR_WIDTH-1:0]               dmem_haddr,
        output reg                                       dmem_hwrite,
        output reg [`HASTI_SIZE_WIDTH-1:0]               dmem_hsize,
        output reg [`HASTI_BURST_WIDTH-1:0]              dmem_hburst,
        output reg                                       dmem_hmastlock,
        output reg [`HASTI_PROT_WIDTH-1:0]               dmem_hprot,
        output reg [`HASTI_TRANS_WIDTH-1:0]              dmem_htrans,
        output reg [`HASTI_BUS_WIDTH-1:0]                dmem_hwdata,
        input [`HASTI_BUS_WIDTH-1:0]                     dmem_hrdata,
        input                                            dmem_hready,
        input [`HASTI_RESP_WIDTH-1:0]                    dmem_hresp,
        input [`CORE_IDX_WIDTH-1:0]                      next_core
    );

    //Which core's filing a request this cycle?
    reg [`CORE_IDX_WIDTH-1:0]     cur_core;
    //Which core filed its request last cycle (and is observing the response this
    //cycle?
    reg [`CORE_IDX_WIDTH-1:0]     prev_core;

    //Keep track of when to move from one core to another.
    reg [31:0] counter;

    //The "mux selectors" of the arbiter.
    always @(posedge clk) begin
        cur_core <= next_core;
        prev_core <= cur_core;
    end

    // inputs
    wire [`HASTI_ADDR_WIDTH-1:0]    local_core_haddr [`NUM_CORES-1:0];
    wire                            local_core_hwrite [`NUM_CORES-1:0];
    wire [`HASTI_SIZE_WIDTH-1:0]    local_core_hsize [`NUM_CORES-1:0];
    wire [`HASTI_BURST_WIDTH-1:0]   local_core_hburst [`NUM_CORES-1:0];
    wire                            local_core_hmastlock [`NUM_CORES-1:0];
    wire [`HASTI_PROT_WIDTH-1:0]    local_core_hprot [`NUM_CORES-1:0];
    wire [`HASTI_TRANS_WIDTH-1:0]   local_core_htrans [`NUM_CORES-1:0];
    wire [`HASTI_BUS_WIDTH-1:0]     local_core_hwdata [`NUM_CORES-1:0];
    // INFO: outputs, these are now regs, take care
    reg [`HASTI_BUS_WIDTH-1:0]     local_core_hrdata [`NUM_CORES-1:0];
    reg                            local_core_hready [`NUM_CORES-1:0];
    reg [`HASTI_RESP_WIDTH-1:0]    local_core_hresp [`NUM_CORES-1:0];
    
    
    genvar i_flat;
    // for (i_flat = 0;i_flat<32;i_flat=i_flat+1) 
    //     assign local_2D_array[i_flat] = input[32*i_flat+31:32*i_flat];
    for (i_flat = 0; i_flat < `NUM_CORES; i_flat=i_flat+1) begin
        assign local_core_haddr[i_flat]      = core_haddr[`HASTI_ADDR_WIDTH*i_flat+`HASTI_ADDR_WIDTH-1:`HASTI_ADDR_WIDTH*i_flat];
        assign local_core_hwrite[i_flat]     = core_hwrite[i_flat:i_flat];
        assign local_core_hsize[i_flat]      = core_hsize[`HASTI_SIZE_WIDTH*i_flat+`HASTI_SIZE_WIDTH-1:`HASTI_SIZE_WIDTH*i_flat];
        assign local_core_hburst[i_flat]     = core_hburst[`HASTI_BURST_WIDTH*i_flat+`HASTI_BURST_WIDTH-1:`HASTI_BURST_WIDTH*i_flat];
        assign local_core_hmastlock[i_flat]  = core_hmastlock[i_flat:i_flat];
        assign local_core_hprot[i_flat]      = core_hprot[`HASTI_PROT_WIDTH*i_flat+`HASTI_PROT_WIDTH-1:`HASTI_PROT_WIDTH*i_flat];
        assign local_core_htrans[i_flat]     = core_htrans[`HASTI_TRANS_WIDTH*i_flat+`HASTI_TRANS_WIDTH-1:`HASTI_TRANS_WIDTH*i_flat];
        assign local_core_hwdata[i_flat]     = core_hwdata[`HASTI_BUS_WIDTH*i_flat+`HASTI_BUS_WIDTH-1:`HASTI_BUS_WIDTH*i_flat];

        assign core_hrdata[`HASTI_BUS_WIDTH*i_flat+`HASTI_BUS_WIDTH-1:`HASTI_BUS_WIDTH*i_flat] = local_core_hrdata[i_flat];
        assign core_hready[i_flat:i_flat] = local_core_hready[i_flat];
        assign core_hresp[`HASTI_RESP_WIDTH*i_flat+`HASTI_RESP_WIDTH-1:`HASTI_RESP_WIDTH*i_flat] = local_core_hresp[i_flat];
        // local_2D_array[i_flat] = input[32*i_flat+31:32*i_flat];
    end

    //And the combinational connections...
    always @(*) begin
        dmem_haddr = local_core_haddr[cur_core];
        dmem_hwrite = local_core_hwrite[cur_core];
        dmem_hsize = local_core_hsize[cur_core];
        dmem_hburst = local_core_hburst[cur_core];
        dmem_hmastlock = local_core_hmastlock[cur_core];
        dmem_hprot = local_core_hprot[cur_core];
        dmem_htrans = local_core_htrans[cur_core];
        //Write data must be from the previous core.
        dmem_hwdata = local_core_hwdata[prev_core];
    end

    genvar i;
    generate
        // convert to i=i+1 to resolve verilator warning
        for (i = 0; i < `NUM_CORES; i=i+1)
            always @(*) begin
                if (cur_core == i) begin
                    //dmem_hready is not looked at by WB anymore, so we can have it be
                    //negative in WB and no one minds...it's only the data that has to
                    //follow one cycle behind :). Thus, the actual mem's hready is sent to
                    //the current core.
                    local_core_hready[i] = dmem_hready;
                    local_core_hrdata[i] = dmem_hrdata;
                    //Resp is always HASTI_RESP_OKAY on the dmem side, so if we make
                    //all other cores get that, we should be fine.
                    //Furthermore, I believe resp only matters if it's equal to
                    //HASTI_RESP_ERROR (see the bridge for details).
                    local_core_hresp[i] = `HASTI_RESP_OKAY;
                end else begin
                        local_core_hready[i] = 1'b0;
                        local_core_hrdata[i] = dmem_hrdata;
                        local_core_hresp[i] = dmem_hresp;
                end
            end
    endgenerate
endmodule
