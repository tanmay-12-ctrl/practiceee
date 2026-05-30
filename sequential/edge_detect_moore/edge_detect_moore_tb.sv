`timescale 1ns/1ps

module edge_detect_moore_tb;

logic clk;
logic reset;
logic level;
logic tick;

edge_detect_moore dut (
    .clk(clk),
    .reset(reset),
    .level(level),
    .tick(tick)
);

// Clock generation
initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Stimulus
initial
begin
    $dumpfile("dump.vcd");
    $dumpvars(0, edge_detect_moore_tb);

    reset = 1;
    level = 0;

    #12;
    reset = 0;

    #10;
    level = 1;

    #30;
    level = 0;

    #20;
    level = 1;

    #20;
    level = 0;

    #20;
    $finish;
end

endmodule