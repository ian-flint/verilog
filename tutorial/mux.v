module mux2to1 (    
    input wire a,
    input wire b,
    input wire s,
    output reg q
);

    always @(*) begin
        q <= s?b:a;
        end
      
endmodule

module test;
    reg a, b, s;
    reg clk = 0;
    wire q;
    initial
        $monitor ("At time %t, clk = %d, a = %d, b = %d, s=%d, q = %d", $time, clk, a, b, s, q);

    initial
        begin
            #2 s = 0;
            #2 a = 0;
            #2 b = 0;
            #2 a = 1;
            #2 b = 1;
            #2 a = 0;
            #2 s = 1;
            #2 b = 0;
            #2 a = 1;
            #2 b = 1;
            #2 a = 0;
            #2 $finish;       
        end
    mux2to1 mux_1(a, b, s, q);
    always
        #1 clk = ~clk;
endmodule
