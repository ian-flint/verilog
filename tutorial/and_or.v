module and_comb_or (    
    input wire a,
    input wire b,
    input wire c,
    output reg d
);

    always @(*) begin
        d = (a & b) | c;    
        end
      
endmodule

module test;
    reg a, b, c;
    reg clk = 0;
    wire d;
    initial
        $monitor ("At time %t, clk = %d, a = %d, b = %d, c = %d, d = %d", $time, clk, a, b, c, d);

    initial
        begin
            #3 a = 0;
            #3 b = 0;
            #3 c = 0;
            #3 c = 1;
            #3 c = 0;
            #3 a = 1;
            #3 b = 1;
            #3 $finish;       
        end
    and_comb_or ao1(a, b, c, d);
    always
        #1 clk = ~clk;
endmodule
