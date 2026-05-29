`timescale 1ns/1ps

module univ_shift_reg
#(
    parameter N = 8
)
(
    input  logic clk,
    input  logic reset,
    input  logic [1:0] ctrl,
    input  logic [N-1:0] d,
    output logic [N-1:0] q
);

logic [N-1:0] r_reg, r_next;

// Register logic 
always_ff @(posedge clk, posedge reset)
begin
    if (reset)
        r_reg <= 0;
    else
        r_reg <= r_next;
end

// Next-state logic
always_comb
begin
    case(ctrl)

        2'b00:
            r_next = r_reg;                    // Hold

        2'b01:
            r_next = {r_reg[N-2:0], d[0]};    // Shift Left

        2'b10:
            r_next = {d[N-1], r_reg[N-1:1]};  // Shift Right

        default:
            r_next = d;                        // Parallel Load

    endcase
end

// Output logic
assign q = r_reg;

endmodule