module flopenr #(parameter WIDTH = 8) (
    input clock, reset,
    input enable,
    input [WIDTH-1:0] data_in,
    output reg [WIDTH-1:0] data_out
);
always @(posedge clock or posedge reset)
    if (reset)
        data_out <= 0;
    else if (enable)
        data_out <= data_in;
endmodule