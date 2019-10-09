module register #(parameter length) (
  input Clock, reset, Wr,
  input [length-1:0] data,
  output reg [length-1:0] q
);

  initial
    q <= {length{1'b0}};

  always @(negedge Clock, posedge reset)
    if(reset)
      q <= {length{1'b0}};
    else if(Wr)
      q <= data;

endmodule
