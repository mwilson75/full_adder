module full_adder (
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
);
parameter BIT_DEPTH = 4;

genvar i;
wire[BIT_DEPTH:0] tmpcout;
assign tmpcout[0] = cin;
generate 
    for(i=0; i < BIT_DEPTH;i++) begin 
        one_bit_adder inst (.a(a[i]),.b(b[i]),.cin(tmpcout[i]),.sum(sum[i]),.cout(tmpcout[i+1]));
    end 
endgenerate

assign cout = tmpcout[BIT_DEPTH];

endmodule