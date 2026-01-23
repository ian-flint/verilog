module gctr (
    input wire clk,
    input wire rst,
    output reg[3:0] q
            );

    reg en = 1;
    reg[3:0] ctr;

    always @(posedge rst) begin
        ctr <= 0;
    end

    always @(negedge clk) begin
        q[0] <= ctr[0] ^ ctr[1];
        q[1] <= ctr[1] ^ ctr[2];
        q[2] <= ctr[2] ^ ctr[3];
        q[3] <= ctr[3];
    end
    always @(posedge clk) begin
        ctr <= ctr + 1;
    end
endmodule
