module adder
#(
    parameter N = 4
)
(
    input  logic [N-1:0] a,
    input  logic [N-1:0] b,
    output logic [N-1:0] sum,
    output logic cout
);

logic [N:0] sum_ext;

assign sum_ext = {1'b0,a} + {1'b0,b};

assign sum  = sum_ext[N-1:0];
assign cout = sum_ext[N];

endmodule