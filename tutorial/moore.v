module moore #(parameter width = 7, pattern=7'b1011010) (
    input wire clk,
    input wire rst,
    input wire in,
    output reg q
    );

    wire[width - 1:0] qa;
    wire[width - 1:0] qar;
    genvar ix;
    generate
        for (ix = 0; ix < width; ix = ix + 1) begin
            assign qar[ix] = qa[width - ix - 1];
        end
    endgenerate
    sipo #(.width(width)) s(clk, rst, in, qa);

    always @(negedge clk) begin
        if (qar == pattern)
            q <= 1;
        else
            q <= 0;
    end
endmodule
            
