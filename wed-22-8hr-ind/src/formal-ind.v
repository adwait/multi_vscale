    `ifdef FORMAL
        `define XPR_LEN 32
        `define PIPELINE_DEPTH 3
        `define PIPELINE_WIDTH 3
        
        reg [`XPR_LEN-1:0]  windows [0:`PIPELINE_WIDTH-1];
        reg [`XPR_LEN-1:0]  next_pc;
        reg [`PIPELINE_DEPTH-1:0]     events  [0:`PIPELINE_WIDTH-1];
        wire                done    [0:`PIPELINE_WIDTH-1];
        wire                bad     [0:`PIPELINE_WIDTH-1];          
        
        assign done[0]  = &events[0];    
        assign done[1]  = &events[1];    
        assign done[2]  = &events[2];

        assign bad[0]   = events[0][2:2] && !(events[0][0:0] && events[0][1:1]);
        assign bad[1]   = events[1][2:2] && !(events[1][0:0] && events[1][1:1]);
        assign bad[2]   = events[2][2:2] && !(events[2][0:0] && events[2][1:1]);

        reg [2:0]           counter;
        reg                 init;
        reg [1:0]           head_ptr;



        initial begin
            counter = 3'd0;
            init    = 1'b1;

            head_ptr    = 2'd0;

            windows[0]  = `XPR_LEN'd4;
            windows[1]  = `XPR_LEN'd8;
            windows[2]  = `XPR_LEN'd12;
            next_pc     = `XPR_LEN'd16;
            events[0]   = `PIPELINE_WIDTH'd0;
            events[1]   = `PIPELINE_WIDTH'd0;
            events[2]   = `PIPELINE_WIDTH'd0;
            
            // 00200293002002930020029300000013
            // 00100313001002930450002300000013
            // assume(port_mem[31:0]               == 32'h00200293);
            // assume(port_mem[63:32]              == 32'h00200293);
            // assume(port_mem[95:64]              == 32'h00200293);
            // assume(port_mem[127:96]             == 32'h00000013);
            // assume(port_mem[32*5-1:32*4]        == 32'h00000013);
            // assume(port_mem[32*6-1:32*5]        == 32'h04500023);
            // assume(port_mem[32*7-1:32*6]        == 32'h00100293);
            assume(port_mem[1*128-1:0*128]          == 128'h00000013000000130000001300000013);
            assume(port_mem[8*32-1:5*32]            == 96'h000000130000001300000013);
            // fffe8:   1111 1111 1111 1110 1000    00000 1101111 => ffffe806f
            // impliit: 1111 1111 1111 1111 0100
            // actual:  1111 1110 1001 1111 1111    00000 1101111
            assume(port_mem[5*32-1:4*32]            == 32'b11111110100111111111000001101111);
            assume(port_mem[3*128-1:2*128]          == 128'h00000013000000130000001300000013);
            assume(port_mem[4*128-1:3*128]          == 128'h00000013000000130000001300000013);
            assume(port_mem[5*128-1:4*128]          == 128'h00000013000000130000001300000013);
            assume(port_mem[6*128-1:5*128]          == 128'h00000013000000130000001300000013);
            assume(port_mem[7*128-1:6*128]          == 128'h00000013000000130000001300000013);
            assume(port_mem[8*128-1:7*128]          == 128'h00000013000000130000001300000013);
            // assume(port_mem[5*128-1:4*128]      == 128'd0);
        end

        always @(posedge clk) begin
            counter <= counter + 1;
            init <= 1'b0;
            assume(arbiter_next_core == 0);
        end

        integer i_window;
        // Monitor for the pipeline events
        always @(posedge clk) begin
            if (counter > 1) begin
                if (done[head_ptr]) begin
                    events[head_ptr] = `PIPELINE_WIDTH'b000;
                    windows[head_ptr] = next_pc;
                    case (next_pc)
                        16      : next_pc = 4;
                        default : next_pc = next_pc + 4;
                    endcase
                    // next_pc = next_pc + 4;
                    case (head_ptr)
                        0       : head_ptr <= 1;
                        1       : head_ptr <= 2;
                        2       : head_ptr <= 0;
                        default : head_ptr <= 0;
                    endcase
                end
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
            end
        end

        always @(posedge clk) begin
            if (counter == 0 && init == 1) begin
                assume(reset);
            end else begin
                assume(!reset);
            end

            // if (counter < 10) begin
                // assert(port_mem[5*128-1:4*128] != 128'd2);
                assert(!(bad[0] || bad[1] || bad[2]));
            // end
            // if (counter == 14) begin
            //     assert(0);
            // end
        end
    `endif