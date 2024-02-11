`timescale 1ns/1ns

// 2 to 1 Multiplexer
module two_to_one_mux(
  input select,
  input [4:0] a,
  input [4:0] b,
  output wire [4:0] out
);

  assign out[0] = a[0]&(~select) | b[0]&select;
  assign out[1] = a[1]&(~select) | b[1]&select;
  assign out[2] = a[2]&(~select) | b[2]&select;
  assign out[3] = a[3]&(~select) | b[3]&select;
  assign out[4] = a[4]&(~select) | b[4]&select;

endmodule

// D Flip Flop
module d_flip_flop(
  input clk, 
  input rst, 
  input din, 
  output reg Q
);
  always @(posedge clk)
    begin
      if(rst)
        Q = 0;
      else
        Q = din;
    end
endmodule

// T Flip Flop
module t_flip_flop(
  input T, 
  input clk, 
  input rst, 
  output reg Q, 
  output reg Q_bar
);

  always @(posedge clk)
    begin
      if(~rst)
        begin
          Q <= Q ^ T;
          Q_bar <= ~(Q ^ T);
        end
      else
        begin
          Q <= 1;
          Q_bar <= 0;
        end
    end

endmodule

// Full Adder
module full_adder(
  input a,
  input b,
  input Cin,
  output S,
  output Cout
);

  wire x,y,z;

  xor g1(x,a,b);
  xor g2(S,x,Cin);
  and g3(y,x,Cin);
  and g4(z,a,b);
  or g5(Cout,y,z);

endmodule

// Ripple Carry Adder
module ripple_carry_adder(
  input [7:0] a, 
  input [7:0] b,
  input cin, 
  output [7:0] sum, 
  output cout
);

  wire cout0, cout1, cout2, cout3, cout4, cout5, cout6;

  full_adder FA0(a[0], b[0], cin, sum[0], cout0);
  full_adder FA1(a[1], b[1], cout0, sum[1], cout1);
  full_adder FA2(a[2], b[2], cout1, sum[2], cout2);
  full_adder FA3(a[3], b[3], cout2, sum[3], cout3);
  full_adder FA4(a[4], b[4], cout3, sum[4], cout4);
  full_adder FA5(a[5], b[5], cout4, sum[5], cout5);
  full_adder FA6(a[6], b[6], cout5, sum[6], cout6);
  full_adder FA7(a[7], b[7], cout6, sum[7], cout);

endmodule

// Down Counter with N as input
module down_counter(
  input clk,
  input rst,
  input load,
  input [4:0] N,
  input stop,
  output [4:0] Q
);

  wire [4:0] T;
  wire [4:0] Q_bar;
  wire [4:0] next;
  wire [4:0] N_inp;

  xor x1(N_inp[0], Q[0], N[0]);
  xor x2(N_inp[1], Q[1], N[1]);
  xor x3(N_inp[2], Q[2], N[2]);
  xor x4(N_inp[3], Q[3], N[3]);
  xor x5(N_inp[4], Q[4], N[4]);

  assign next[0] = 1;

  not n1(q0, Q[0]);
  not n2(q1, Q[1]);
  not n3(q2, Q[2]);
  not n4(q3, Q[3]);
  not n5(q4, Q[4]);

  assign next[1] = q0;

  and a1(next[2], q0, q1);
  and a2(next[3], q0, q1, q2);
  and a3(next[4], q0, q1, q2, q3);

  t_flip_flop t_flip_flop0(T[0]&(~stop), clk, rst, Q[0], Q_bar[0]);
  t_flip_flop t_flip_flop1(T[1]&(~stop), clk, rst, Q[1], Q_bar[1]);
  t_flip_flop t_flip_flop2(T[2]&(~stop), clk, rst, Q[2], Q_bar[2]);
  t_flip_flop t_flip_flop3(T[3]&(~stop), clk, rst, Q[3], Q_bar[3]);
  t_flip_flop t_flip_flop4(T[4]&(~stop), clk, rst, Q[4], Q_bar[4]);
  two_to_one_mux M(load, next, N_inp, T);

endmodule

// Result Block
module result(
  input clk, 
  input clear, 
  input load,
  input [7:0] in,
  output [7:0] res
);

  not g1(load_bar, load);
  and g2(clk1, clk, load_bar);
  
  d_flip_flop d_flip_flop0(clk1, clear, in[0], res[0]);
  d_flip_flop d_flip_flop1(clk1, clear, in[1], res[1]);
  d_flip_flop d_flip_flop2(clk1, clear, in[2], res[2]);
  d_flip_flop d_flip_flop3(clk1, clear, in[3], res[3]);
  d_flip_flop d_flip_flop4(clk1, clear, in[4], res[4]);
  d_flip_flop d_flip_flop5(clk1, clear, in[5], res[5]);
  d_flip_flop d_flip_flop6(clk1, clear, in[6], res[6]);
  d_flip_flop d_flip_flop7(clk1, clear, in[7], res[7]);

endmodule

// Zero Comparator
module zero_comparator(
  input [4:0] count,
  output eqz
);

  wire [3:0] r;

  or g1(r[0],count[0],count[1]);
  or g2(r[1],count[2],r[0]);
  or g3(r[2],count[3],r[1]);
  or g4(r[3],count[4],r[2]);
  not g5(eqz,r[3]);

endmodule

// Full Adder upto N
module adder_upto_n(
  input clk,
  input rst_down_counter,
  input load,
  input [4:0] N,
  output [7:0] res
);

  wire eqz;
  wire cout;

  wire [4:0] down_counter_out;
  wire [7:0] add_a;
  wire [7:0] add_b;

  assign add_a[7] = 0;
  assign add_a[6] = 0;
  assign add_a[5] = 0;
  assign add_a[4] = down_counter_out[4];
  assign add_a[3] = down_counter_out[3];
  assign add_a[2] = down_counter_out[2];
  assign add_a[1] = down_counter_out[1];
  assign add_a[0] = down_counter_out[0];
  

  down_counter C(clk, rst_down_counter, load, N, eqz ,down_counter_out);
  result R(clk, load, eqz, res, add_b);
  ripple_carry_adder A(add_a, add_b, 0, res, cout);
  zero_comparator Z(add_a[4:0], eqz);

endmodule