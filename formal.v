      `ifdef FORMAL

        reg [3:0] counter;

        initial begin
            counter = 4'd0;
            assume(port_mem[31:0]      == 32'h00000013);
            assume(port_mem[63:32]     == 32'h04500023);
            assume(port_mem[95:64]     == 32'h00200293);
            assume(port_mem[127:96]    == 32'h00000013);
            assume(port_mem[5*128-1:4*128]    == 128'd0);
        end

        always @(posedge clk) begin
            counter <= counter + 1;
        end

        always @(posedge clk) begin
            if (counter == 4) begin
                assert(port_mem[5*128-1:4*128] == 128'd1);
            end
        end
    `endif
