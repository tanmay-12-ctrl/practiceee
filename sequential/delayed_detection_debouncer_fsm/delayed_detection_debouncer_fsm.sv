`timescale 1ns/1ps

module delayed_detection_debouncer_fsm
(
    input  logic clk,
    input  logic reset,
    input  logic sw,
    output logic db
);

localparam N = 4;

// FSM states
typedef enum
{
    zero,
    wait1_1,
    wait1_2,
    wait1_3,
    one,
    wait0_1,
    wait0_2,
    wait0_3
} state_type;

state_type state_reg, state_next;

// timer signals
logic [N-1:0] q_reg, q_next;
logic m_tick;

//====================================================
// Timer
//====================================================

always_ff @(posedge clk, posedge reset)
begin
    if(reset)
        q_reg <= '0;
    else
        q_reg <= q_next;
end

assign q_next = q_reg + 1'b1;

// generate tick when counter reaches max value
assign m_tick = (q_reg == {N{1'b1}});

//====================================================
// FSM State Register
//====================================================

always_ff @(posedge clk, posedge reset)
begin
    if(reset)
        state_reg <= zero;
    else
        state_reg <= state_next;
end

//====================================================
// FSM Next-State Logic + Output Logic
//====================================================

always_comb
begin

    state_next = state_reg;
    db = 1'b0;

    case(state_reg)

        //--------------------------------
        // Stable LOW state
        //--------------------------------
        zero:
        begin
            if(sw)
                state_next = wait1_1;
        end

        //--------------------------------
        // Verify HIGH for 3 ticks
        //--------------------------------
        wait1_1:
        begin
            if(~sw)
                state_next = zero;
            else if(m_tick)
                state_next = wait1_2;
        end

        wait1_2:
        begin
            if(~sw)
                state_next = zero;
            else if(m_tick)
                state_next = wait1_3;
        end

        wait1_3:
        begin
            if(~sw)
                state_next = zero;
            else if(m_tick)
                state_next = one;
        end

        //--------------------------------
        // Stable HIGH state
        //--------------------------------
        one:
        begin
            db = 1'b1;

            if(~sw)
                state_next = wait0_1;
        end

        //--------------------------------
        // Verify LOW for 3 ticks
        //--------------------------------
        wait0_1:
        begin
            db = 1'b1;

            if(sw)
                state_next = one;
            else if(m_tick)
                state_next = wait0_2;
        end

        wait0_2:
        begin
            db = 1'b1;

            if(sw)
                state_next = one;
            else if(m_tick)
                state_next = wait0_3;
        end

        wait0_3:
        begin
            db = 1'b1;

            if(sw)
                state_next = one;
            else if(m_tick)
                state_next = zero;
        end

        default:
            state_next = zero;

    endcase

end

endmodule