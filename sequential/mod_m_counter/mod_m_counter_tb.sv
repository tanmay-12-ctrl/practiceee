`timescale 1ns/1ps

module mod_m_counter_tb;

logic clk;
logic reset;
logic max_tick;
logic [3:0] q;

mod_m_counter dut (
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
    $dumpvars(0, mod_m_counter_tb);

    reset = 1;

    #8;
    reset = 0;

    #150;

    $finish;

end

endmodule