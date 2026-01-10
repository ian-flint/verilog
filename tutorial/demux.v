module demux1to2 (    
    input wire s,
    input wire i,
    output reg a,
    output reg b
);

    always @(*) begin
        a <= s?0:i;
        b <= s?i:0;
        end
      
endmodule

module test;
    reg s, i;
    reg clk = 0;
    wire a, b;
    initial
        $monitor ("At time %t, clk = %d, s = %d, i = %d, a=%d, b = %d", $time, clk, s, i, a, b);

    initial
        begin
            #1 s = 0;
            #1 i = 0;
            #1 i = 1;
            #1 s = 1;
            #1 i = 0;
            #1 i = 1;
            #1 $finish;       
        end
    demux1to2 demux_1(s, i, a, b);
    always
        #1 clk = ~clk;
endmodule
