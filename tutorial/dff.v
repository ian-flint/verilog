module dff (
    input wire clk, 
    input wire en, 
    input wire rst,
    input wire d, 
    output reg q
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 0;
        else if (en)
            q <= d;
    end

endmodule
