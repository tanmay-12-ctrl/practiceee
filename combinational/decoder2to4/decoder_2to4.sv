module decoder_2to4 (
    input  logic en,
    input  logic a1,
    input  logic a0,
    output logic b0,
    output logic b1,
    output logic b2,
    output logic b3
);

assign b0 = en & ~a1 & ~a0;
assign b1 = en & ~a1 &  a0;
assign b2 = en &  a1 & ~a0;
assign b3 = en &  a1 &  a0;

endmodule