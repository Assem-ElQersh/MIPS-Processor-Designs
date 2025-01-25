module MIPS_Data_Memory 
    #(parameter LOCATIONS = 256) // Declare parameter outside the port list
    (
        input wire [31:0] A,
        input wire [31:0] WD,
        input wire WE,
        input wire CLK,
        output wire [31:0] RD
    );

    reg [31:0] memory [0:LOCATIONS-1];

    // Combinational read
    assign RD = memory[A[9:0]];

    // Sequential write
    always @(posedge CLK) begin
        if (WE) begin
            memory[A[9:0]] <= WD;
        end
    end

endmodule
