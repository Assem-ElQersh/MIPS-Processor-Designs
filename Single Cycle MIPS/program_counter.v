module Program_Counter (
    input clk,
    input [31:0] nextPC,
    output reg [31:0] currentPC
);
    always @(posedge clk) begin
        currentPC <= nextPC;
    end
endmodule