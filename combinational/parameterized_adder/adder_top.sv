module adder_top (

    input  logic [3:0] a4,
    input  logic [3:0] b4,
    output logic [3:0] sum4,
    output logic c4,

    input  logic [7:0] a8,
    input  logic [7:0] b8,
    output logic [7:0] sum8,
    output logic c8

);

adder #(.N(4)) unit1 (

    .a(a4),
    .b(b4),
    .sum(sum4),
    .cout(c4)

);

adder #(.N(8)) unit2 (

    .a(a8),
    .b(b8),
    .sum(sum8),
    .cout(c8)

);

endmodule