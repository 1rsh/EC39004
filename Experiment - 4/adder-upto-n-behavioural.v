`timescale 1ns / 1ns

module adder_upto_N (
  input wire clk,
  input wire rst,
  output wire [7:0] sum
);

  reg [4:0] counter;
  reg [7:0] accumulator;

  always @(posedge clk or posedge rst) 
    begin
      if (rst) 
        begin
          counter <= 4'b0;
          accumulator <= 8'b0;
        end
      else if (counter <= 5'b10000) 
          begin
            counter <= counter + 1;
            accumulator <= accumulator + counter;
          end
  end

  assign sum = accumulator;

endmodule
