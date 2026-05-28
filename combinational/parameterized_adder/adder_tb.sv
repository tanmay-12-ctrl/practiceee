`timescale 1ns/1ps

module adder_tb;

logic [3:0] a4,b4,sum4;
logic c4;

logic [7:0] a8,b8,sum8;
logic c8;

adder_top uut (

    .a4(a4),
    .b4(b4),
    .sum4(sum4),
    .c4(c4),

    .a8(a8),
    .b8(b8),
    .sum8(sum8),
    .c8(c8)

);

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, adder_tb);

    // 4-bit test
    a4 = 4'b0011;
    b4 = 4'b0101;

    // 8-bit test
    a8 = 8'b00001111;
    b8 = 8'b00000001;

    #10;

    // carry generation

    a4 = 4'b1111;
    b4 = 4'b0001;

    a8 = 8'b11111111;
    b8 = 8'b00000001;

    #10;

    $finish;

end

endmodule