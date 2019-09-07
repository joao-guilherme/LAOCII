module parte2(
  input [17:0] SW,
  output [17:0] LEDR,
  output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7
);

wire [7:0] data_out;

// Utilizacao do modulo de memoria RAM da biblioteca LPM
ramlpm mem (.clock(SW[17]), .wren(SW[16]), .address(SW[13:9]), .data(SW[7:0]), .q(data_out));

// Exibicao do enderco a ser lido ou escrito
decodificador decimal_address (.data(SW[13]), .display(HEX7[0:6]));
decodificador unit_address (.data(SW[12:9]), .display(HEX6[0:6]));

// Exibicao dos dados a serem escritos, parte decimal e parte unitaria
decodificador decimal_data_in (.data(SW[7:4]), .display(HEX5[0:6]));
decodificador unit_data_in (.data(SW[3:0]), .display(HEX4[0:6]));

// Exibicao dos dados lidos, parte decimal e parte unitaria
decodificador decimal_data_out (.data(data_out[7:4]), .display(HEX1[0:6]));
decodificador unit_data_out (.data(data_out[3:0]), .display(HEX0[0:6]));

// Desativando o display de 7-segmentos HEX2 e HEX3
assign HEX2 = {7{1'b1}};
assign HEX3 = {7{1'b1}};

// Realizando o mapeamento dos LEDs para facilitar
// na identificacao durante a pratica.

// Clock
assign LEDR[17] = 1;

// Write Enable
assign LEDR[16] = 1;

// Address
assign LEDR[13] = 1;
assign LEDR[12] = 1;
assign LEDR[11] = 1;
assign LEDR[10] = 1;
assign LEDR[9] = 1;

// Data
assign LEDR[7] = 1;
assign LEDR[6] = 1;
assign LEDR[5] = 1;
assign LEDR[4] = 1;
assign LEDR[3] = 1;
assign LEDR[2] = 1;
assign LEDR[1] = 1;
assign LEDR[0] = 1;

endmodule
