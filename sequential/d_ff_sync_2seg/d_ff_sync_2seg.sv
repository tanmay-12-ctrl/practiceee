`timescale 1ns/1ps

module d_ff_sync_2seg
(
    input  logic clk,
    input  logic sync_clr,
    input  logic d,
    output logic q
);

logic r_reg, r_next;

// D FF
always_ff @(posedge clk)
    r_reg <= r_next;

// next-state logic
always_comb
begin
    if (sync_clr)
        r_next = 1'b0;
    else
        r_next = d;
end

// output logic
assign q = r_reg;

endmodule