`timescale 1ns/1ps

module sign_mag_add_tb;

logic [3:0] a,b;
logic [3:0] sum;

sign_mag_add uut(
    .a(a),
    .b(b),
    .sum(sum)
);

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, sign_mag_add_tb);

    // +3 + +2 = +5
    a = 4'b0011;
    b = 4'b0010;
    #10;

    // -3 + -2 = -5
    a = 4'b1011;
    b = 4'b1010;
    #10;

    // +5 + -2 = +3
    a = 4'b0101;
    b = 4'b1010;
    #10;

    // -5 + +2 = -3
    a = 4'b1101;
    b = 4'b0010;
    #10;

    // +4 + -4 = 0
    a = 4'b0100;
    b = 4'b1100;
    #10;

    $finish;

end

endmodule