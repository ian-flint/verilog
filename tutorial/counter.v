module counter (
                input wire clk, 
                input wire reset,
                output reg[7:0] out 
                );

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
        #30 $finish;
    end

    reg clk = 0;
    always #1 clk = !clk;

    wire [7:0] value;
    counter c1 (clk, reset, value);

    initial
        $monitor ("At time %t, rst = %d, value = %h (%0d)", $time, reset, value, value);
endmodule
