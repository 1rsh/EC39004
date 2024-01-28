module universal_shift_register_tb;


  parameter CLK_PERIOD = 10; 


  reg [3:0] D;
  reg [2:0] control;
  reg clk, reset;
  wire [3:0] Q;


  univ_shift_register uut (
    .data(D),
    .clk(clk),
    .reset(reset),
    .control(control),
    .Q(Q)
  );


  always #((CLK_PERIOD / 2)) clk = ~clk; // Clock Generation


  initial begin
    
    $dumpfile("dump.vcd"); $dumpvars;

    D = 4'b0000;
    control = 3'b100; //Set Control Here
    clk = 0;
    reset = 1;


    #2 reset = 0;

    #10 D = 4'b0011;
    
    #20 D = 4'b1000;

    #20 D = 4'b1010;

    #20 D = 4'b1111;

    #20 D = 4'b1110;

    #10 $finish;
  end

endmodule
