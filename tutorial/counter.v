module counter (out, clk, reset);
    parameter WIDTH = 16;

    output [WIDTH-1 : 0] out;
    input clk, reset;

    reg [WIDTH - 1 : 0] out;
    wire clk, reset;

    always @(posedge clk or posedge reset)
        if (reset)
            out <= 0;
        else
            out <= out + 1;
endmodule


module test;
    reg reset = 0;
    initial begin
        # 17 reset = 1;
        # 11 reset = 0;
        # 29 reset = 1;
        # 11 reset = 0;
        #600 $finish;
    end

    reg clk = 0;
    always #1 clk = !clk;

    wire [15:0] value;
    counter c1 (value, clk, reset);

    initial
        $monitor ("At time %t, value = %h (%0d)", $time, value, value);
endmodule
