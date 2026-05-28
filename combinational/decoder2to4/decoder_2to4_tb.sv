`timescale 1ns/1ps

module decoder_2to4_tb;

logic en;
logic a1;
logic a0;

logic b0;
logic b1;
logic b2;
logic b3;

decoder_2to4 uut (
    .en(en),
    .a1(a1),
    .a0(a0),
    .b0(b0),
    .b1(b1),
    .b2(b2),
    .b3(b3)
);

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, decoder_2to4_tb);

    // Disabled
    en=0; a1=0; a0=0;
    #10;

    // 00 -> 0001
    en=1; a1=0; a0=0;
    #10;

    // 01 -> 0010
    en=1; a1=0; a0=1;
    #10;

    // 10 -> 0100
    en=1; a1=1; a0=0;
    #10;

    // 11 -> 1000
    en=1; a1=1; a0=1;
    #10;

    $finish;

end

endmodule