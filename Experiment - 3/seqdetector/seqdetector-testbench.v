`timescale 1ns / 1ns
module seqdetector_tb(); 
  
  reg clk=0;
  reg reset;
  reg X;
  
  wire detect;
  wire[2:0] state;

  seqdetector dut (
    .clk(clk),
    .reset(reset),
    .X(X),
    .detect(detect),
    .state(state)
  );

  always #5 clk = ~clk;
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    
    reset = 1;
    X = 0;
    #1 reset =0;

    #26 X=1 ;
    #10 X=0;
    #100 $finish;
  end
endmodule
