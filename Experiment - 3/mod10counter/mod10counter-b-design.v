`timescale 1ns / 1ns

module mod10behavioural(
  input wire clk,
  input wire reset_n,
  input wire [3:0] load_value,
  input wire load,
  input wire up_down,
  input wire upthendown,
  output reg [3:0] q
);

  reg direction=1'b0; 
  
  always @(posedge clk) begin
    if (!reset_n)
      begin
        q <= 4'b0000; 
        direction = 1'b0; 
      end
    else if (load)
      begin
        q <= load_value; 
      end
    else if (upthendown) begin
      if (q == 4'b1001) direction = ~direction; 
      if (q == 4'b0000) direction = ~direction; 
      case (direction)
        1'b0: q <= q + 1'b1;
        1'b1: q <= q - 1'b1; endcase
    end
    else begin
      case (up_down)
        1'b0: q <= q + 1'b1; 
        1'b1: q <= q - 1'b1; 
      endcase
    end

    if (q == 4'b1001 && upthendown == 0 && up_down == 0)
      begin
        q <= 4'b0000; 
      end
    else if(q == 4'b0000 && upthendown == 0 && up_down == 1)
      begin
        q <= 4'b1001; 
      end
  end
endmodule
