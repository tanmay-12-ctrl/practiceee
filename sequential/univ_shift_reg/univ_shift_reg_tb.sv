`timescale 1ns/1ps

module univ_shift_reg_tb;

logic clk;
logic reset;
logic [1:0] ctrl;
logic [7:0] d;
logic [7:0] q;

univ_shift_reg dut (
    .clk(clk),
    .reset(reset),
    .ctrl(ctrl),
    .d(d),
    .q(q)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, univ_shift_reg_tb);

    reset = 1;
    ctrl  = 2'b00;
    d     = 8'h00;

    #8;
    reset = 0;

    // Parallel Load
    ctrl = 2'b11;
    d    = 8'hA5;
    #10;

    // Hold
    ctrl = 2'b00;
    #20;

    // Shift Left
    ctrl = 2'b01;
    d[0] = 1'b1;
    #30;

    // Shift Right
    ctrl = 2'b10;
    d[7] = 1'b0;
    #30;

    // Parallel Load Again
    ctrl = 2'b11;
    d    = 8'h3C;
    #10;

    $finish;

end

endmodule