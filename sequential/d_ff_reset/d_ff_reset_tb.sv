`timescale 1ns/1ps

module d_ff_reset_tb;

logic clk;
logic reset;
logic d;
logic q;

d_ff_reset dut(
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
    $dumpvars(0, d_ff_reset_tb);

    reset = 1;
    d = 0;

    #8;
    reset = 0;

    #7;
    d = 1;

    #10;
    d = 0;

    #4;
    reset = 1;

    #2;
    reset = 0;

    #10;
    d = 1;

    #20;
    $finish;

end

endmodule