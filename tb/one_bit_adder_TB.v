module one_bit_adder_TB();

reg [2:0] count = '0;
reg cout,sum,verilog_sum,verilog_cout;

one_bit_adder UUT
(
    .a(count[2]),
    .b(count[1]),
    .cin(count[0]),
    .sum(sum),
    .cout(cout)
);

initial begin
    repeat (8) begin
        #1
        {verilog_cout,verilog_sum} = count[2] + count[1] + count[0];
        #1
        assert(sum == verilog_sum);
        assert(cout == verilog_cout);
        #3
        count = count + 1;
    end

end
endmodule
