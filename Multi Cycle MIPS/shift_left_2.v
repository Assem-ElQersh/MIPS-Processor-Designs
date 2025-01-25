module shift_left_2(
    input [31:0] input_data,
    output [31:0] shifted_data
);
assign shifted_data = {input_data[29:0], 2'b00};  // Shift left by 2
endmodule