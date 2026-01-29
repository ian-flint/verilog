module crc3 ;

reg[16:0] scratch = 17'b11010011101100000;

parameter bitmap = 4'b1011;

reg clk = 0;

always #1 clk = !clk;
reg finishing = 1;
reg [7:0] bitCounter = 0;

initial begin
    $monitor ("c: %d, b: %d, s: %b", clk, bitCounter, scratch);
end

always @(negedge clk) begin
    if (finishing == 1) begin
        $display ("bitCounter = %d", bitCounter);
        if (bitCounter < 14) begin
            if (scratch[16] == 1) begin
                scratch[16:13] = scratch[16:13] ^ bitmap;
            end
            scratch = scratch << 1;
            bitCounter = bitCounter + 1;
        end else begin
            $finish;
        end
    end
end

endmodule
