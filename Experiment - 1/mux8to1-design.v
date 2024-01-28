//behavioural
module mux2to1b(input [1:0] in, input sel, output out);
  assign out = sel ? in[1] : in[0];
endmodule


//structural
module mux2to1s(input [1:0] in, input sel, output out);
  
  wire nsel;
  wire [1:0] iw;
  not nO(nsel, sel);
  
  and ao(iw[0], in[0], nsel);
  and al(iw[1], in[1], sel);
  
  or o0(out, iw[0], iw[1]);
  
endmodule


//behavioural


module mux8to1b(input [7:0] in, input [2:0] sel, output out);
  
  wire [5:0] iw;
  
  mux2to1 ml(in[7:6], sel[0], iw[3]);
  mux2to1 m2(in[5:4], sel[0], iw[2]);
  mux2to1 m3(in[3:2], sel[0], iw[1]);
  mux2to1 m4(in[1:0], sel[0], iw[0]);
  
  mux2to1 m5(iw[3:2], sel[1], iw[5]);
  mux2to1 m6(iw[1:0], sel[1], iw[4]);
  
  mux2to1 m7 (iw[5:4], sel[2], out);
  
endmodule




//structural
module mux8to1s(input [7:0] in, input [2:0] sel, output out);
  
  wire [5:0] iw;
  mux2to1 ml(in[7:6], sel[0], iw[3]);
  mux2to1 m2(in[5:4], sel[0], iw[2]);
  mux2to1 m3(in[3:2], sel[0], iw[1]);
  mux2to1 m4(in[1:0], sel[0], iw[0]);
  
  mux2to1 m5(in[3:2], sel[1], iw[5]);
  mux2to1 m6(in[1:0], sel[1], iw[4]);
  
  mux2to1 m7 (iw[5:4], sel[2], out);
  
endmodule

