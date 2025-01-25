module mux3 #(parameter WIDTH = 8) (
    input [WIDTH-1:0] input0, input1, input2,
    input [1:0] select,
    output [WIDTH-1:0] output_data
);
assign output_data = select[1] ? input2 : (select[0] ? input1 : input0);
endmodule