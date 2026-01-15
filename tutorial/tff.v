module tff (
    input wire clk,
    input wire t,
    output reg q = 0
);

    always @(posedge clk) if (t) q = !q;

endmodule;

module test;
    reg clk = 0;
    reg t = 0;
    wire q;

    initial
        $monitor ("%t: c %d, t %d, q %d", $time, clk, t, q);

    initial begin
        #4 t = 1;
        #8 t = 0;
        #4 t = 1;
        #2 t = 0;
        #8 $finish;
    end

    always #1 clk = !clk;

    tff s1 (clk, t, q);

endmodule
