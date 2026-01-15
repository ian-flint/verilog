module dff (
    input wire clk, 
    input wire d, 
    output reg q
);

    always @(posedge clk) begin
        q <= d;
    end

endmodule

module srff (
    input wire clk,
    input wire s,
    input wire r,
    output reg q
);

    always @(negedge clk) begin
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
    reg en = 0;
    reg rst = 1;
    reg d = 0;
    wire q0;
    wire q;

    always #1 clk = !clk;

    initial
        $monitor ("%t: c %d, d %d, q0 %d, q %d", $time, clk, d, q0, q);

    initial begin
        #4 d = 1;
        #4 d = 0;
        #4 d = 1;
        #4 d = 0;
        #2 $finish;
    end


    dff d1 (clk, d, q0);
    srff s1 (clk, q0, !q0, q);

endmodule
