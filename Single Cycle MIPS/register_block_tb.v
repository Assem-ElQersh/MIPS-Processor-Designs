`timescale 1ns / 1ps

module Registers_Block_tb;

    reg clk;
    reg WE; // Write Enable
    reg [4:0] ReadReg1;
    reg [4:0] ReadReg2;
    reg [4:0] WriteReg;
    reg [31:0] WriteData;

    wire [31:0] ReadData1;
    wire [31:0] ReadData2;

    Registers_Block uut (
        .clk(clk),
        .WE(WE),
        .ReadReg1(ReadReg1),
        .ReadReg2(ReadReg2),
        .WriteReg(WriteReg),
        .WriteData(WriteData),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        WE = 0;
        ReadReg1 = 0;
        ReadReg2 = 0;
        WriteReg = 0;
        WriteData = 0;

        // Test case 1: Write and read from a register
        
        #10;
        
        WE = 1;           // Enable writing
        WriteReg = 5'd1;  // Write to register 1
        WriteData = 32'hA5A5A5A5; // Write data
        
        #10;
        
        WE = 0;           // Dis  able writing
        ReadReg1 = 5'd1;  // Read from register 1
        #10;

        // Test case 2: Write and read from a different register
        WE = 1;
        WriteReg = 5'd2;  // Write to register 2
        WriteData = 32'h5A5A5A5A; // Write data
        
        #10;
        
        WE = 0;
        ReadReg2 = 5'd2;  // Read from register 2
        
        #10;

        // Test case 3: Ensure writing to $zero (register 0) is ignored
        WE = 1;
        WriteReg = 5'd0;  // Attempt to write to register 0
        WriteData = 32'hFFFFFFFF; // Write data
        
        #10;
        
        WE = 0;
        ReadReg1 = 5'd0;  // Read from register 0
        
        #10;

        // Test case 4: Simultaneously read from two different registers
        ReadReg1 = 5'd1;  // Read from register 1
        ReadReg2 = 5'd2;  // Read from register 2
        
        #10;

        $finish;
    end

endmodule