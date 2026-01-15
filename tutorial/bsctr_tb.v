module test;
    reg clk = 0;
    always #1 clk = !clk;

    reg rst = 0;
    reg ud = 0;
    wire [3:0] q;

    bsctr c1 (clk, rst, ud, q);

    //initial $monitor ("%t: c %d ud %d r %d rrst %d jk %d%d%d%d q %d%d%d%d", $time, clk, ud, rst, c1.rrst, c1.jk[3], c1.jk[2], c1.jk[1], c1.jk[0], q[3], q[2], q[1], q[0]);
    //initial $monitor ("%t: ud %d r %d rrst %d jk %d%d%d%d q %d%d%d%d", $time, ud, rst, c1.rrst, c1.jk[3], c1.jk[2], c1.jk[1], c1.jk[0], q[3], q[2], q[1], q[0]);
    initial $monitor ("%t: ud %d r %d rrst %d q %d%d%d%d", 
                      $time, ud, rst, c1.rrst, q[3], q[2], q[1], q[0]);
    initial begin
        #4 rst = 1;
        #4 rst = 0;
        #32 ud = 1;
        #32 $finish;
    end

endmodule
