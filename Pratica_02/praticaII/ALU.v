module ALU (
  input [2:0] control,
  input [15:0] Rx, Ry, G,
  output reg [15:0] q
);

  always @*
    case(control)
      3'b000: q <= Rx + Ry;
      3'b001: q <= Rx - Ry;
      3'b010: q <= Rx & Ry;
      3'b011: q <= Rx << Ry;
      3'b100: q <= Rx >> Ry;
      3'b101: q <= Rx < Ry;
      3'b110: q <= G !== 0 ? Ry : Rx;
      3'b111: q <= Ry;
      default: q <= 16'b0;
    endcase

endmodule
