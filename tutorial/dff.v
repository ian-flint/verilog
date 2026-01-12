module dff (
    input wire clk, 
    input wire en, 
    input wire rst,
    input wire d, 
    output reg q
);

    always @(posedge clk or negedge rst) begin
        if (!rst)
            q <= 0;
        else if (en)
            q <= d;
    end
    always @(negedge rst) begin
        q <= 0;
    end

endmodule

module dff_tb;
    reg en = 0;
    reg rst = 1;
    reg clk = 0;
    reg d = 0;
    wire q;
    
    always #1 clk = !clk;

    initial
        $monitor ("At time %t, clk = %d, en = %d, rst = %d, d = %d, q = %d", $time, clk, en, rst, d, q);
    initial
        begin
            #1 d <= 1;
            #3 en <= 1;
            #2 d <= 0;
            #2 d <= 1;
            #2 en <= 0;
            #2 d <= 0;
            #2 d <= 1;
            #2 rst <= 0;
            #2 rst <= 1;
            #2 en <= 1;
            #2 d <= 0;
            #2 d <= 1;
            #2 $finish;
        end
    dff dff1 (clk, en, rst, d, q);
endmodule

