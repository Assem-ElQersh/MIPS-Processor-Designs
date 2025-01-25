module mux4 #(parameter WIDTH = 8) (
    input [WIDTH-1:0] input0, input1, input2, input3,
    input [1:0] select,
    output reg [WIDTH-1:0] output_data
);
always @(*) 
    case(select)
        2'b00: output_data <= input0;
        2'b01: output_data <= input1;
        2'b10: output_data <= input2;
        2'b11: output_data <= input3;
    endcase
endmodule