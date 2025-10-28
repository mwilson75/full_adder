module full_adder_TB();
parameter BIT_WIDTH = 4;

reg [BIT_WIDTH-1:0] a = '0,b = '0,sum,verilog_sum;
reg cin = '0,cout,verilog_cout;

full_adder #(.BIT_WIDTH(BIT_WIDTH)) UUT
(
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);

initial begin
    {verilog_cout,verilog_sum} = a + b + cin;
    #1;
    assert(sum == verilog_sum);
    assert(cout == verilog_cout);
    #2;
    a = 15;
    b = 15;
    cin = 1;
    {verilog_cout,verilog_sum} = a + b + cin;
    #1;
    assert(sum == verilog_sum);
    assert(cout == verilog_cout);

end

endmodule