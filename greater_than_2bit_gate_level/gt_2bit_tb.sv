`timescale 1ns/1ps

module gt_2bit_tb;

logic A1, A0, B1, B0;
logic GT;

gt_2bit uut (
    .A1(A1),
    .A0(A0),
    .B1(B1),
    .B0(B0),
    .GT(GT)
);

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, gt_2bit_tb);

    // 00 > 00 = 0
    A1=0; A0=0; B1=0; B0=0;
    #10;

    // 01 > 00 = 1
    A1=0; A0=1; B1=0; B0=0;
    #10;

    // 10 > 01 = 1
    A1=1; A0=0; B1=0; B0=1;
    #10;

    // 11 > 10 = 1
    A1=1; A0=1; B1=1; B0=0;
    #10;

    // 01 > 11 = 0
    A1=0; A0=1; B1=1; B0=1;
    #10;

    // 10 > 10 = 0
    A1=1; A0=0; B1=1; B0=0;
    #10;

    $finish;

end

endmodule