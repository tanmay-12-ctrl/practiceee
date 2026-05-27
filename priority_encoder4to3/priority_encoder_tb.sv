`timescale 1ns/1ps

module priority_tb;

logic [4:1] r;
logic [2:0] y;

priority_encoder uut (
    .a(r),
    .y(y)
);

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, priority_tb);

    // No request
    r = 4'b0000;
    #10;

    // r1 active
    r = 4'b0001;
    #10;

    // r2 active
    r = 4'b0010;
    #10;

    // r3 active
    r = 4'b0100;
    #10;

    // r4 active
    r = 4'b1000;
    #10;

    // Multiple active -> r4 highest priority
    r = 4'b1111;
    #10;

    // r3 higher than r2/r1
    r = 4'b0111;
    #10;

    $finish;

end

endmodule