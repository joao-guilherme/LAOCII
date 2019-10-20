module pratica2 (KEY, SW, LEDG, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);

  input [0:0] KEY;
  input [17:16] SW; // Clock, Run, Reset
  output [8:8] LEDG;
  output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;

  wire w;
  wire [15:0] din, dout, daddr;

  wire [9:0] instrucao;
  wire [15:0] reg0, reg1, reg2, reg3, reg4, reg5, pc;

  initial
    $monitor("R0(%h), R1(%h), R2(%h), R3(%h)", reg0, reg1, reg2, reg3);

  processador proc (~KEY[0], SW[17], SW[16], din, LEDG[8], w, daddr, dout, instrucao, reg0, reg1, reg2, reg3, reg4, reg5, pc);
  memoria mem (~KEY[0], w & SW[17], daddr, dout, din);

  // Teste 1
  displays hexID (instrucao, HEX6);
  displays hexPC (pc, HEX4);
  displays hex0 (reg0, HEX3);
  displays hex1 (reg1, HEX2);
  displays hex2 (reg2, HEX1);
  displays hex3 (reg3, HEX0);

  assign HEX5 = 7'b1111111;
  assign HEX7 = 7'b1111111;

  /*
  // Teste 2 (loop)
  displays hex4 (reg4, HEX6);
  displays hex2 (reg2, HEX4);
  displays hex5 (reg5, HEX2);
  displays hexPC (pc, HEX0);

  assign HEX1 = 7'b1111111;
  assign HEX3 = 7'b1111111;
  assign HEX5 = 7'b1111111;
  assign HEX7 = 7'b1111111;
  */

endmodule
