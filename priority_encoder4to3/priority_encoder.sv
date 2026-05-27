module priority_encoder(
    input logic [4:1]a,
    output logic [2:0]y
);
always_comb
begin
    if(a[4])
        y=3'b100;
    else if(a[3])
        y=3'b011;
    else if(a[2])
        y=3'b010;
    else if(a[1])
        y=3'b001;
    else
        y=3'b000;
end


endmodule