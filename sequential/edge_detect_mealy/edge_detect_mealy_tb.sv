`timescale 1ns/1ps

module edge_detect_mealy_tb;

logic clk;
logic reset;
logic level;
logic tick;

edge_detect_mealy dut (
    .clk(clk),
    .reset(reset),
    .level(level),
    .tick(tick)
);

// Clock
initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Stimulus
initial
begin
    $dumpfile("dump.vcd");
    $dumpvars(0, edge_detect_mealy_tb);

    reset = 1;
    level = 0;

    #12;
    reset = 0;

    #7;
    level = 1;

    #20;
    level = 0;

    #15;
    level = 1;

    #20;
    level = 0;

    #20;
    $finish;
end

endmodule