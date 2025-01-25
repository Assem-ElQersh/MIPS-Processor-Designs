module mux2 #(parameter WIDTH = 8) (
    input [WIDTH-1:0] input0, input1,
    input select,
    output [WIDTH-1:0] output_data
);
assign output_data = select ? input1 : input0;
endmodule