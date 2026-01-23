module mctr (
    input wire clk,
    input wire rst,
    output wire[3:0] q
    );

    wire[3:0] qa;

    reg s3, r3;
    always @(*) begin
        if ((rst == 1) | (qa[0] == 0))
            s3 <= 1;
        else
            s3 <= 0;
    end

    jkff j3  (!clk, 1'b0, s3, !s3, q[3]);
    jkff j3a (clk, rst, j3.q, !j3.q, qa[3]);
    jkff j2  (!clk, rst, qa[3], !qa[3], q[2]);
    jkff j2a (clk, rst, j2.q, !j2.q, qa[2]);
    jkff j1  (!clk, rst, qa[2], !qa[2], q[1]);
    jkff j1a (clk, rst, j1.q, !j1.q, qa[1]);
    jkff j0  (!clk, rst, qa[1], !qa[1], q[0]);
    jkff j0a (clk, rst, j0.q, !j0.q, qa[0]);

endmodule;
            
