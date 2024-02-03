`timescale 1ns / 1ns

module t_flip_flop(
  input wire t,
  input wire clk,
  input wire rst,
  output reg q
);

  always @(posedge clk)
    begin
      assign q = rst & (t ? ~q : q);
    end
endmodule

module mod10counter(
  input clk,
  input rst,
  output [3:0] out
);

  wire q0, q1, q2, q3;

  t_flip_flop t0(1, clk, rst, q0);
  t_flip_flop t1((~q3 & q0), clk, rst, q1);
  t_flip_flop t2(q0 & q1, clk, rst, q2);
  t_flip_flop t3(((q3 & q0) || (q2 & q1 & q0)), clk, rst, q3);

  assign out[0] = q0;
  assign out[1] = q1;
  assign out[2] = q2;
  assign out[3] = q3;

endmodule
