`timescale 1ns / 1ns


module testbench;
  wire [2:0] operand_a;
  wire [2:0] operand_b;
  wire [4:0] instr_flag;
  reg [7:0] in;
  
  inst_decoder uut(in, operand_a, operand_b, instr_flag);
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    in = 8'b00001000;
    #10
    in = 8'b00001001;
    #10
    in = 8'b00000001;
    #10
    in = 8'b01000001;
    #10
    in = 8'b01100001;
    #10
    $finish;
    
  end
endmodule
