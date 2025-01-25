`timescale 1ns / 1ps

module tb_MIPS_ALU;

    parameter Width = 32;
    reg [Width-1:0] A;
    reg [Width-1:0] B;
    reg [3:0] ALUControl;

    wire [Width-1:0] ALUResult;
    wire Zero;

    MIPS_ALU #(Width) uut (
        .A(A),
        .B(B),
        .ALUControl(ALUControl),
        .ALUResult(ALUResult),
        .Zero(Zero)
    );
    initial begin
        A = 0; B = 0; ALUControl = 4'b0000;

        // AND
        #10; A = 32'hF0F0F0FF; B = 32'h0F0F0F0F; ALUControl = 4'b0000; //0000000F
        #10; A = 32'hFFFFFFFF; B = 32'h00000000; ALUControl = 4'b0000; //00000000, Z flag = 1

        // OR
        #10; A = 32'hF0F0F0F0; B = 32'h0F0F0F0F; ALUControl = 4'b0001;

        // ADD
        #10; A = 32'h00000010; B = 32'h00000020; ALUControl = 4'b0010;
        #10; A = 32'hFFFFFFFF; B = 32'h00000001; ALUControl = 4'b0010; //(wrap around)

        // SUBTRACT
        #10; A = 32'h00000020; B = 32'h00000010; ALUControl = 4'b0110;
        #10; A = 32'h00000010; B = 32'h00000020; ALUControl = 4'b0110; //(negative result)

        // LESS-THAN SLT
        #10; A = 32'h00000010; B = 32'h00000020; ALUControl = 4'b0111;
        #10; A = 32'h00000020; B = 32'h00000010; ALUControl = 4'b0111;

        // NOR
        #10; A = 32'hF0F0F0F0; B = 32'h0F0F0F0F; ALUControl = 4'b1100;

        // Default Case
        #10; ALUControl = 4'b1111; // Undefined operation

        // Stop simulation
        #10; $stop;
    end

    // Monitor the output
    initial begin
        $display("Code Start");
        $monitor("Time: %0t | A: %h | B: %h | ALUControl: %b | ALUResult: %h | Zero: %b", 
                 $time, A, B, ALUControl, ALUResult, Zero);
    end

endmodule
