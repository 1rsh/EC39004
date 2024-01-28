module jk_flip_flop (
  input J, 
  input K, 
  input clk,
  input reset,
  output reg Q,
  output reg Q_bar
);

  always @(posedge clk or posedge reset) begin // Triggered when clk or reset goes from 0->1
    if (reset) begin // If reset is 1, set Q=0 and Q'=1
      Q <= 1'b0; 
      Q_bar <= 1'b1;
    end else begin
      case ({J, K})
        2'b00: ;  // J=0, K=0 -> No change
        2'b01: Q <= 1'b0;  // J=0, K=1 -> Reset
        2'b10: Q <= 1'b1;  // J=1, K=0 -> Set
        2'b11: Q <= ~Q;  // J=1, K=1 -> Toggle
      endcase
      Q_bar <= ~Q;
    end
  end
endmodule