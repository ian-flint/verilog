module pipeline (
    input wire clk,
    input wire[7:0] in,
    output reg[7:0] outin,
    output reg[7:0] out
);

parameter length = 8;

reg [7:0] pipe[length:0];
reg [7:0] inpipe[length:0];

always @(*) pipe[0] <= in;
always @(*) inpipe[0] <= in;
always @(*) out <= pipe[length];
always @(*) outin <= inpipe[length];

genvar ix;
generate
    for (ix = 0; ix < length; ix = ix + 1) begin
        always @(posedge clk) begin
            pipe[ix + 1] <= pipe[ix] + 1;
            inpipe[ix + 1] <= inpipe[ix];
        end
    end
endgenerate

endmodule

module test;
    reg[7:0] in = 0;
    wire[7:0] outin;
    wire[7:0] out;
    reg clk = 0;

    always #1 clk = !clk;
    always #8 in = in + 8'h10;

    initial begin
        $dumpfile ("pipeline2.vcd");
        $dumpvars (0, test);
        #80 $finish;
    end

    pipeline p (clk, in, outin, out);

endmodule
