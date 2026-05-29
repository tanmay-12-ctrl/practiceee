`timescale 1ns/1ps

module free_run_shift_reg_tb;

logic clk;
logic reset;
logic s_in;
logic s_out;

free_run_shift_reg dut (
    .clk(clk),
    .reset(reset),
    .s_in(s_in),
    .s_out(s_out)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, free_run_shift_reg_tb);

    reset = 1;
    s_in  = 0;

    #8;
    reset = 0;

    // Shift pattern: 1 0 1 1 0 1 0 1

    #10 s_in = 1;
    #10 s_in = 0;
    #10 s_in = 1;
    #10 s_in = 1;
    #10 s_in = 0;
    #10 s_in = 1;
    #10 s_in = 0;
    #10 s_in = 1;

    #40;

    $finish;
end
endmodule