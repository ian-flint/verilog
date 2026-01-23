module test;
    reg clk = 0;
    always #1 clk = !clk;

    parameter width = 16;
    reg rst = 0;
    reg in = 0;
    wire q;

    moore2 m1 (clk, rst, in, q);

    initial $monitor ("%t: c%d r%d in%d cs%d ns%d q%d", $time, clk, rst, in, m1.cs, m1.ns, q);
    //initial $monitor ("%t: r %d in %d q %d", $time, rst, in, q);
    initial begin
        #4 rst = 1;
        #4 rst = 0;
        #2 in = 1;
        #2 in = 0;
        #2 in = 1;
        #2 in = 1;
        #2 in = 0;
        #2 in = 1;
        #2 in = 1;
        #2 in = 0;
        #2 in = 1;
        #2 in = 0;
        #12 $finish;
    end

endmodule
