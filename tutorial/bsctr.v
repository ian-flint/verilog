module bsctr (
    input wire clk,
    input wire rst,
    input wire ud,
    output wire[3:0] q
            );

    reg rrst;
    reg[3:0] jk;

    always @(*) begin
        if ((q[3] == 1) & ((q[1] == 1) | (q[2] == 1)) & (ud == 1))
            rrst <= 1;
        else
            rrst <= rst;
    end
    always @(posedge clk) begin
        if (ud == 0) begin
            if ((q[3] == 0) & (q[2] == 0) & (q[1] == 0) & (q[0] == 0)) begin
                jk[0] <= 1'b1;
                jk[1] <= 1'b0;
                jk[2] <= 1'b0;
                jk[3] <= 1'b1;
            end else begin
                jk[0] <= 1'b1;
                jk[1] <= (!q[0]);
                jk[2] <= (!q[1]) & (!q[0]);
                jk[3] <= (!q[2]) & (!q[1]) & (!q[0]);
            end
        end else if (ud == 1) begin
            jk[0] <= 1'b1;
            jk[1] <= q[0];
            jk[2] <= q[0] & q[1];
            jk[3] <= q[0] & q[1] & q[2];
        end
    end

    genvar ix;
    generate
        for (ix = 0; ix < 4; ix = ix + 1) begin :jkff
            jkff j (clk, rrst, jk[ix], jk[ix], q[ix]);
        end
    endgenerate
endmodule
