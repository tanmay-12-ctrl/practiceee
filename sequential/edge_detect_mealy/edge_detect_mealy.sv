`timescale 1ns/1ps

module edge_detect_mealy (
    input  logic clk,
    input  logic reset,
    input  logic level,
    output logic tick
);

typedef enum {zero, one} state_type;

state_type state_reg, state_next;

// State register
always_ff @(posedge clk, posedge reset)
begin
    if (reset)
        state_reg <= zero;
    else
        state_reg <= state_next;
end

// Next-state logic
always_comb
begin
    state_next = state_reg;

    case (state_reg)

        zero:
            if (level)
                state_next = one;

        one:
            if (~level)
                state_next = zero;

        default:
            state_next = zero;

    endcase
end

// Mealy output logic
assign tick = (state_reg == zero) && level;

endmodule