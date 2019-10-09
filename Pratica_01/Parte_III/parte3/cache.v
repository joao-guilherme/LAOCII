module cache (
  input clk, wren,
  input [7:0] address, data,
  output reg valid, dirty, LRU, miss,
  output reg [7:0] q
);

  /* Disposicao dos dados na memoria
   * 23    -> Valid
   * 22    -> Dirty
   * 21:17 -> TAG
   * 16:1  -> Data
   * 0     -> LRU
   */
  reg [23:0] mem [0:7]; // 8 x 24

  // Inicializar o vetor memoria
  initial
    $readmemb("/home/joao/altera/LAOCII/Pratica_01/Parte_III/parte3/memory.mem", mem);

  integer index;
  always @(posedge clk) begin
    index = address[2:1] << 1;

    // Writing
    if(wren)
    begin
      // Check first way
      if(mem[index][23] && (address[7:3] == mem[index][21:17]))
      begin
        miss <= 1'b0;
        valid <= 1'b1;

        // Dirty
        dirty <= 1'b1;
        mem[index][22] <= 1'b1;

        // LRU
        LRU <= 1'b0;
        mem[index][0] <= 1'b0;
        mem[index+1][0] <= 1'b1;

        // Data
        q <= data;
        if(address[0])
          mem[index][16:9] <= data;
        else
          mem[index][8:1] <= data;
      end

      // Check second way
      else if(mem[index+1][23] && (address[7:3] == mem[index+1][21:17]))
      begin
        miss <= 1'b0;
        valid <= 1'b1;

        // Dirty
        dirty <= 1'b1;
        mem[index+1][22] <= 1'b1;

        // LRU
        LRU <= 1'b0;
        mem[index][0] <= 1'b1;
        mem[index+1][0] <= 1'b0;

        // Data
        q <= data;
        if(address[0])
          mem[index+1][16:9] <= data;
        else
          mem[index+1][8:1] <= data;
      end

      // Check LRU for writing
      else if(mem[index][23] && mem[index+1][23])
      begin
        q <= data;
        miss <= 1'b1;
        valid <= 1'b1;
        dirty <= 1'b0;
        LRU <= 1'b0;

        // Writing in first way
        if(mem[index][0])
        begin
          mem[index][23] <= 1'b1;             // Valid
          mem[index][22] <= 1'b0;             // Dirty
          mem[index][21:17] <= address[7:3];  // TAG

          // LRU
          mem[index][0] <= 1'b0;
          mem[index+1][0] <= 1'b1;

          // Data
          if(address[0])
          begin
            mem[index][8:1] <= 8'b11111111;
            mem[index][16:9] <= data;
          end
          else
          begin
            mem[index][8:1] <= data;
            mem[index][16:9] <= 8'b11111111;
          end
        end

        // Writing in second way
        else
        begin
          mem[index+1][23] <= 1'b1;             // Valid
          mem[index+1][22] <= 1'b0;             // Dirty
          mem[index+1][21:17] <= address[7:3];  // TAG

          // LRU
          mem[index][0] <= 1'b1;
          mem[index+1][0] <= 1'b0;

          // Data
          if(address[0])
          begin
            mem[index+1][8:1] <= 8'b11111111;
            mem[index+1][16:9] <= data;
          end
          else
          begin
            mem[index+1][8:1] <= data;
            mem[index+1][16:9] <= 8'b11111111;
          end
        end
      end

      // Go to Memory
      else
      begin
        miss = 1'b1;
        valid = 1'b0;
        dirty = 1'b0;
        LRU = 1'b0;
        q <= 8'b11111111;
      end
    end

    // Reading
    else
    begin
      // First Way
      if(mem[index][23] && (address[7:3] === mem[index][21:17]))
      begin
        miss <= 1'b0;
        valid <= 1'b1;
        LRU <= mem[index][0];
        dirty <= mem[index][22];
        q <= address[0] ? mem[index][16:9] : mem[index][8:1];
      end

      // Second Way
      else if(mem[index+1][23] && (address[7:3] === mem[index+1][21:17]))
      begin
        miss <= 1'b0;
        valid <= 1'b1;
        LRU <= mem[index+1][0];
        dirty <= mem[index+1][22];
        q <= address[0] ? mem[index+1][16:9] : mem[index+1][8:1];
      end

      // Invalid or not found
      else begin
        miss <= 1'b1;
        valid <= 1'b0;
        LRU <= 1'b0;
        dirty <= 1'b0;
        q <= 8'b11111111;
      end
    end
   end
endmodule
