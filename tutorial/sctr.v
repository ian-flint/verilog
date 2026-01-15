module sctr (
    input wire clk,
    input wire rst,
    output wire[3:0] q
            );

    reg rrst;
    reg[3:0] jk;

    always @(*) begin
        if ((q[3] == 1) & (q[1] == 1))
            rrst <= 1;
        else
            rrst <= rst;
    end
    always @(posedge clk) begin
        jk[0] <= 1'b1;
        jk[1] <= q[0];
        jk[2] <= q[0] & q[1];
        jk[3] <= q[0] & q[1] & q[2];
    end

    genvar ix;
    generate
        for (ix = 0; ix < 4; ix = ix + 1) begin :jkff
            jkff j (clk, rrst, jk[ix], jk[ix], q[ix]);
        end
    endgenerate
endmodule
