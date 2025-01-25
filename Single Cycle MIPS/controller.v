module Control(
    input [5:0] OpCode,     // 6-bit opcode from the instruction
    output reg RegDst,      // Register destination signal
    output reg Branch,      // Branch signal
    output reg MemRead,     // Memory read signal
    output reg MemtoReg,    // Memory to register signal
    output reg [1:0] ALUOp, // ALU operation signal
    output reg MemWrite,    // Memory write signal
    output reg ALUSrc,      // ALU source signal
    output reg RegWrite     // Register write signal
    );

always @(*) begin
    RegDst = 0;
    Branch = 0;
    MemRead = 0;
    MemtoReg = 0;
    ALUOp = 2'b00;
    MemWrite = 0;
    ALUSrc = 0;
    RegWrite = 0;
    case (OpCode)
        6'b000000: begin // R-Type
            RegDst = 1;
            RegWrite = 1;
            ALUOp = 2'b10;
        end
        6'b100011: begin // lw
            ALUSrc = 1;
            MemtoReg = 1;
            RegWrite = 1;
            MemRead = 1;
        end
        6'b101011: begin // sw 
            ALUSrc = 1;
            MemWrite = 1;
        end
        6'b000100: begin // beq 
            Branch = 1;
            ALUOp = 2'b01;
        end
        6'b001000: begin // addi 
            ALUSrc = 1;
            RegWrite = 1;
        end
        default: begin
        end
    endcase
end

endmodule