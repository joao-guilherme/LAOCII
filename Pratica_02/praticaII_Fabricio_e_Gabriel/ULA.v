module ULA (controle, opA, opB, opG, dout);

  input [2:0] controle;
  input [15:0] opA, opB, opG;
  output reg [15:0] dout;

  always @(*)
    case(controle)
      0: dout <= opA + opB;               // ADD
      1: dout <= opA - opB;               // SUB
      2: dout <= opA & opB;               // AND
      3: dout <= opA << opB;              // SLL
      4: dout <= opA >> opB;              // SRL
      5: dout <= opA < opB;               // SLT
      6: dout <= opG === 0 ? opA : opB;   // MVNZ
      7: dout <= opB;
      default: dout <= 16'b0;
    endcase

endmodule
