module testbench();
    reg clock, reset;
    wire [31:0] data_out, address;
    wire mem_write, error_flag;

    top_level dut (
        .clock(clock),
        .reset(reset),
        .data_out(data_out),
        .address(address),
        .mem_write(mem_write),
        .error_flag(error_flag)
    );

    initial begin
        clock = 0;
        reset = 1;
        #20 reset = 0;
        force dut.dp.instruction = 32'hFFFFFFFF;
        run_cycle(10);
        force dut.dp.instruction = 32'b000000_00001_00010_00011_00000_111111;
        run_cycle(10);
        $finish;
    end

    always #5 clock = ~clock;

    task run_cycle;
        input integer num_cycles;
        integer i;
        begin
            for (i = 0; i < num_cycles; i = i + 1) begin
                #10;
            end
        end
    endtask

    always @(posedge clock) begin
        if (error_flag) begin
            $display("Error detected in ALU Decoder or Control Unit");
            $stop;
        end
    end
endmodule
