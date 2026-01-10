module adder (out, a, b);
    parameter WIDTH = 8;
    output [WIDTH - 1 : 0] out;
    input [WIDTH - 1 : 0] a, b;
    wire [WIDTH - 1 : 0] a, b;

    wire [WIDTH - 1 : 0] out;
    assign out = a + b;

    //reg [WIDTH - 1 : 0] out;
    //always @(*) begin
        //out = a + b;
    //end
endmodule
