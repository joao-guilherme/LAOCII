module displays (din, hex);

  input [3:0] din;
  output reg [0:6] hex;

  always @(*)
    case(din)
      00: hex <= 7'b0000001;
      01: hex <= 7'b1001111;
      02: hex <= 7'b0010010;
      03: hex <= 7'b0000110;
      04: hex <= 7'b1001100;
      05: hex <= 7'b0100100;
      06: hex <= 7'b0100000;
      07: hex <= 7'b0001111;
      08: hex <= 7'b0000000;
      09: hex <= 7'b0001100;
      10: hex <= 7'b0001000;
      11: hex <= 7'b1100000;
      12: hex <= 7'b0110001;
      13: hex <= 7'b1000010;
      14: hex <= 7'b0110000;
      15: hex <= 7'b0111000;
      default: hex <= 7'b0;
    endcase

endmodule
