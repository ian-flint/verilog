module jkff (
    input wire clk,
    input wire rst,
    input wire s,
    input wire r,
    output reg q
);

    always @(posedge rst or negedge clk) begin
        if (rst)
            q <= 0;
        else if (s == 1) begin
            if (r == 1) begin
                q <= !q;
            end else begin
                q <= 1;
            end
        end else if (r == 1) begin
            q <= 0;
        end
    end

endmodule;
