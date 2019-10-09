module control (
  input Clock, run, reset,
  input [9:0] data,
  output reg done, incr_pc, WrRegisterBank, WrIR, WrW, WrDataOut, WrAddressOut, WrA, WrG,
  output reg [2:0] multControl, addrRegisterBank, aluControl
);

  localparam PC = 7;

  // Multiplex Variables
  localparam DIN = 1, RB = 2, ALU = 4;

  // Instructions Opcodes
  localparam ADD = 0, SUB = 1, AND = 2, SLL = 3, SRL = 4, SLT = 5,
             MVNZ = 6, MV = 7, MVI = 8, SD = 9, LD = 10;

/**
 * Control Logic Description
 *
 * ZZZZXXXYYY
 * Z[4] = Opcode
 * X[3] = Rx
 * Y[3] = Ry
 *
 * ADD:  Rx = Rx + Ry           Opcode => 0000
 * SUB:  Rx = Rx - Ry           Opcode => 0001
 * AND:  Rx = Rx & Ry           Opcode => 0010
 * SLL:  Rx = Rx << Ry          Opcode => 0011
 * SRL:  Rx = Rx >> Ry          Opcode => 0100
 * SLT:  Rx = Rx < Ry           Opcode => 0101
 * MVNZ: Rx = G !== 0 ? Ry : Rx Opcode => 0110
 * MV:   Rx = Ry                Opcode => 0111
 * MVI:  Rx = #D                Opcode => 1000
 * SD:   MEM[Rx] = Ry           Opcode => 1001
 * LD:   Rx = MEM[Ry]           Opcode => 1010
 */

  wire [2:0] Rx, Ry;
  assign Rx = data[5:3];
  assign Ry = data[2:0];

  reg [2:0] step;

  initial
    step = 3'b0;

  always @(posedge Clock, posedge reset)
    if(reset)
      step = 3'b0;
    else if(done)
      step = 3'b0;
    else if(run)
      step = step + 3'b1;

  always @(step) begin
    // Disabling all controls
    WrW = 1'b0;
    WrA = 1'b0;
    WrG = 1'b0;
    WrIR = 1'b0;
    done = 1'b0;
    incr_pc = 1'b0;
    WrDataOut = 1'b0;
    WrAddressOut = 1'b0;
    WrRegisterBank = 1'b0;

    multControl = RB;
    addrRegisterBank = Rx;
    aluControl = ADD;

    case(step)
      3'b000:
        begin
          WrIR = 1'b1;
          incr_pc = 1'b1;
        end
      3'b001:
        case(data[9:6])
         ADD, SUB, AND, SLL, SRL, SLT, MVNZ, MV:
            begin
              multControl = RB;
              addrRegisterBank = Rx;
              WrA = 1'b1;
            end
          MVI:
            begin
              incr_pc = 1'b1;
              multControl = RB;
              addrRegisterBank = PC;
              WrAddressOut = 1'b1;
            end
          LD:
            begin
              addrRegisterBank = Ry;
              multControl = RB;
              WrAddressOut = 1'b1;
            end
          SD:
            begin
              addrRegisterBank = Ry;
              multControl = RB;
              WrDataOut = 1'b1;
            end
        endcase
      3'b010:
        case(data[9:6])
          ADD, SUB, AND, SLL, SRL, SLT, MVNZ, MV:
            begin
              addrRegisterBank = Ry;
              aluControl = data[8:6];  // Value corresponding to ALU
              WrG = 1'b1;
            end
          MVI, LD:
            begin
              multControl = DIN;
              addrRegisterBank = Rx;
              WrRegisterBank = 1'b1;
            end
          SD:
            begin
              addrRegisterBank = Rx;
              multControl = RB;
              WrAddressOut = 1'b1;
              WrW = 1'b1;
            end
        endcase
      3'b011:
        case(data[9:6])
          ADD, SUB, AND, SLL, SRL, SLT, MVNZ, MV:
            begin
              multControl = ALU;
              addrRegisterBank = Rx;
              WrRegisterBank = 1'b1;
            end
        endcase
      3'b100:
        begin
          done = 1'b1;
          multControl = RB;
          WrAddressOut = 1'b1;
          addrRegisterBank = PC;
        end
    endcase
    end

endmodule
