module multiplexador (controle, din, dregs, dALU, dout);

  input [1:0] controle;
  input [15:0] din, dregs, dALU;
  output reg [15:0] dout;

  always @(*)
    case(controle)
      0: dout <= din;
      1: dout <= dregs;
      2: dout <= dALU;
      default: dout <= 0;
    endcase

endmodule
