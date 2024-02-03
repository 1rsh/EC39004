`timescale 1ns / 1ns

module seqdetector(
  input wire clk,
  input wire reset,
  input wire X,
  output reg detect,
  output reg[2:0] state
);

  parameter S0 = 3'b000;
  parameter S1 = 3'b001;
  parameter S2 = 3'b010;
  parameter S3 = 3'b011;
  parameter S4 = 3'b100;

  always @(posedge clk or posedge reset)
    begin
      if (reset)
        begin
          state <= S0;
          detect <= 0;
        end
      else
        begin
          case (state)
            S0:
              begin
                if (X == 0)
                  begin
                    state <= S1;
                    detect <= 0;
                  end
              end
            S1:
              begin
                if (X == 0)
                  begin
                    state <= S2;
                    detect <= 0;
                  end
                else
                  begin
                    state <= S0;
                    detect <=0;
                  end
              end

            S2:
              begin
                if(X==0)
                  begin
                    state <= S3;
                    detect <= 0;
                  end
                else
                  begin
                    state <= S0;
                    detect <= 0;
                  end
              end

            S3:
              begin
                if(X==1)
                  begin
                    state <= S4;
                    detect <= 0;
                  end
                else
                  begin
                    state <= S0;
                    detect <= 0;
                  end
              end
            S4:
              begin
                if(X==0)
                  begin
                    state <= S1;
                    detect <= 1;
                  end
                else
                  begin
                    state <= S0;
                    detect <= 0;
                  end
              end
          endcase
        end
    end 
endmodule
