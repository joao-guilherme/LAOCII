module pratica1b (
  input [0:0] KEY,
  input [1:0] SW,

  output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7
);

  // Processor States
  localparam Invalid = 2'b00;
  localparam Exclusive = 2'b01;
  localparam Shared = 2'b10;

  // Processor Messages
  localparam Empty = 1'b0;
  localparam Write_Back_Block = 1'b1;

  // Operations
  localparam RM = 2'b00;
  localparam Invalidate = 2'b01;
  localparam WM = 2'b10;

  reg [1:0] state;
  reg msg;

  initial
    state <= 2;

  always @(posedge KEY[0])
    case(state)
      Invalid:
        begin
          state <= Invalid;
          msg <= Empty;
        end

      Exclusive:
        case(SW)
          WM:
            begin
              state <= Invalid;
              msg <= Write_Back_Block;
            end
          RM:
            begin
              state <= Shared;
              msg <= Write_Back_Block;
            end
          default:
            begin
              state <= Exclusive;
              msg <= Empty;
            end
        endcase

      Shared:
        case(SW)
          WM, Invalidate:
            begin
              state <= Invalid;
              msg <= Empty;
            end
          default:
            begin
              state <= Shared;
              msg <= Empty;
            end
        endcase
    endcase

  // State Display
  decoder dec1 ({2'b00, state}, HEX6);

  // Message Display
  decoder dec2 ({3'b0, msg}, HEX4);

  assign HEX0 = 7'b1111111;
  assign HEX1 = 7'b1111111;
  assign HEX2 = 7'b1111111;
  assign HEX3 = 7'b1111111;
  assign HEX5 = 7'b1111111;
  assign HEX7 = 7'b1111111;

endmodule
