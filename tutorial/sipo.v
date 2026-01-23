module sipo #(parameter width = 4) (
    input wire clk,
    input wire rst,
    input wire in,
    output wire[width - 1:0] q
    );

    wire[width - 1:0] qa;
    
    genvar ix;
    generate
        for (ix = 0; ix < width; ix = ix + 1) begin:jkff
            if (ix == (width - 1))
                jkff j (!clk, rst, in, !in, q[ix]);
            else
                jkff j (!clk, rst, qa[ix + 1], !qa[ix + 1], q[ix]);
            jkff ja (clk, rst, q[ix], !q[ix], qa[ix]);
        end
    endgenerate
endmodule;
            
