module top(
    input clk,
    input reset,
    output [31:0] writedata,
    output [31:0] dataadr,
    output memwrite
);

    wire [31:0] pc, instr, readdata;
    wire [31:0] aluout, srcb, srca;
    wire [3:0] alucontrol;
    wire alusrc, memtoreg, regdst, regwrite, memread, memwrite_internal, branch;
    wire [1:0] aluop;
    wire zero, pcsrc;

    Program_Counter pc_inst(
        .clk(clk),
        .nextPC(pcsrc ? (pc + {{14{instr[15]}}, instr[15:0], 2'b00}) : (pc + 4)),
        .currentPC(pc)
    );

    Instruction_Memory imem_inst(
        .readaddr(pc),
        .instruction(instr)
    );

    Control control_inst(
        .OpCode(instr[31:26]),
        .RegDst(regdst),
        .Branch(branch),
        .MemRead(memread),
        .MemtoReg(memtoreg),
        .ALUOp(aluop),
        .MemWrite(memwrite_internal),
        .ALUSrc(alusrc),
        .RegWrite(regwrite)
    );

    Registers_Block regfile_inst(
        .clk(clk),
        .WE(regwrite),
        .ReadReg1(instr[25:21]),
        .ReadReg2(instr[20:16]),
        .WriteReg(regdst ? instr[15:11] : instr[20:16]),
        .WriteData(memtoreg ? readdata : aluout),
        .ReadData1(srca),
        .ReadData2(srcb)
    );

    Sign_Extend signext_inst(
        .in(instr[15:0]),
        .out(srcb)
    );

    MIPS_ALU alu_inst(
        .A(srca),
        .B(alusrc ? srcb : srca),
        .ALUControl(alucontrol),
        .ALUResult(aluout),
        .Zero(zero)
    );

    ALU_Control alucontrol_inst(
        .ALUOp(aluop),
        .FuncCode(instr[5:0]),
        .ALUControl(alucontrol)
    );

    MIPS_Data_Memory dmem_inst(
        .A(aluout),
        .WD(srcb),
        .WE(memwrite_internal),
        .CLK(clk),
        .RD(readdata)
    );

    assign pcsrc = branch & zero;
    assign dataadr = aluout;
    assign writedata = srcb;
    assign memwrite = memwrite_internal;

endmodule
