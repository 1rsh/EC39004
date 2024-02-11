`timescale 1ns / 1ns

module adder_upto_N_tb;

  reg clk;
  reg rst;
  wire [7:0] sum;

  adder_upto_N uut (
    .clk(clk),
    .rst(rst),
    .sum(sum)
  );

  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    clk = 0;
    rst = 1;
    #10; 
    rst = 0; 
    #300; 
    $display("Sum of 16 natural numbers: %d", sum);
    $finish;
  end

  always #5 clk = ~clk;

endmodule
