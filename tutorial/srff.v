module srff (
    input wire clk,
    input wire s,
    input wire r,
    output reg q
);

    always @(posedge clk) begin
        if (s == 1) begin
            if (r == 1) begin
                q <= 1'bx;
            end else begin
                q <= 1;
            end
        end else if (r == 1) begin
            q <= 0;
        end
    end

endmodule;

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
