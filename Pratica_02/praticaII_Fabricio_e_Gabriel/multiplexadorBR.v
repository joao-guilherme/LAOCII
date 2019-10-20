module multiplexadorBR (enderecoBR, reg0, reg1, reg2, reg3, reg4, reg5, reg6, pc, dBR);

  input [2:0] enderecoBR;
  input [15:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, pc;
  output reg [15:0] dBR;

  always @(*)
    case(enderecoBR)
      0: dBR <= reg0;
      1: dBR <= reg1;
      2: dBR <= reg2;
      3: dBR <= reg3;
      4: dBR <= reg4;
      5: dBR <= reg5;
      6: dBR <= reg6;
      7: dBR <= pc;
      default: dBR <= 0;
    endcase

endmodule
