`timescale 1ns/1ps

module univ_bin_counter_tb;

logic clk;
logic reset;
logic syn_clr;
logic load;
logic en;
logic up;

logic [7:0] d;

logic max_tick;
logic min_tick;
logic [7:0] q;

univ_bin_counter dut (
    .clk(clk),
    .reset(reset),
    .syn_clr(syn_clr),
    .load(load),
    .en(en),
    .up(up),
    .d(d),
    .max_tick(max_tick),
    .min_tick(min_tick),
    .q(q)
);

// Clock
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Stimulus
initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, univ_bin_counter_tb);

    reset   = 1;
    syn_clr = 0;
    load    = 0;
    en      = 0;
    up      = 1;
    d       = 0;

    #8;
    reset = 0;

    // Load 10
    load = 1;
    d    = 8'd10;
    #10;
    load = 0;

    // Count up
    en = 1;
    up = 1;
    #50;

    // Count down
    up = 0;
    #50;

    // Pause
    en = 0;
    #20;

    // Sync clear
    syn_clr = 1;
    #10;
    syn_clr = 0;

    #20;

    $finish;

end

endmodule