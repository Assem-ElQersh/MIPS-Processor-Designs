module control_unit(
    input clock, reset,
    input [5:0] opcode,
    output reg pc_write, mem_write, instr_write, reg_write,
    output reg alu_src_a, branch, mem_to_reg_sel, reg_dest,
    output reg [1:0] alu_src_b,
    output reg [1:0] pc_source,
    output reg [1:0] alu_op
);
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            {pc_write, mem_write, instr_write, reg_write, alu_src_a, branch,
             mem_to_reg_sel, reg_dest, alu_src_b, pc_source, alu_op} <= 0;
        end else begin
            case (opcode)
                6'b000000: {pc_write, reg_write, alu_op} <= {1'b1, 1'b1, 2'b10};
                6'b100011: {mem_write, alu_src_a, alu_src_b, alu_op} <= {1'b0, 1'b1, 2'b01, 2'b00};
                6'b101011: {mem_write, alu_src_a, alu_src_b, alu_op} <= {1'b1, 1'b1, 2'b01, 2'b00};
                6'b000100: {branch, pc_source} <= {1'b1, 2'b01};
                6'b001000: {reg_write, alu_src_b, alu_op} <= {1'b1, 2'b01, 2'b00};
                default: {pc_write, mem_write, instr_write, reg_write, alu_src_a, branch,
                          mem_to_reg_sel, reg_dest, alu_src_b, pc_source, alu_op} <= 11'bx;
            endcase
        end
    end
endmodule
