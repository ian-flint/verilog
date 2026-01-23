module test;
    reg clk = 0;
    always #1 clk = !clk;

    parameter width = 16;
    reg rst = 0;
    reg in = 0;
    wire [width-1:0] q;

    sipo #(.width(width)) c1 (clk, rst, in, q);

    //initial $monitor ("%t: r %d i %d q %d%d%d%d%d%d%d%d", $time, rst, in, q[7], q[6], q[5], q[4], q[3], q[2], q[1], q[0]);
    initial $monitor ("%t: r %d q %b", $time, rst, q);
    //initial $monitor ("%t: c %d r %d q %d%d%d%d qa %d%d%d%d", $time, clk, rst, q[3], q[2], q[1], q[0], c1.qa[3], c1.qa[2], c1.qa[1], c1.qa[0]);
    initial begin
        #4 rst = 1;
        #4 rst = 0;
        #4 in = 1;
        #2 in = 0;
        #12 in = 1;
        #4 in = 0;
        #12 in = 1;
        #6 in = 0;
        #12 in = 1;
        #8 in = 0;
        #12 $finish;
    end

endmodule
