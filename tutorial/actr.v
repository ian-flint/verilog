module actr (
    input wire clk,
    input wire rst,
    output wire[3:0] q
    );

    reg rrst;
    always @(*) begin
        if ((q[3] == 1) & (q[1] == 1))
            rrst <= 1;
        else
            rrst <= rst;
    end

    jkff j0 (clk, rrst, 1'b1, 1'b1, q[0]);
    jkff j1 (q[0], rrst, 1'b1, 1'b1, q[1]);
    jkff j2 (q[1], rrst, 1'b1, 1'b1, q[2]);
    jkff j3 (q[2], rrst, 1'b1, 1'b1, q[3]);

endmodule;
            
