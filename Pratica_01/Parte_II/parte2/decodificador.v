module decodificador (
  input [3:0] data,
  output reg[0:6] display
);

  always @(data) begin
    display[0] <= (~data[3] && ~data[2] && ~data[1] && data[0]) || (data[2] && ~data[1] && ~data[0]) || (data[3] && ~data[2] && data[1] && data[0]) || (data[3] && data[2] && ~data[1]);
    display[1] <= (~data[3] && data[2] && ~data[1] && data[0]) || (data[2] && data[1] && ~data[0]) || (data[3] && data[1] && data[0]) || (data[3] && data[2] && ~data[0]);
    display[2] <= (~data[3] && ~data[2] && data[1] && ~data[0]) || (data[3] && data[2] && ~data[0]) || (data[3] && data[2] && data[1]);
    display[3] <= (~data[2] && ~data[1] && data[0]) || (~data[3] && data[2] && ~data[1] && ~data[0]) || (data[2] && data[1] && data[0]) || (data[3] && ~data[2] && data[1] && ~data[0]);
    display[4] <= (~data[3] && data[0]) || (~data[2] && ~data[1] && data[0]) || (~data[3] && data[2] && ~data[1]);
    display[5] <= (~data[3] && ~data[2] && data[0]) || (~data[3] && ~data[2] && data[1]) || (~data[3] && data[1] && data[0]) || (data[3] && data[2] && ~data[1]);
    display[6] <= (~data[3] && ~data[2] && ~data[1]) || (~data[3] && data[2] && data[1] && data[0]);
  end

endmodule