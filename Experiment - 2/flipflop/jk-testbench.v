module jk_flip_flop_tb;

  parameter CLK_PERIOD = 10; 

  reg J, K, clk, reset;
  wire Q, Q_bar;

  jk_flip_flop uut (
    .J(J),
    .K(K),
    .clk(clk),
    .reset(reset),
    .Q(Q),
    .Q_bar(Q_bar)
  );

  always #((CLK_PERIOD / 2)) clk = ~clk; // Clock Generation

  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    J = 0;
    K = 0;
    clk = 0;
    reset = 1;

    #2 reset = 0;

    #10 J = 0; K = 0;

    #20 J = 0; K = 1;

    #20 J = 1; K = 0;

    #20 J = 1; K = 1;

    #20 J = 0; K = 0;

    #10 $finish;
  end
endmodule
