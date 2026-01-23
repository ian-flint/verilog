module test;
    reg clk = 0;
    always #1 clk = !clk;

    parameter width = 16;
    reg rst = 0;
    reg in = 0;
    wire q;

    moore #(.width(8), .pattern(8'b10110111)) c1 (clk, rst, in, q);

    initial $monitor ("%t: r %d in %d qa %b q %b", $time, rst, in, c1.qa, q);
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
        #2 in = 1;
        #2 in = 1;
        #12 $finish;
    end

endmodule
