module data_path(
    input clock, reset,
    input pc_enable, instr_write, reg_write,
    input alu_src_a, mem_to_reg_sel, reg_dest,
    input [1:0] alu_src_b,
    input [1:0] pc_source,
    input [2:0] alu_control,
    output [5:0] opcode, func,
    output zero_flag,
    output [31:0] address, data_out,
    input [31:0] data_in
);

wire [4:0] write_reg;
wire [31:0] next_pc, current_pc;
wire [31:0] instruction, mem_data, src_a, src_b;
wire [31:0] reg_a;
wire [31:0] alu_result, alu_output;
wire [31:0] sign_ext_imm;
wire [31:0] sign_ext_imm_shifted;
wire [31:0] write_data, read_data1, read_data2;

endmodule
