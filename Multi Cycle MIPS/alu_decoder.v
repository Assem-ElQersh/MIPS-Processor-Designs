module alu_decoder(
    input [5:0] func,
    input [1:0] alu_op,
    output reg [2:0] alu_control,
    output reg error_flag
);
always @(*) begin
    error_flag = 0;
    case(alu_op)
        2'b00: alu_control = 3'b010;
        2'b01: alu_control = 3'b110;
        2'b10: 
            case(func)
                6'b100000: alu_control = 3'b010;
                6'b100010: alu_control = 3'b110;
                6'b100100: alu_control = 3'b000;
                6'b100101: alu_control = 3'b001;
                6'b101010: alu_control = 3'b111;
                default:   {alu_control, error_flag} = {3'bxxx, 1'b1};
            endcase
        default: {alu_control, error_flag} = {3'bxxx, 1'b1};
    endcase
end
endmodule
