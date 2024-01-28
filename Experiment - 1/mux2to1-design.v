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

