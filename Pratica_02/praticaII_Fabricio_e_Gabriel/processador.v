module processador (clock, run, reset, din, done, w, daddr, dout, instrucao, reg0, reg1, reg2, reg3, reg4, reg5, pc);

  input clock, run, reset;
  input [15:0] din;
  output done, w;
  output [15:0] daddr, dout;

  // Mostrando nos Displays
  output [9:0] instrucao;
  output [15:0] reg0, reg1, reg2, reg3, reg4, reg5, pc;

  // Fios de Controle
  wire escreveW, escreveA, escreveG, escreveADDR, escreveDOUT, escreveIR, escreveBR, incrementa_pc;
  wire [1:0] controleMUX;
  wire [2:0] enderecoBR, controleULA;

  // Saida dos modulos
  wire [7:0] decBR;
  wire [15:0] buswire, dA, dG, dULA, dBR, reg6;

  controle ctrl (clock, run, reset, instrucao, done, escreveW, escreveA, escreveG, escreveADDR, escreveDOUT, escreveIR,
                 escreveBR, incrementa_pc, controleMUX, controleULA, enderecoBR);

  // Memoria
  registrador #(1) W (clock, reset, escreveW & run, 1'b0, 1'b1, w);
  registrador #(16) ADDR (clock, reset, escreveADDR & run, 1'b0, buswire, daddr);
  registrador #(16) DOUT (clock, reset, escreveDOUT & run, 1'b0, buswire, dout);

  // Instrucao
  registrador #(10) IR (clock, reset, escreveIR & run, 1'b0, din[15:6], instrucao);

  // ULA
  registrador #(16) A (clock, reset, escreveA & run, 1'b0, buswire, dA);
  ULA ula (controleULA, dA, buswire, dG, dULA);
  registrador #(16) G (clock, reset, escreveG & run, 1'b0, dULA, dG);

  // Decodificador para escrita no Banco de Registradores
  decodificador dec3to8 (enderecoBR, decBR);

  // Banco de Registradores
  registrador #(16) REG0 (clock, reset, decBR[0] & escreveBR & run, 1'b0, buswire, reg0);
  registrador #(16) REG1 (clock, reset, decBR[1] & escreveBR & run, 1'b0, buswire, reg1);
  registrador #(16) REG2 (clock, reset, decBR[2] & escreveBR & run, 1'b0, buswire, reg2);
  registrador #(16) REG3 (clock, reset, decBR[3] & escreveBR & run, 1'b0, buswire, reg3);
  registrador #(16) REG4 (clock, reset, decBR[4] & escreveBR & run, 1'b0, buswire, reg4);
  registrador #(16) REG5 (clock, reset, decBR[5] & escreveBR & run, 1'b0, buswire, reg5);
  registrador #(16) REG6 (clock, reset, decBR[6] & escreveBR & run, 1'b0, buswire, reg6);
  registrador #(16) PC (clock, reset, decBR[7] & escreveBR & run, incrementa_pc, buswire, pc);

  // Multiplexador para a saida do Banco de Registradores
  multiplexadorBR MUXBR(enderecoBR, reg0, reg1, reg2, reg3, reg4, reg5, reg6, pc, dBR);

  // Multiplexador do BUSWIRE
  multiplexador MUX(controleMUX, din, dBR, dG, buswire);

endmodule
