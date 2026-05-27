module eq2_always(
    input logic [1:0] a,
    input logic [1:0] b,
    output logic eq

);
logic eq0,eq1;
always @(a,b)
begin 
    logic tmp;
    tmp=1'b0;
    tmp=tmp|(~a[0]&~b[0]);
    eq0=tmp|(a[0]&b[0]);
end
always @(a,b)
begin 
    logic tmp;
    tmp=1'b0;
    tmp=tmp|(~a[1]&~b[1]);
    eq1=tmp|(a[1]&b[1]);
end
assign eq=eq0&eq1;
endmodule