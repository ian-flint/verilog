module pipeline_stage (
    input wire clk,
    input wire[7:0] x,
    output reg[7:0] y
);

always @(posedge clk) begin
    y <= x + 1;
end

endmodule

module test;
    reg[7:0] in = 0;
    wire[7:0] out[3:0];
    reg clk = 0;

    always #1 clk = !clk;
    always #8 in = in + 8'h10;

    initial begin
        $dumpfile ("pipeline.vcd");
        $dumpvars (0, test);
        #80 $finish;
    end

    pipeline_stage p0 (clk, in, out[0]);
    pipeline_stage p1 (clk, out[0], out[1]);
    pipeline_stage p2 (clk, out[1], out[2]);
    pipeline_stage p3 (clk, out[2], out[3]);

endmodule
