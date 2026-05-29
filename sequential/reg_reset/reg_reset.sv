`timescale 1ns/1ps

module reg_reset
(
    input  logic       clk,
    input  logic       reset,
    input  logic [7:0] d,
    output logic [7:0] q
);

always_ff @(posedge clk, posedge reset)
begin
    if (reset)
        q <= 8'b00000000;
    else
        q <= d;
end

endmodule