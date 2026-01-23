module srff (
    input wire clk,
    input wire s,
    input wire r,
    output reg q
);

    always @(posedge clk) begin
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
