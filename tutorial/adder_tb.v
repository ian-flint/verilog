module test;
    parameter WIDTH = 8;
    reg [WIDTH - 1 : 0] a, b;
    wire [WIDTH - 1 : 0] out;
    initial 
        $monitor ("At time %t, a = %d, b = %d, out = %d", $time, a, b, out);

    initial 
        begin
            # 0 b = 0;
            # 1 a = 1;
            # 2 b = 2;
            # 3 a = 4;
            # 4 b = 8;
            # 10 $finish;
        end
    adder a1 (out, a, b);
endmodule 
