module univ_shift_register (
  input [3:0] data,         
  input clk,             
  input reset,           
  input [2:0] control,   
  output reg [3:0] Q     
);

  reg [3:0] internal_reg;  

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      internal_reg <= 4'b0;  // Reset internal_reg to 0000
    end else begin
      case (control)
        3'b000: ;  // Hold (No Change)
        3'b001: internal_reg <= data;  // Parallel load
        3'b010: internal_reg <= {internal_reg[2:0], data[0]};  // Serial load
        3'b011: internal_reg <= {internal_reg[2:0], data[3]};  // Shift left
        3'b100: internal_reg <= {data[3], internal_reg[3:1]};  // Shift right
        3'b101: internal_reg <= ~data;  // Invert
        3'b110: internal_reg <= data << 1;  // Multiply by 2 (Same as Shift left)
        3'b111: internal_reg <= data >> 1;  // Divide by 2
      endcase
    end
  end

  always @* begin
    Q = internal_reg;  // Assign the output Q with the current state of the internal register
  end
endmodule