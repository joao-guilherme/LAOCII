module decoderRB (
  input Clock,
  input [2:0] data,
  output reg [7:0] q
);

  always @(data)
    q <= 8'b1 << data;

endmodule
