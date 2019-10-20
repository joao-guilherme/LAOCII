module registrador (clock, reset, escrita, incrementa, din, dout);

  // Quantidade de bits do registrador.
  parameter BITS;

  input clock, reset, escrita, incrementa;
  input [BITS-1:0] din;
  output reg [BITS-1:0] dout;

  initial
    dout <= 0;

  /**
  * Somente o registrador PC ira utilizar a entrada incrementa, nos demais
  * sera sempre 0.
  */
  always @(posedge clock, posedge reset)
    if(reset)
      dout <= 0;
    else if(escrita)
      dout <= din;
    else if(incrementa)
      dout <= dout + 1;

endmodule
