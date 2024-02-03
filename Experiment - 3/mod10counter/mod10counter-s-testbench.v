`timescale 1ns / 1ns

module mod10counter_tb;
  parameter CLK_PERIOD = 10; 

  reg clk=1;
  reg rst;

  wire [3:0] out;

  mod10counter uut(
    .clk(clk),
    .rst(rst),
    .out(out)
  );
  
  always #((CLK_PERIOD / 2)) clk = ~clk; // Clock Generation
  
  initial begin
    
    $dumpfile("dump.vcd"); $dumpvars();
    rst = 0;
    #2 rst = 1;
    #108 $finish;
    
  end

endmodule
