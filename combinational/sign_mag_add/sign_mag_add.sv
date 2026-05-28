`timescale 1ns/1ps
module sign_mag_add
#(
    parameter N=4
)
(
    input logic [N-1:0] a,
    input logic [N-1:0] b,
    output logic [N-1:0] sum

);
logic [N-2:0] mag_a, mag_b, mag_sum,max,min;
logic sign_a, sign_b, sign_sum;

always_comb
begin
    mag_a = a[N-2:0];
    mag_b = b[N-2:0];
    sign_a = a[N-1];
    sign_b = b[N-1];
    if(mag_a > mag_b)
    begin
        max = mag_a;
        min = mag_b;
        sign_sum = sign_a;
    end
    else
    begin
        max = mag_b;
        min = mag_a;
        sign_sum = sign_b;
    end
    if(sign_a == sign_b)
        mag_sum = max + min;
    else
        mag_sum = max - min;
    sum = {sign_sum, mag_sum};
end
endmodule