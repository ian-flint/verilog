module gctr (
    input wire clk,
    input wire rst,
    output wire[3:0] q
            );

    reg jk0 = 0;
    reg[1:0] jk1 = 3;
    reg[2:0] jk2 = 5;
    reg[2:0] jk3 = 1;

    always @(posedge clk) begin
        jk0 <= jk0 + 1;
        jk1 <= jk1 + 1;
        jk2 <= jk2 + 1;
        jk3 <= jk3 + 1;
    end

    always @(negedge rst) begin
        jk0 <= 0;
        jk1 <= 3;
        jk2 <= 5;
        jk3 <= 1;
    end


    jkff j0 (clk, rst, !jk0, !jk0, q[0]);
    jkff j1 (clk, rst, !jk1, !jk1, q[1]);
    jkff j2 (clk, rst, !jk2, !jk2, q[2]);
    jkff j3 (clk, rst, !jk3, !jk3, q[3]);
endmodule
