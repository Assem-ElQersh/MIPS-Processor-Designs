module mips_processor(
    input clock, 
    input reset,
    output [31:0] address, 
    output [31:0] data_out, 
    output mem_write, 
    input [31:0] data_in
);
    // Internal signals
    wire zero_flag, pc_enable, instr_write, reg_write, alu_src_a, mem_to_reg_sel, reg_dest;
    wire [1:0] alu_src_b, pc_source;
    wire [2:0] alu_control;
    wire [5:0] opcode, func;

    // Instantiate control unit
    control_unit cu(
        .clock(clock), 
        .reset(reset), 
        .opcode(opcode), 
        .func(func), 
        .zero_flag(zero_flag), 
        .pc_enable(pc_enable), 
        .mem_write(mem_write), 
        .instr_write(instr_write), 
        .reg_write(reg_write), 
        .alu_src_a(alu_src_a), 
        .mem_to_reg_sel(mem_to_reg_sel), 
        .reg_dest(reg_dest), 
        .alu_src_b(alu_src_b), 
        .pc_source(pc_source), 
        .alu_control(alu_control)
    );

    // Instantiate data path
    data_path dp(
        .clock(clock), 
        .reset(reset), 
        .pc_enable(pc_enable), 
        .instr_write(instr_write), 
        .reg_write(reg_write), 
        .alu_src_a(alu_src_a), 
        .mem_to_reg_sel(mem_to_reg_sel), 
        .reg_dest(reg_dest), 
        .alu_src_b(alu_src_b), 
        .pc_source(pc_source), 
        .alu_control(alu_control), 
        .opcode(opcode), 
        .func(func), 
        .zero_flag(zero_flag), 
        .address(address), 
        .data_out(data_out), 
        .data_in(data_in)
    );
endmodule
