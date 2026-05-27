`timescale 1ns/1ps

module decoder_case_tb;

logic [1:0] a;
logic en;
logic [3:0] y;

decoder_case uut (
    .a(a),
    .en(en),
    .y(y)
);

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, decoder_case_tb);

    // Disabled cases
    en = 0; a = 2'b00;
    #10;

    en = 0; a = 2'b01;
    #10;

    en = 0; a = 2'b10;
    #10;

    en = 0; a = 2'b11;
    #10;

    // Enabled decoding
    en = 1; a = 2'b00;
    #10;

    en = 1; a = 2'b01;
    #10;

    en = 1; a = 2'b10;
    #10;

    en = 1; a = 2'b11;
    #10;

    $finish;

end

endmodule