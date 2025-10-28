module full_adder #(parameter BIT_WIDTH = 4)
(
    input [BIT_WIDTH-1:0] a,
    input [BIT_WIDTH-1:0] b,
    input cin,
    output [BIT_WIDTH-1:0] sum,
    output cout
);

genvar i;
wire[BIT_WIDTH:0] tmpcout;
assign tmpcout[0] = cin;
generate 
    for(i=0; i < BIT_WIDTH;i++) begin 
        one_bit_adder inst (.a(a[i]),.b(b[i]),.cin(tmpcout[i]),.sum(sum[i]),.cout(tmpcout[i+1]));
    end 
endgenerate

assign cout = tmpcout[BIT_WIDTH];

endmodule