`timescale 1ns/1ps

module d_ff_tb;
logic clk;
logic q;
logic d;

d_ff dut(
    .clk(clk),
    .q(q),
    .d(d)

);
//clock generation 

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end
initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0,d_ff_tb);
    d=0;

    #7
    d=1;
     
    #10;
    d=0;
    #10;
    d=1;
    #10;
    d=0;
    #20;
    $finish;
end




endmodule