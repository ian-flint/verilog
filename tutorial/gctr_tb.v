module test;
    reg clk = 0;
    always #1 clk = !clk;

    reg rst = 0;
    wire [3:0] q;

    gctr c1 (clk, rst, q);

    //initial $monitor ("%t: c %d ud %d r %d rrst %d jk %d%d%d%d q %d%d%d%d", $time, clk, ud, rst, c1.rrst, c1.jk[3], c1.jk[2], c1.jk[1], c1.jk[0], q[3], q[2], q[1], q[0]);
    //initial $monitor ("%t: r %d jk %d%d%d%d q %d%d%d%d", $time, rst, c1.jk3, c1.jk2, c1.jk1, c1.jk0, q[3], q[2], q[1], q[0]);
    initial $monitor ("%t: r %d q %d%d%d%d", $time, rst, q[3], q[2], q[1], q[0]);
    initial begin
        #4 rst = 1;
        #4 rst = 0;
        #80 $finish;
    end

endmodule
