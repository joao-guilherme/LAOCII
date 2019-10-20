module processor (
  input Clock, run, reset,
  input [15:0] data_in,
  output Wr, done,
  output [15:0] addr_out, data_out, outR0, outR1, outR2, outR3, outPC
);

  wire incr_pc, WrRegisterBank, WrIR, WrW, WrDataOut, WrAddressOut, WrA, WrG;
  wire [2:0] multControl, addrRegisterBank, aluControl;
  wire [15:0] outRegisterBank, outIR, outALU, outA, outG, outMUX;

  /**
  * All modules have write validation logic based on the "run" parameter.
  * The "reset" input will clean up RegisterBank values and the step counter inside de controller.
  */

  control ctrl (
    .Clock(Clock),
    .run(run),
    .reset(reset),
    .data(outIR),
    .done(done),
    .incr_pc(incr_pc),
    .WrRegisterBank(WrRegisterBank),
    .WrIR(WrIR),
    .WrW(WrW),
    .WrDataOut(WrDataOut),
    .WrAddressOut(WrAddressOut),
    .WrA(WrA),
    .WrG(WrG),
    .multControl(multControl),
    .addrRegisterBank(addrRegisterBank),
    .aluControl(aluControl)
  );

  multiplex MUX (
    .control(multControl),
    .A(data_in),
    .B(outRegisterBank),
    .C(outG),
    .q(outMUX)
  );

  RB RegisterBank (
    .Clock(Clock),
    .Wr(WrRegisterBank & run),
    .incr_pc(incr_pc & run),
    .reset(reset),
    .addr(addrRegisterBank),
    .data(outMUX),
    .q(outRegisterBank),
    .outR0(outR0),
    .outR1(outR1),
    .outR2(outR2),
    .outR3(outR3),
    .outPC(outPC)
  );

  register #(10) IR (
    .Clock(Clock),
    .reset(reset),
    .Wr(WrIR & run),
    .data(data_in[15:6]),
    .q(outIR)
  );

  register #(1) W (
    .Clock(Clock),
    .reset(reset),
    .Wr(WrW & run),
    .data(1'b1),
    .q(Wr)
  );

  register #(16) DOUT (
    .Clock(Clock),
    .reset(reset),
    .Wr(WrDataOut & run),
    .data(outMUX),
    .q(data_out)
  );

  register #(16) ADDR (
    .Clock(Clock),
    .reset(reset),
    .Wr(WrAddressOut & run),
    .data(outMUX),
    .q(addr_out)
  );

  register #(16) A (
    .Clock(Clock),
    .reset(reset),
    .Wr(WrA & run),
    .data(outMUX),
    .q(outA)
  );

  ALU Arithmetic (
    .control(aluControl),
    .Rx(outA),
    .Ry(outMUX),
    .G(outG),
    .q(outALU)
  );

  register #(16) G (
    .Clock(Clock),
    .reset(reset),
    .Wr(WrG & run),
    .data(outALU),
    .q(outG)
  );

endmodule
