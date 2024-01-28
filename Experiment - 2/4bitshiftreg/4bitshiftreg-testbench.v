module four_bit_shift_register_tb;

  parameter CLK_PERIOD = 10; 

  reg [3:0] D;
  reg clk, reset;
  wire [3:0] Q;

  four_bit_shift_register uut (
    .D(D),
    .clk(clk),
    .reset(reset),
    .Q(Q)
  );


  always #((CLK_PERIOD / 2)) clk = ~clk; // Clock Generation


  initial begin
    $dumpfile("dump.vcd"); $dumpvars;

    D = 4'b0000;
    clk = 0;
    reset = 1;

    #2 reset = 0;

    #10 D = 4'b1010;

    #20 D = 4'b0000;

    #20 D = 4'b1101;

    #20 D = 4'b0000;

    #10 $finish;
  end
endmodule

