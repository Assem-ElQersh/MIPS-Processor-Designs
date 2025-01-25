module main_decoder(
    input clock, reset,
    input [5:0] opcode,
    output reg pc_write, mem_write, instr_write, reg_write,
    output reg alu_src_a, branch, mem_to_reg_sel, reg_dest,
    output reg [1:0] alu_src_b,
    output reg [1:0] pc_source,
    output reg [1:0] alu_op
);

endmodule