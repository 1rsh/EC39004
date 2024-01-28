module d_flip_flop (
  input D,      
  input clk,    
  input reset,  
  output reg Q  
);

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      Q <= 1'b0;  
    end else begin
      Q <= D;  
    end
  end

endmodule

module four_bit_shift_register (
  input [3:0] D,      
  input clk,          
  input reset,        
  output reg [3:0] Q   
);

  wire [3:0] internal_wire;  // declaring internal wires

  // cascading 4 D Flip-Flops
  d_flip_flop u1 (.D(D[0]), .clk(clk), .reset(reset), .Q(internal_wire[0]));
  d_flip_flop u2 (.D(D[1]), .clk(clk), .reset(reset), .Q(internal_wire[1]));
  d_flip_flop u3 (.D(D[2]), .clk(clk), .reset(reset), .Q(internal_wire[2]));
  d_flip_flop u4 (.D(D[3]), .clk(clk), .reset(reset), .Q(internal_wire[3]));

  always @* begin
    Q = internal_wire; 
  end

endmodule
