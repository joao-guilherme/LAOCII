module praticaII (
  input [17:15] SW,
  output [8:8] LEDG,
  output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7
);

  wire W;
  wire [15:0] ADDR, DOUT, DIN, outR0, outR1, outR2, outR3;

// Processor Module Logic
  processor prc (
    .Clock(SW[17]),
    .run(SW[16]),
    .reset(SW[15]),
    .data_in(DIN),
    .Wr(W),
    .done(LEDG[8]),
    .addr_out(ADDR),
    .data_out(DOUT),
    .outR0(outR0),
    .outR1(outR1),
    .outR2(outR2),
    .outR3(outR3),
  );

// The Memory parameter is the MIF file
  MEM #("/home/joao/altera/LAOCII/Pratica_02/praticaII/mif.mem") memory (
    .Clock(SW[17]),
    .Wr(W),
    .addr(ADDR),
    .data(DOUT),
    .q(DIN)
  );

  // Display Register 0
  decoder dR0 (
    .data(outR0[7:4]),
    .display(HEX7)
  );

  decoder uR0 (
    .data(outR0[3:0]),
    .display(HEX6)
  );

  // Display Register 1
  decoder dR1 (
    .data(outR1[7:4]),
    .display(HEX5)
  );

  decoder uR1 (
    .data(outR1[3:0]),
    .display(HEX4)
  );

  // Display Register 2
  decoder dR2 (
    .data(outR2[7:4]),
    .display(HEX3)
  );

  decoder uR2 (
    .data(outR2[3:0]),
    .display(HEX2)
  );

  // Display Register 3
  decoder dR3 (
    .data(outR3[7:4]),
    .display(HEX1)
  );

  decoder uR3 (
    .data(outR3[3:0]),
    .display(HEX0)
  );

endmodule
