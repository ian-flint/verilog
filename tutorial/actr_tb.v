module test;
    reg clk = 0;
    always #1 clk = !clk;

    reg rst = 0;
    wire [3:0] q;

    actr c1 (clk, rst, q);

    //initial $monitor ("%t: c %d r %d rrst %d q %d%d%d%d", $time, clk, rst, c1.rrst, q[3], q[2], q[1], q[0]);
    initial $monitor ("%t: r %d rrst %d q %d%d%d%d", $time, rst, c1.rrst, q[3], q[2], q[1], q[0]);
    initial begin
        #4 rst = 1;
        #4 rst = 0;
        #50 $finish;
    end

endmodule
