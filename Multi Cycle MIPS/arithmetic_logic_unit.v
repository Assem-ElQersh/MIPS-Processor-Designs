module arithmetic_logic_unit(
    input [31:0] operand1, operand2,
    input [2:0] function_select,
    output reg [31:0] result,
    output is_zero
);
always @(*)
    case (function_select[2:0])
        3'b000: result <= operand1 & operand2;          // AND
        3'b001: result <= operand1 | operand2;          // OR
        3'b010: result <= operand1 + operand2;          // ADD
        3'b110: result <= operand1 - operand2;          // SUB
        3'b111: result <= (operand1 < operand2) ? 1 : 0; // SLT
        default: result <= 0;
    endcase

assign is_zero = (result == 32'b0);
endmodule