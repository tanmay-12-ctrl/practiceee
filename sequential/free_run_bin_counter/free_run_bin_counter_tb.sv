`timescale 1ns/1ps

module free_run_bin_counter_tb;

logic clk;
logic reset;
logic max_tick;
logic [7:0] q;

free_run_bin_counter dut (
    .clk(clk),
    .reset(reset),
    .max_tick(max_tick),
    .q(q)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, free_run_bin_counter_tb);

    reset = 1;

    #8;
    reset = 0;

    #300;

    $finish;

end

endmodule