module decoder (
  input [3:0] data,
  output reg [0:6] display
);

  always @(*)
    case(data)
      00: display = 7'b0000001;
      01: display = 7'b1001111;
      02: display = 7'b0010010;
      03: display = 7'b0000110;
      04: display = 7'b1001100;
      05: display = 7'b0100100;
      06: display = 7'b0100000;
      07: display = 7'b0001111;
      08: display = 7'b0000000;
      09: display = 7'b0001100;
      10: display = 7'b0001000;      // A
      11: display = 7'b1100000;      // b
      12: display = 7'b0110001;      // C
      13: display = 7'b1000010;      // d
      14: display = 7'b0110000;      // E
      15: display = 7'b0111000;      // F
    endcase

endmodule