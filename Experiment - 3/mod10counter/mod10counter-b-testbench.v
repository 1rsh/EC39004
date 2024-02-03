`timescale 1ns / 1ns

module mod10behavioural_tb;
  reg clk;
  reg reset_n;
  reg [3:0] load_value;
  reg load;
  reg up_down;
  reg upthendown=0;

  wire [3:0] q;


  mod10behavioural u1 (
    .clk(clk),
    .reset_n(reset_n),
    .load_value(load_value),
    .load(load),
    .up_down(up_down),
    .upthendown(upthendown),
    .q(q)
  );


  always begin

    #5 clk = ~clk;

  end


  initial
    begin
      $dumpfile("dump.vcd"); $dumpvars;

      clk = 0;

      reset_n = 0;

      load_value = 4'b0000;

      load = 0;

      up_down = 0;

      #10 reset_n = 1; 

      #100 load_value = 4'b0101; load = 1; 
      #22 load = 0; 

      #70 up_down = 1; 

      #50 up_down = 0; 

      #40 upthendown = 1;
      #200 $finish; 

    end
endmodule
