module parte3 (
  input [17:0] SW,
  output [8:5] LEDG,
  output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7
);

  wire [7:0] cache_data_out;

  cache L1 (
    .clk(SW[17]),
    .wren(SW[16]),
    .address(SW[15:8]),
    .data(SW[7:0]),
    .valid(LEDG[7]),
    .dirty(LEDG[6]),
    .LRU(LEDG[5]),
    .miss(LEDG[8]),
    .q(cache_data_out)
  );

  // Exibicao do Endereco
  decoder address1 (.data(SW[15:12]), .display(HEX7[0:6]));
  decoder address0 (.data(SW[11:8]), .display(HEX6[0:6]));

  // Exibicao do Dado a ser escrito
  decoder data1 (.data(SW[7:4]), .display(HEX5[0:6]));
  decoder data0 (.data(SW[3:0]), .display(HEX4[0:6]));
  
  // Exibicao do Dado Lido
  decoder data_out1(.data(cache_data_out[7:4]), .display(HEX3[0:6]));
  decoder data_out0(.data(cache_data_out[3:0]), .display(HEX2[0:6]));

  // Disativando o display 0 e 1
  assign HEX0 = {7{1'b1}};
  assign HEX1 = {7{1'b1}};

endmodule
