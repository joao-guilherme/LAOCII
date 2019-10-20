module controle (clock, run, reset, instrucao, done, escreveW, escreveA, escreveG, escreveADDR, escreveDOUT, escreveIR,
                 escreveBR, incrementa_pc, controleMUX, controleULA, enderecoBR);

  input clock, run, reset;
  input [9:0] instrucao;

  output reg done, escreveW, escreveA, escreveG, escreveADDR, escreveDOUT, escreveIR, escreveBR, incrementa_pc;
  output reg [1:0] controleMUX;
  output reg [2:0] enderecoBR, controleULA;

  wire [2:0] Rx, Ry;

  reg [2:0] step;

  // Inicializando o step com 0
  initial
    step <= 0;

  // Definicao das instrucoes implementadas
  // ADD = 0
  // SUB = 1
  // AND = 2
  // SLT = 3
  // SLL = 4
  // SRL = 5
  // SD = 6
  // LD = 7
  // MV = 8
  // MVI = 9
  // MVNZ = 10

  // Variaveis para facilitarem o codigo do controle.
  assign Rx = instrucao[5:3];
  assign Ry = instrucao[2:0];

  // O modulo upcount foi movido para dentro do processador
  always @(negedge clock, posedge reset)
    if(reset)
      step <= 0;
    else if(step == 4)
      step <= 0;
    else if(run)
      step <= step + 1;

  always @(step) begin
    // Resetando as variaveis de controle.
    done = 0;
    escreveW = 0;
    escreveA = 0;
    escreveG = 0;
    escreveADDR = 0;
    escreveDOUT = 0;
    escreveIR = 0;
    escreveBR = 0;
    incrementa_pc = 0;

    case(step)
      // Passo 0
      0: begin
        done = 0;
        escreveIR = 1;
        incrementa_pc = 1;
      end

      // Passo 1
      1: begin
        case(instrucao[9:6])
          0, 1, 2, 3, 4, 5: begin // Operacoes da ULA
            enderecoBR = Rx;
            controleMUX = 1;
            escreveA = 1;
          end
          6: begin // SD | MEM[Ry] = Rx;
            enderecoBR = Ry;
            controleMUX = 1;
            escreveADDR = 1;
          end
          7: begin // LD | Rx = MEM[Ry];
            enderecoBR = Ry;
            controleMUX = 1;
            escreveADDR = 1;
          end
          8: begin // MV | Rx = Ry;
            enderecoBR = Ry;
            controleMUX = 1;
            controleULA = 7;
            escreveG = 1;
          end
          9: begin // MVI | Rx = I;
            enderecoBR = 7;
            controleMUX = 1;
            escreveADDR = 1;
            incrementa_pc = 1;
          end
          10: begin // MVNZ | Rx = G == 0 ? Rx : Ry
            enderecoBR = Rx;
            controleMUX = 1;
            escreveA = 1;
          end
        endcase
      end

      // Passo 2
      2: begin
        case(instrucao[9:6])
          0: begin // ADD | Rx = Rx + Ry
            enderecoBR = Ry;
            controleULA = 0;
            controleMUX = 1;
            escreveG = 1;
          end
          1: begin // SUB | Rx = Rx - Ry
            enderecoBR = Ry;
            controleULA = 1;
            controleMUX = 1;
            escreveG = 1;
          end
          2: begin // AND | Rx = Rx & Ry
            enderecoBR = Ry;
            controleULA = 2;
            controleMUX = 1;
            escreveG = 1;
          end
          3: begin // SLT | Rx = Rx < Ry
            enderecoBR = Ry;
            controleULA = 5;
            controleMUX = 1;
            escreveG = 1;

          end
          4: begin // SLL | Rx = Rx << Ry
            enderecoBR = Ry;
            controleULA = 3;
            controleMUX = 1;
            escreveG = 1;
          end
          5: begin // SRL | Rx = Rx >> Ry
            enderecoBR = Ry;
            controleULA = 4;
            controleMUX = 1;
            escreveG = 1;
          end
          6: begin // SD | MEM[Ry] = Rx;
            enderecoBR = Rx;
            controleMUX = 1;
            escreveDOUT = 1;
            escreveW = 1;
          end
          7: begin // LD | Rx = MEM[Ry];
            controleMUX = 0;
            enderecoBR = Rx;
            escreveBR = 1;
          end
          8: begin // MV | Rx = Ry;
            controleMUX = 2;
            enderecoBR = Rx;
            escreveBR = 1;
          end
          9: begin // MVI | Rx = I;
            controleMUX = 0;
            enderecoBR = Rx;
            escreveBR = 1;
          end
          10: begin // MVNZ | Rx = G == 0 ? Rx : Ry
            enderecoBR = Ry;
            controleULA = 6;
            controleMUX = 1;
            escreveG = 1;
          end
        endcase
      end

      // Passo 3
      3: begin
        case(instrucao[9:6])
          0, 1, 2, 3, 4, 5, 8, 10: begin // Operacoes da ULA
            enderecoBR = Rx;
            controleMUX = 2;
            escreveBR = 1;
          end
        endcase
      end

      // Passo 4 (todas as instrucoes gastam a mesma quantidade de ciclos)
      4: begin
        done = 1;
        enderecoBR = 7;
        controleMUX = 1;
        escreveADDR = 1;
      end

    endcase
  end


endmodule
