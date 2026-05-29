`timescale 1ns/1ps

module mod_m_counter
#(
    parameter M = 10
)
(
    input  logic clk,
    input  logic reset,
    output logic max_tick,
    output logic [$clog2(M)-1:0] q
);

localparam N = $clog2(M);

logic [N-1:0] r_reg;
logic [N-1:0] r_next;

// Register
always_ff @(posedge clk, posedge reset)
begin
    if(reset)
        r_reg <= 0;
    else
        r_reg <= r_next;
end

// Next-state logic
assign r_next =
       (r_reg == (M-1))
       ? 0
       : r_reg + 1;

// Output logic
assign q = r_reg;

assign max_tick =
       (r_reg == (M-1))
       ? 1'b1
       : 1'b0;

endmodule