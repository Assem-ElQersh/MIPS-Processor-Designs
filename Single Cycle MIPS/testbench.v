module testbench();
    reg clk;
    reg reset;
    wire [31:0] writedata, dataadr;
    wire memwrite;

    top dut (
        .clk(clk),
        .reset(reset),
        .writedata(writedata),
        .dataadr(dataadr),
        .memwrite(memwrite)
    );
initial begin
  reset <= 1; #22;
  reset <= 0;
  $display("\t\t time \tdataadr\t\twritedata");
  $monitor("%d\t%d\t%d", $time, dataadr, writedata);
end
always begin
  clk <= 1; #5;
  clk <= 0; #5;
end
always @(negedge clk) begin
  if(memwrite) begin
    if(dataadr === 84 & writedata === -5) begin
      $display("Simulation succeeded");
      $stop;
    end
  end
end
endmodule

