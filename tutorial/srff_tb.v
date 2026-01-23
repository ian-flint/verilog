module test;
    reg clk = 0;
    reg s = 0;
    reg r = 0;
    wire q;
    initial
        $monitor ("%t: c %d, s %d, r %d, q %d", $time, clk, s, r, q);

    initial begin
        #2 s = 1;
        #2 r = 1;
        #2 s = 0;
        #2 r = 0;
        #2 s = 1;
        #2 s = 0;
        #2 $finish;
    end

    always #1 clk = !clk;

    srff s1 (clk, s, r, q);

endmodule
