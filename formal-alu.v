        `define XPR_LEN 32
        `define PIPELINE_DEPTH 3
        `define PIPELINE_WIDTH 4
        `define WINDOW_PTR_WIDTH 2

        reg [`XPR_LEN-1:0]  windows [0:`PIPELINE_WIDTH-1];
        reg [`XPR_LEN-1:0]  next_pc;
        reg [`PIPELINE_DEPTH-1:0]     events  [0:`PIPELINE_WIDTH-1];
        wire                done    [0:`PIPELINE_WIDTH-1];
        wire                bad     [0:`PIPELINE_WIDTH-1];      

        assign done[0]  = &events[0];
        assign done[1]  = &events[1];
        assign done[2]  = &events[2];
        assign done[3]  = &events[3];

        assign bad[0]   = events[0][2:2] && !(events[0][0:0] && events[0][1:1]);
        assign bad[1]   = events[1][2:2] && !(events[1][0:0] && events[1][1:1]);
        assign bad[2]   = events[2][2:2] && !(events[2][0:0] && events[2][1:1]);
        assign bad[3]   = events[3][2:2] && !(events[3][0:0] && events[3][1:1]);

        reg [2:0]           counter;
        reg init;
        reg Pinit;
        reg [`WINDOW_PTR_WIDTH-1:0]           tail_ptr;
        reg [`WINDOW_PTR_WIDTH-1:0]           head_ptr;

        initial begin
            counter = 3'd0;
            init    = 1'b1;
            Pinit   = 1'b1;
            head_ptr    = `WINDOW_PTR_WIDTH'd0;
            tail_ptr    = `WINDOW_PTR_WIDTH'd3;

            windows[0]  = `XPR_LEN'd4;
            windows[1]  = `XPR_LEN'd8;
            windows[2]  = `XPR_LEN'd12;
            windows[3]  = `XPR_LEN'd120;
            next_pc     = `XPR_LEN'd4;
            events[0]   = `PIPELINE_WIDTH'd0;
            events[1]   = `PIPELINE_WIDTH'd0;
            events[2]   = `PIPELINE_WIDTH'd0;
            events[3]   = `PIPELINE_WIDTH'd0;
        end

        always @(posedge clk) begin
            counter <= counter + 1;
            init    <= 1'b0;
            if (init == 0) begin
                Pinit <= 1'b0;
            end
        end

`ifdef FORMAL
        always @(posedge clk) begin

            /* ALU operations 
                assume the required opcode
                info: no funct assumed, could be any ALU operation 
            */
            assume(inp_port_imem_hrdata[6:0] == 7'b0010011);

            assume(htif_pcr_req_valid == 0);
            assume(htif_pcr_req_rw == 0);
            assume(htif_pcr_req_addr == 0);
            assume(htif_pcr_req_data == 0);
            assume(htif_pcr_resp_ready == 0);
            assume(arbiter_next_core == 0);
        end
`endif
        integer i_window;
        // Monitor for the pipeline events
        always @(posedge clk) begin
            if (Pinit == 0) begin
                if (done[head_ptr]) begin
                    events[head_ptr] = `PIPELINE_WIDTH'b000;
                    windows[tail_ptr] = next_pc;
                    windows[head_ptr] = `XPR_LEN'd120;
                    case (next_pc)
                        12      : next_pc = 4;
                        default : next_pc = next_pc + 4;
                    endcase
                    case (head_ptr)
                        0       : head_ptr = 1;
                        1       : head_ptr = 2;
                        2       : head_ptr = 3;
                        3       : head_ptr = 0;
                        default : head_ptr = 0;
                    endcase
                    case (tail_ptr)
                        0       : tail_ptr = 1;
                        1       : tail_ptr = 2;
                        2       : tail_ptr = 3;
                        3       : tail_ptr = 0;
                        default : tail_ptr = 0;
                    endcase
                end
`ifdef FORMAL
                // IF
                for (i_window = 0; i_window < `PIPELINE_WIDTH; i_window=i_window+1) begin
                    if (\ports_PC_IF[0] == windows[i_window]) begin
                        events[i_window][0:0] = 1'b1;
                    end
                end
                // DX
                for (i_window = 0; i_window < `PIPELINE_WIDTH; i_window=i_window+1) begin
                    if (\ports_PC_DX[0] == windows[i_window]) begin
                        events[i_window][1:1] = 1'b1;
                    end
                end
                // WB
                for (i_window = 0; i_window < `PIPELINE_WIDTH; i_window=i_window+1) begin
                    if (\ports_PC_WB[0] == windows[i_window]) begin
                        events[i_window][2:2] = 1'b1;
                    end
                end
`else
                // IF
                for (i_window = 0; i_window < `PIPELINE_WIDTH; i_window=i_window+1) begin
                    if (ports_PC_IF[0] == windows[i_window]) begin
                        events[i_window][0:0] = 1'b1;
                    end
                end
                // DX
                for (i_window = 0; i_window < `PIPELINE_WIDTH; i_window=i_window+1) begin
                    if (ports_PC_DX[0] == windows[i_window]) begin
                        events[i_window][1:1] = 1'b1;
                    end
                end
                // WB
                for (i_window = 0; i_window < `PIPELINE_WIDTH; i_window=i_window+1) begin
                    if (ports_PC_WB[0] == windows[i_window]) begin
                        events[i_window][2:2] = 1'b1;
                    end
                end
`endif
            end
        end

`ifdef FORMAL
        always @(posedge clk) begin
            if (init) begin
                assume(reset);
            end else begin
                assume(!reset);
            end

            // Inductiveness constraints
            assert(windows[0] == 4 || windows[0] == 8 || windows[0] == 12 || windows[0] == 120);
            assert(windows[1] == 4 || windows[1] == 8 || windows[1] == 12 || windows[1] == 120);
            assert(windows[2] == 4 || windows[2] == 8 || windows[2] == 12 || windows[2] == 120);
            assert(windows[3] == 4 || windows[3] == 8 || windows[3] == 12 || windows[3] == 120);
            
            assert(!(bad[0] || bad[1] || bad[2] || bad[3]));
        end
`endif
