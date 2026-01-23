module test;
    reg clk = 0;
    always #1 clk = !clk;

    reg rst = 0;
    wire [3:0] q;

    gctr c1 (clk, rst, q);

    initial begin
        $dumpfile ("gctr2.vcd");
        $dumpvars (0, test);
        $dumpvars (0, c1);
        #4 rst = 1;
        #4 rst = 0;
        #80 $finish;
    end

endmodule
