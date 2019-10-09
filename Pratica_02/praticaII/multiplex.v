module multiplex (
  input [2:0] control,
  input [15:0] A, B, C,
  output reg [15:0] q
);

  always @*
    case(control)
      3'b001: q <= A;
      3'b010: q <= B;
      3'b100: q <= C;
      default: q <= 16'b0;
    endcase

endmodule
