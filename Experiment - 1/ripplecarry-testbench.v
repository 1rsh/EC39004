module tbripplecarryadder_40;


  reg [3:0] in1;
  reg [3:0] in2;
  reg cin;


  reg [8:0] ctr;


  wire [3:0] sum;


  wire cout;


  ripplecarryadder_4 rac0(inl, in2, cin, sum, cout) ;
  initial begin
    $dumpfile("ripplecarryadder_4.vcd");
    $dumpvars (0);
    $monitor("input 1 = %b, input 2 = %b, cin = %b, sum = %b, cout = %b", in1, in2, cin, sum, cout);
  for(ctr = 9'b0-000_0000; ctr<=9'b11111_1111; ctr=ctr+1)
    begin
      assign in1 = ctr[3:0];
      assign in2 = ctr[7:4];
      assign cin = ctr[8];
      #1;
    end
  end
endmodule

