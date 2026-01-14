module pipelined_adder (
        input wire clk,
        input wire a,
        input wire b,
        input wire ci,
        output reg co,
        output reg sum
);
    always @(posedge clk) begin
        {co, sum} <= a + b + ci;
    end

endmodule

module test;
    parameter MAXINDEX=8;
    reg clk = 0;
    reg a[MAXINDEX:0];
    reg b[MAXINDEX:0];
    reg ci = 0;
    wire co[MAXINDEX:0];
    wire sum[MAXINDEX:0];
    genvar ix;

    generate
        for (ix = 0; ix < MAXINDEX; ix = ix + 1) begin
            initial begin
                #0 a[ix] = 0;
                #0 b[ix] = 0;
            end
        end
    endgenerate

    initial begin
        #0 a[0] = 1;
        #400 $finish;
    end

    always #1 begin
        clk = !clk;
    end

    reg[2:0] counter = 0;
    always @(negedge clk) begin
        counter = counter + 1;
        if (counter == 0) begin
        //if (1) begin
            $display ("%t: %x%x%x%x%x%x%x%x + %x%x%x%x%x%x%x%x = %x%x%x%x%x%x%x%x (%x%x%x%x%x%x%x%x)", 
                        $time, 
                        a[7],
                        a[6],
                        a[5],
                        a[4],
                        a[3],
                        a[2],
                        a[1],
                        a[0],
                        b[7],
                        b[6],
                        b[5],
                        b[4],
                        b[3],
                        b[2],
                        b[1],
                        b[0],
                        sum[7],
                        sum[6],
                        sum[5],
                        sum[4],
                        sum[3],
                        sum[2],
                        sum[1],
                        sum[0],
                        co[7],
                        co[6],
                        co[5],
                        co[4],
                        co[3],
                        co[2],
                        co[1],
                        co[0],
                        );
            b[7] <= sum[7];
            b[6] <= sum[6];
            b[5] <= sum[5];
            b[4] <= sum[4];
            b[3] <= sum[3];
            b[2] <= sum[2];
            b[1] <= sum[1];
            b[0] <= sum[0];
        end
    end

    generate
        for (ix = 0; ix < MAXINDEX; ix = ix + 1) begin :pa_loop
            if (ix == 0) begin
                pipelined_adder pa (clk, a[ix], b[ix], ci, co[ix], sum[ix]);
            end else begin
                pipelined_adder pa (clk, a[ix], b[ix], co[ix - 1], co[ix], sum[ix]);
            end
        end
    endgenerate
endmodule
