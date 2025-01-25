module MIPS_ALU #(
    parameter Width = 32
)(
    input [Width-1:0] A,
    input [Width-1:0] B,
    input [3:0] ALUControl,
    output reg [Width-1:0] ALUResult,
    output Zero
);

    assign Zero = (ALUResult == {Width{1'b0}});

    always @(*) begin
        case (ALUControl)
            4'b0000: ALUResult = A & B;
            4'b0001: ALUResult = A | B;
            4'b0010: ALUResult = A + B;
            4'b0110: ALUResult = A - B;
            4'b0111: ALUResult = (A < B) ? 1 : 0;
            4'b1100: ALUResult = ~(A | B);
            default: ALUResult = {Width{1'b0}};
        endcase
    end
endmodule