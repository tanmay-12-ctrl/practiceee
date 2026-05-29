`timescale 1ns/1ps

module d_ff_reset_sync_tb;

logic clk;
logic reset;
logic syn_clr;
logic d;
logic q;

d_ff_reset_sync dut (
    .clk(clk),
    .reset(reset),
    .syn_clr(syn_clr),
    .d(d),
    .q(q)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, d_ff_reset_sync_tb);

    reset   = 1;
    syn_clr = 0;
    d       = 0;

    #8;
    reset = 0;

    // load 1
    #7;
    d = 1;

    // synchronous clear
    #8;
    syn_clr = 1;

    #10;
    syn_clr = 0;

    // load again
    #10;
    d = 1;

    // asynchronous reset
    #4;
    reset = 1;

    #2;
    reset = 0;

    #20;
    $finish;

end

endmodule