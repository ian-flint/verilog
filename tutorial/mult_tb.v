module test;
    parameter WIDTH = 8;
    parameter OUTWIDTH = 16;
    reg [WIDTH - 1 : 0] a, b;
    wire [OUTWIDTH - 1 : 0] out;
    initial 
        $monitor ("At time %t, a = %d, b = %d, out = %d", $time, a, b, out);

    initial 
        begin
            # 0 b = 0;
            # 1 a = 2;
            # 2 b = 3;
            # 3 a = 5;
            # 4 b = 7;
            # 10 $stop;
        end
    mult m1 (out, a, b);
endmodule 
