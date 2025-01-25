module Control_Block(
    input [5:0] opcode,
    output reg RegDst, // Register Destination
    output reg Branch, // Branch Operations
    output reg MemRead, // Memory Read LW
    output reg MemWrite, // Memory Write SW
    output reg MemToReg, // determine whether data written to register coming from memory or ALU
    output reg ALUSrc, // ALU Source Operand whether second operand for the ALU coming from register or from memory
    output reg RegWrite, // Registerr Write Control Signal
    output reg [1:0] ALUOp //2-bit ALUOp signal to decide which operation it should perform
    // 00 load and store 01 Branching 10 R-type instructions 11 Reserverd/Unused
);

    always @(*) begin
        case (opcode)
            6'b000000: begin
                RegDst = 1;
                Branch = 0;
                MemRead = 0;
                MemWrite = 0;
                MemToReg = 0;
                ALUSrc = 0;
                RegWrite = 1;
                ALUOp = 2'b10;
            end
            6'b100011: begin
                RegDst = 0;
                Branch = 0;
                MemRead = 1;
                MemWrite = 0;
                MemToReg = 1;
                ALUSrc = 1;
                RegWrite = 1;
                ALUOp = 2'b00;
            end
            6'b101011: begin
                RegDst = 0;
                Branch = 0;
                MemRead = 0;
                MemWrite = 1;
                MemToReg = 0;
                ALUSrc = 1;
                RegWrite = 0;
                ALUOp = 2'b00;
            end
            6'b000100: begin
                RegDst = 0;
                Branch = 1;
                MemRead = 0;
                MemWrite = 0;
                MemToReg = 0;
                ALUSrc = 0;
                RegWrite = 0;
                ALUOp = 2'b01;
            end
            default: begin
                RegDst = 0;
                Branch = 0;
                MemRead = 0;
                MemWrite = 0;
                MemToReg = 0;
                ALUSrc = 0;
                RegWrite = 0;
                ALUOp = 2'b00;
            end
        endcase
    end
endmodule