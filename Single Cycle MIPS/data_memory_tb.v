module tb_MIPS_Data_Memory;

    parameter LOCATIONS = 256;

    reg [31:0] A;
    reg [31:0] WD;
    reg WE;
    reg CLK;
    wire [31:0] RD;

    MIPS_Data_Memory #(LOCATIONS) uut (
        .A(A),
        .WD(WD),
        .WE(WE),
        .CLK(CLK),
        .RD(RD)
    );

    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end
    
    initial begin
        A = 0;
        WD = 0;
        WE = 0;

        #10; A = 32'd4; WD = 32'hA5A5A5A5; WE = 1;
        #10; WE = 0;

        #10; A = 32'd4;
        #10;

        A = 32'd8; WD = 32'h5A5A5A5A; WE = 1;
        #10; WE = 0;

        #10; A = 32'd8;
        #10;

        #10; A = 32'd12;
        #10;

        #10; $stop;
    end

    initial begin 
        $monitor("Time: %0t | CLK: %b | WE: %b | A: %h | WD: %h | RD: %h",
                 $time, CLK, WE, A, WD, RD);
    end

endmodule

/*
Time:    10 | CLK: 0 | WE: 1 |
Time:    20 | CLK: 1 | WE: 0 |
Time:    30 | CLK: 0 | WE: 1 |
Time:    40 | CLK: 1 | WE: 0 |
Time:    50 | CLK: 0 | WE: 0 |
*/