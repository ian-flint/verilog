module and_gate (
    input wire a, 
    input wire b, 
    output wire c
);
    assign c = a & b;
endmodule

module test;
    reg a, b;
    wire c;
    initial
        $monitor ("At time %t, a = %d, b = %d, c = %d", $time, a, b, c);

    initial
        begin
            #1 a = 0;
            #1 b = 0;
            #1 a = 1;
            #1 b = 1;
            #1 a = 0;
            #1 $finish;
        end
    and_gate a1 (a, b, c);
endmodule
