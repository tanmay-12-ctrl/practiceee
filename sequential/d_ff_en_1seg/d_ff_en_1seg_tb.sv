`timescale 1ns/1ps

module d_ff_en_1seg_tb;

logic clk;
logic reset;
logic en;
logic d;
logic q;

d_ff_en_1seg dut (
    .clk(clk),
    .reset(reset),
    .en(en),
    .d(d),
    .q(q)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, d_ff_en_1seg_tb);

    reset = 1;
    en    = 0;
    d     = 0;

    #8;
    reset = 0;

    #2;
    en = 1;
    d  = 1;

    #10;
    en = 0;
    d  = 0;

    #10;
    en = 1;
    d  = 0;

    #10;
    d = 1;

    #10;
    en = 0;
    d  = 0;

    #20;
    $finish;

end

endmodule