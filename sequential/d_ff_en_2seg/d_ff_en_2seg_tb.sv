`timescale 1ns/1ps

module d_ff_en_2seg_tb;

logic clk;
logic reset;
logic en;
logic d;
logic q;

d_ff_en_2seg dut (
    .clk(clk),
    .reset(reset),
    .en(en),
    .d(d),
    .q(q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, d_ff_en_2seg_tb);

    // Reset
    reset = 1;
    en    = 0;
    d     = 0;

    #8;
    reset = 0;

    // Enable = 1, capture d=1
    #2;
    en = 1;
    d  = 1;

    // Enable = 0, q should hold
    #10;
    en = 0;
    d  = 0;

    // Enable = 1, capture d=0
    #10;
    en = 1;
    d  = 0;

    // Enable = 1, capture d=1
    #10;
    d = 1;

    // Enable = 0, q should hold
    #10;
    en = 0;
    d  = 0;

    #20;
    $finish;

end

endmodule