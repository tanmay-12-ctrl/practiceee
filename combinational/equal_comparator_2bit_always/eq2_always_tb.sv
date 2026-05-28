`timescale 1ns/1ps

module eq2_always_tb;

logic [1:0] a;
logic [1:0] b;
logic eq;

eq2_always uut (
    .a(a),
    .b(b),
    .eq(eq)
);

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, eq2_always_tb);

    // Equal
    a = 2'b00; b = 2'b00;
    #10;

    // Not equal
    a = 2'b01; b = 2'b10;
    #10;

    // Equal
    a = 2'b11; b = 2'b11;
    #10;

    // Not equal
    a = 2'b10; b = 2'b01;
    #10;

    // Equal
    a = 2'b01; b = 2'b01;
    #10;

    $finish;

end

endmodule