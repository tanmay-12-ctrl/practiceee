`timescale 1ns/1ps

module reg_reset_tb;

logic       clk;
logic       reset;
logic [7:0] d;
logic [7:0] q;

reg_reset dut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, reg_reset_tb);

    reset = 1;
    d     = 8'b00000000;

    #8;
    reset = 0;

    // Load A5
    d = 8'b10100101;
    #10;

    // Load 3C
    d = 8'b00111100;
    #10;

    // Load F0
    d = 8'b11110000;
    #10;

    // Async reset
    reset = 1;
    #2;
    reset = 0;

    // Load 55
    d = 8'b01010101;
    #10;

    $finish;

end

endmodule