module RB (
  input Clock, Wr, incr_pc, reset,
  input [2:0] addr,
  input [15:0] data,
  output [15:0] q, outR0, outR1, outR2, outR3
);

  wire [7:0] outDecoder;
  wire [15:0] registers [7:0];

  // Simulation purpose
  initial
    $monitor("R0(%h), R1(%h), R2(%h) R3(%h)", registers[0], registers[1], registers[2], registers[3]);

  decoderRB dec(Clock, addr, outDecoder);

  register #(16) reg0 (Clock, reset, outDecoder[0] & Wr, data, registers[0]);
  register #(16) reg1 (Clock, reset, outDecoder[1] & Wr, data, registers[1]);
  register #(16) reg2 (Clock, reset, outDecoder[2] & Wr, data, registers[2]);
  register #(16) reg3 (Clock, reset, outDecoder[3] & Wr, data, registers[3]);
  register #(16) reg4 (Clock, reset, outDecoder[4] & Wr, data, registers[4]);
  register #(16) reg5 (Clock, reset, outDecoder[5] & Wr, data, registers[5]);
  register #(16) reg6 (Clock, reset, outDecoder[6] & Wr, data, registers[6]);

  // Because of Increment, the register PC needs a specific logic
  register_PC #(16) PC (Clock, reset, outDecoder[7] & Wr, incr_pc, data, registers[7]);

  // Always read
  assign q = registers[addr];
  assign outR0 = registers[0];
  assign outR1 = registers[1];
  assign outR2 = registers[2];
  assign outR3 = registers[3];

endmodule
