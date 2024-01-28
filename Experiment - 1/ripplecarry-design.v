module fulladder (input [1:0] in, input cin, output sum, output cout);


  assign sum = in[0] ^ in[1] ^ cin;
  assign cout = (in[0]&&in[1]) || (cin&&(in[0]^in[1]));
endmodule


module ripplecarryadder_4(input [3:0] in1, input [3:0] in2, input cin, output
[3:0] sum, output cout) ;


  wire [2:0] iw;
  
  fulladder fa0(in1[0], in2[0], cin, sum[0], iw[0]);
  fulladder fal(in1[1], in2[1], iw[O], sum[1], iw[1]);
  fulladder fa2(in1[2], in2[2], iw[1], sum[2], iw[2]);
  fulladder fa3(in1[3], in2[3], iw[2], sum[3], cout);
endmodule

