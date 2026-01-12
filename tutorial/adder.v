module pipelined_adder (
        input wire clk,
        input wire a,
        input wire b,
        input wire carry_in,
        output reg carry_out,
        output reg sum
);
    always @(posedge clk) begin
        {carry_out, sum} = a + b + carry_in;
    end

endmodule

module test;
    parameter MAXINDEX=3;
    reg clk = 0;
    reg a[MAXINDEX:0];
    reg b[MAXINDEX:0];
    reg ci = 0;
    wire co[MAXINDEX:0];
    wire sum[MAXINDEX:0];

    initial
    begin
        //genvar ix;
        //generate
        //    for (ix = 0; ix < MAXINDEX + 1; ix += 1) begin
        //        #0 a[ix] = 0;
        //        #0 b[ix] = 0;
        //    end
        //endgenerate
        #0 a[0] = 0;
        #0 a[1] = 0;
        #0 a[2] = 0;
        #0 a[3] = 0;
        #0 b[0] = 0;
        #0 b[1] = 0;
        #0 b[2] = 0;
        #0 b[3] = 0;
        #0 b[0] = 1;
        #100 $finish;
    end

    always #1 begin
        clk = !clk;
    end

    reg counter = 0;

    always @(negedge clk) begin
        counter = counter + 1;
//        if (counter == 0) begin
            $display ("%t: %x%x%x%x + %x%x%x%x = %x%x%x%x (%x%x%x%x)", 
                        $time, 
                        a[3],
                        a[2],
                        a[1],
                        a[0],
                        b[3],
                        b[2],
                        b[1],
                        b[0],
                        sum[3],
                        sum[2],
                        sum[1],
                        sum[0],
                        co[3],
                        co[2],
                        co[1],
                        co[0]
                        );
            b[3] = sum[3];
            b[2] = sum[2];
            b[1] = sum[1];
            b[0] = sum[0];
            a[0] = a[0] + 1;
//        end
    end

    pipelined_adder a1 (clk, a[0], b[0], ci, co[0], sum[0]);
    pipelined_adder a2 (clk, a[1], b[1], co[0], co[1], sum[1]);
    pipelined_adder a3 (clk, a[2], b[2], co[1], co[2], sum[2]);
    pipelined_adder a4 (clk, a[3], b[3], co[2], co[3], sum[3]);
endmodule
