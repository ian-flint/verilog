module test;
    reg a = 1;
    reg b = 1;
    reg c = 1;
    reg d = 1;
    wire wq;
    reg q;
    and a1 (wq, a, b, c, d);
    always @(*) q <= wq;

    initial $monitor ("%t a %d, b %d, c %d, d %d, q %d", $time, a, b, c, d, q);
    initial begin
        #2 a = 0;
        #2 $finish;
    end
endmodule
