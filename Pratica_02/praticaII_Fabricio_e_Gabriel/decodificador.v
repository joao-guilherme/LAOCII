module decodificador (din, dout);

  input [2:0] din;
  output reg [7:0] dout;

  // Desloca o bit 1 para o registrador a ser habilitado
  // Exemplo: 0001 << 2 = 0100
  always @(*)
    dout <= 1 << din;

endmodule
