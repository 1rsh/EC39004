`timescale 1ns / 1ns

module inst_decoder(
  input [7:0] in,
  output reg [2:0] operand_a,
  output reg [2:0] operand_b,
  output reg [4:0] out_enable
);
  wire is_00;
  _nor part1(in[7:6], is_00);
  always @* begin
    if (is_00 == 1'b1) begin
      operand_a <= in[5:3];
      operand_b <= in[2:0];

      if (operand_b == 3'b000) begin
        out_enable <= 5'b00001;
      end
      else if (operand_a == 3'b000) begin
        out_enable <= 5'b00100;
      end
      else begin
        out_enable <= 5'b00010;
      end
    end
    else begin
      if (in[5] == 1'b0) begin
        out_enable <= 5'b01000;
      end
      else begin
        out_enable <= 5'b10000;
      end
    end
  end
endmodule


module _nor(
  input [1:0] in,
  output out
);
  assign out = ~ (in[1] | in[0]);
endmodule


module register(
  input clk,
  input clr,
  input op_en,
  input in_en,
  input [7:0] data_in,
  output [7:0] out
);
  reg [7:0] state;
  
  assign out = op_en ? state : 8'bz;
  
  always @(negedge clk or negedge clr) begin
    
    if (!clr) begin
      state = 8'b0;
    end
    else if (in_en) begin
      state <= data_in;
    end
  end
endmodule

module register_bank(
  input clk,
  input clr,
  input [7:0] op_en,
  input [7:0] in_en,
  input [7:0] data_in,
  output [7:0] out
);
  integer i;
  
  always @* begin
    for (i=0, i < 8, i = i+1) begin
      register reggy[i](clk, clr, op_en[i], in_en[i], data_in, out)
    end
  end
endmodule
