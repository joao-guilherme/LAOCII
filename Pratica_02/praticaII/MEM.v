module MEM #(parameter FILE) (
  input Clock, Wr,
  input [15:0] addr, data,
  output [15:0] q
);

  reg [15:0] memory [0:31];  // 32 x 16

  // Memory Inicialization File
  initial
    $readmemb(FILE, memory);

  always @(negedge Clock)
    if(Wr)
      memory[addr] <= data;

  // Always read
  assign q = memory[addr];

endmodule
