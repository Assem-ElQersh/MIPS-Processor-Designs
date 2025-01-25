 `timescale 1ns / 1ps

module Control_Block_tb;

    reg [5:0] opcode;

    wire RegDst;
    wire Branch;
    wire MemRead;
    wire MemWrite;
    wire MemToReg;
    wire ALUSrc;
    wire RegWrite;
    wire [1:0] ALUOp;

    Control_Block uut (
        .opcode(opcode),
        .RegDst(RegDst),
        .Branch(Branch),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .MemToReg(MemToReg),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite),
        .ALUOp(ALUOp)
    );

    initial begin
        // R-Type instruction (opcode = 6'b000000)
        opcode = 6'b000000;
        #10;
        $display("R-Type: RegDst=%b, Branch=%b, MemRead=%b, MemWrite=%b, MemToReg=%b, ALUSrc=%b, RegWrite=%b, ALUOp=%b", 
                 RegDst, Branch, MemRead, MemWrite, MemToReg, ALUSrc, RegWrite, ALUOp);

        // LW (Load Word) instruction (opcode = 6'b100011)
        opcode = 6'b100011;
        #10;
        $display("LW: RegDst=%b, Branch=%b, MemRead=%b, MemWrite=%b, MemToReg=%b, ALUSrc=%b, RegWrite=%b, ALUOp=%b", 
                 RegDst, Branch, MemRead, MemWrite, MemToReg, ALUSrc, RegWrite, ALUOp);

        // SW (Store Word) instruction (opcode = 6'b101011)
        opcode = 6'b101011;
        #10;
        $display("SW: RegDst=%b, Branch=%b, MemRead=%b, MemWrite=%b, MemToReg=%b, ALUSrc=%b, RegWrite=%b, ALUOp=%b", 
                 RegDst, Branch, MemRead, MemWrite, MemToReg, ALUSrc, RegWrite, ALUOp);

        // BEQ (Branch on Equal) instruction (opcode = 6'b000100)
        opcode = 6'b000100;
        #10;
        $display("BEQ: RegDst=%b, Branch=%b, MemRead=%b, MemWrite=%b, MemToReg=%b, ALUSrc=%b, RegWrite=%b, ALUOp=%b", 
                 RegDst, Branch, MemRead, MemWrite, MemToReg, ALUSrc, RegWrite, ALUOp);


        $finish;
    end

endmodule