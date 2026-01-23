module test;
    reg clk = 0;
    always #1 clk = !clk;

    reg rst = 0;
    wire [3:0] q;

    mctr c1 (clk, rst, q);

    initial $monitor ("%t: r %d q %d%d%d%d", $time, rst, q[3], q[2], q[1], q[0]);
    //initial $monitor ("%t: c %d r %d q %d%d%d%d qa %d%d%d%d", $time, clk, rst, q[3], q[2], q[1], q[0], c1.qa[3], c1.qa[2], c1.qa[1], c1.qa[0]);
    initial begin
        #4 rst = 1;
        #4 rst = 0;
        #20 $finish;
    end

endmodule
