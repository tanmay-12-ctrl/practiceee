`timescale 1ns/1ps

module delayed_detection_debouncer_fsm_tb;

logic clk;
logic reset;
logic sw;
logic db;

delayed_detection_debouncer_fsm dut
(
    .clk(clk),
    .reset(reset),
    .sw(sw),
    .db(db)
);

// clock generation
initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end

// stimulus
initial
begin

    $dumpfile("dump.vcd");
    $dumpvars(0, delayed_detection_debouncer_fsm_tb);

    reset = 1;
    sw = 0;

    #20;
    reset = 0;

    //--------------------------------
    // Press with bounce
    //--------------------------------

    #20 sw = 1;
    #10 sw = 0;
    #10 sw = 1;
    #10 sw = 0;
    #10 sw = 1;

    //--------------------------------
    // Remain pressed
    //--------------------------------

    #300;

    //--------------------------------
    // Release with bounce
    //--------------------------------

    sw = 0;
    #10 sw = 1;
    #10 sw = 0;
    #10 sw = 1;
    #10 sw = 0;

    //--------------------------------
    // Finish
    //--------------------------------

    #300;

    $finish;

end

endmodule