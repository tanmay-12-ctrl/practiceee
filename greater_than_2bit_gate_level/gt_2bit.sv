module gt_2bit (
    input  logic A1,
    input  logic A0,
    input  logic B1,
    input  logic B0,
    output logic GT
);

assign GT =
    (A1 & ~B1) |
    (A0 & ~B1 & ~B0) |
    (A1 & A0 & ~B0);

endmodule