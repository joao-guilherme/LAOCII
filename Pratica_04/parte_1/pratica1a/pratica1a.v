module pratica1a (
  input [0:0] KEY,
  input [1:0] SW,

  output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7
);

  // Processor States
  localparam Invalid = 2'b00;
  localparam Exclusive = 2'b01;
  localparam Shared = 2'b10;

  // Processor Messages
  localparam Place_Read_Miss_On_Bus = 3'b001;
  localparam Place_Invalidate_On_Bus = 3'b010;
  localparam Place_Write_Miss_On_Bus = 3'b011;

  localparam Write_Back_Block = 3'b100;
  localparam Write_Back_Cache_Block = 3'b101;

  localparam Empty = 3'b000;

  // Operations
  localparam RM = 2'b00;
  localparam RH = 2'b01;
  localparam WM = 2'b10;
  localparam WH = 2'b11;

  reg [1:0] state;
  reg [2:0] msg;

  initial
    state <= 1;

  always @(posedge KEY[0])
    case(state)
      Invalid:
        case(SW)
          RM, RH:
            begin
              state <= Shared;
              msg <= Place_Read_Miss_On_Bus;
            end
          WM, WH:
            begin
              state <= Exclusive;
              msg <= Place_Write_Miss_On_Bus;
            end
        endcase

      Exclusive:
        case(SW)
          WH, RH:
            begin
              state <= Exclusive;
              msg <= Empty;
            end
          WM:
            begin
              state <= Exclusive;
              msg <= Write_Back_Cache_Block;
            end
          RM:
            begin
              state <= Shared;
              msg <= Write_Back_Block;
            end
        endcase

      Shared:
        case(SW)
          RH:
            begin
              state <= Shared;
              msg <= Empty;
            end
          RM:
            begin
              state <= Shared;
              msg <= Place_Read_Miss_On_Bus;
            end
          WH:
            begin
              state <= Exclusive;
              msg <= Place_Invalidate_On_Bus;
            end
          WM:
            begin
              state <= Exclusive;
              msg <= Place_Write_Miss_On_Bus;
            end
        endcase
    endcase

  // State Display
  decoder dec1 ({2'b00, state}, HEX6);

  // Message Display
  decoder dec2 ({1'b0, msg}, HEX4);

  assign HEX0 = 7'b1111111;
  assign HEX1 = 7'b1111111;
  assign HEX2 = 7'b1111111;
  assign HEX3 = 7'b1111111;
  assign HEX5 = 7'b1111111;
  assign HEX7 = 7'b1111111;

endmodule
