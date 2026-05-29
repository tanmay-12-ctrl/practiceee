`timescale 1ns/1ps

module d_ff_en_2seg
(
    input  logic clk,
    input  logic reset,
    input  logic en,
    input  logic d,
    output logic q
);

logic r_reg, r_next;

// Register segment
always_ff @(posedge clk, posedge reset)
begin
    if (reset)
        r_reg <= 1'b0;
    else
        r_reg <= r_next;
end

// Next-state logic segment it works like a mux if en =1 then r_next =d if not then old value if r_next
always_comb
begin
    if (en)
        r_next = d;
    else
        r_next = r_reg;
end

// Output logic
assign q = r_reg;

endmodule