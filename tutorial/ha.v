module my_design #(parameter N = 4) (
    input [N-1:0] a, b,
    output [N-1:0] sum, cout
);
    genvar i; // Declare the loop variable as genvar

    generate
        // Name the generate block array 'ha_gen' for hierarchical reference
        for (i = 0; i < N; i = i + 1) begin : ha_gen
            // Instantiate a half-adder module for each bit
            ha u0 (
                .a(a[i]),
                .b(b[i]),
                .sum(sum[i]),
                .cout(cout[i])
            );
        end
    endgenerate
endmodule

// Helper module (half adder)
module ha (input a, b, output sum, cout);
    assign sum = a ^ b;
    assign cout = a & b;
endmodule
