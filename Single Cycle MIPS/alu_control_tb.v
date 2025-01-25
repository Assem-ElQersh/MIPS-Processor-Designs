module ALU_Control_tb;

    reg [1:0] ALUOp;
    reg [5:0] FuncCode;
    wire [3:0] ALUControl;

    ALU_Control uut (
        .ALUOp(ALUOp),
        .FuncCode(FuncCode),
        .ALUControl(ALUControl)
    );

    initial begin
        // Test LW/SW
        ALUOp = 2'b00; FuncCode = 6'bXXXXXX;
        #10 $display("LW/SW: ALUControl = %b", ALUControl);

        // Test BEQ
        ALUOp = 2'b01; FuncCode = 6'bXXXXXX;
        #10 $display("BEQ: ALUControl = %b", ALUControl);

        // Test R-Type: Add
        ALUOp = 2'b10; FuncCode = 6'b100000;
        #10 $display("R-Type Add: ALUControl = %b", ALUControl);

        // Test R-Type: Subtract
        ALUOp = 2'b10; FuncCode = 6'b100010;
        #10 $display("R-Type Subtract: ALUControl = %b", ALUControl);

        // Test R-Type: AND
        ALUOp = 2'b10; FuncCode = 6'b100100;
        #10 $display("R-Type AND: ALUControl = %b", ALUControl);

        // Test R-Type: OR
        ALUOp = 2'b10; FuncCode = 6'b100101;
        #10 $display("R-Type OR: ALUControl = %b", ALUControl);

        // Test R-Type: Set on Less Than
        ALUOp = 2'b10; FuncCode = 6'b101010;
        #10 $display("R-Type SLT: ALUControl = %b", ALUControl);

        $stop;
    end
endmodule