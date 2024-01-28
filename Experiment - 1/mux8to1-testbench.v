//behavioural
module tb_mux8to10b;
reg [7:0] in; reg [2:01 sel;
wire out;
mux8tol mO(in, sel, out);
initial begin
§dumpfile("mux8to1.
§dumpvars (0);
_behavioral.vcd");
Smonitor ("input = %b, sel = %b, output = %b", in, sel, out);
in = 8'b00000000; sel = 3'b000;
#1;
in = 8'b00000001; sel = 3'b000;
#1;
in = 8'b00000010; sel = 3'b001;
#1;
in = 8'b00000100; sel = 3'b010;
#1;
in = 8'600001000; sel = 3'b011;
#1;
in = 8'b00010000; sel = 3'b100;
#1;
in = 8'b00100000; sel = 3'b101;
#1;
in = 8'b01000000; sel = 3'b110;
#1;
in = 8'b10000000; sel = 3'b111;
#1;
in = 8'b11110000; sel = 3'b010;
#1;
in = 8'b10101010; sel = 3'b100;
end
endmodule


//structural
module tb_mux8to10s;
  reg [7:0] in; reg [2:0] sel;
  wire out;
  mux8to1 mOin, sel, out);
  initial begin
  §dumpfile("mux8tol_behavioral.vcd");
  $dumpvars (0);
  Smonitor ("input = %b, sel = %b, output = %b", in, sel, out);
  in = 8'b00000000; sel = 3'b000;
  #1;
  in = 8'b00000001; sel = 3'6000;
  #1;
  in = 8'b00000010; sel = 3'b001;
  #1;
  in = 8'b00000100; sel = 3'b010;
  #1;
  in = 8'b00001000; sel = 3'b011;
  #1;
  in = 8'b00010000; sel = 3'b100;
  #1;
  in = 8'b00100000; sel = 3'b101;
  #1;
  in = 8'b01000000; sel = 3'b110;
  #1;
  in = 8'b10000000; sel = 3'b111;
  #1;
  in = 8'b11110000; sel = 3'b010;
  #1;
  in = 8'10101010; sel = 3'b100;
  end
endmodule

