module Registers_Block (
    input wire clk,
    input wire WE,
    input wire [4:0] ReadReg1,
    input wire [4:0] ReadReg2,
    input wire [4:0] WriteReg,
    input wire [31:0] WriteData, // 3 input and & address
    output wire [31:0] ReadData1,
    output wire [31:0] ReadData2
);

    reg [31:0] regFile [31:0]; //32 registers each 32 bit wide 
    
    assign ReadData1 = regFile[ReadReg1];
    assign ReadData2 = regFile[ReadReg2];

    always @(posedge clk) begin
        if (WE && WriteReg != 5'b00000) begin
            regFile[WriteReg] <= WriteData;
        end
    end

endmodule