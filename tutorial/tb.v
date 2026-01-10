module testbench;

    reg d;
    reg rst_b;
    reg clk;

    wire q;

    initial begin
        d = 0;
        rst_b = 0;
        clk = 0;
        $monitor ("At time %t, clk = %d", $time, clk);

        #100 $finish;
    end

    always begin
        #10 clk = ~clk;
    end
endmodule
