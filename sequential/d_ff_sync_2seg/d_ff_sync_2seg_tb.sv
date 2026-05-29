`timescale 1ns/1ps

module d_ff_sync_2seg_tb;

logic clk;
logic sync_clr;
logic d;
logic q;

d_ff_sync_2seg dut (
    .clk(clk),
    .sync_clr(sync_clr),
    .d(d),
    .q(q)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, d_ff_sync_2seg_tb);

    sync_clr = 0;
    d = 0;

    // load 1
    #7;
    d = 1;

    // synchronous clear
    #8;
    sync_clr = 1;

    #10;
    sync_clr = 0;

    // load 1 again
    #10;
    d = 1;

    #20;
    $finish;

end

endmodule