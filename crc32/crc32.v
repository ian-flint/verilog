module crc32 (
    input wire clk,
    input wire inputReady,
    input wire[7:0] data,
    output reg outputReady,
    output reg[39:0] scratch
);

byte byteCounter = 0;
reg [7:0] bitCounter = 8;

//parameter bitmap = 33'b10000010_01100000_10001110_110110111;
parameter bitmap = 33'h104c11db7;
//parameter bitmap = 32'h04c11db7;
//parameter bitmap = 32'hedb88320;

wire[7:0] rdata;
assign rdata = {
    data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7]
};

always @(posedge inputReady) begin
    if (byteCounter < 5) begin
        scratch = scratch << 8;
        byteCounter = byteCounter + 1;
    end
    if (byteCounter == 5) begin
        bitCounter = 0;
    end
    scratch = scratch | rdata[7:0];
    if (byteCounter < 5) begin
        scratch[7:0] = scratch[7:0] ^ 8'hFF;
    end
end


always @(negedge clk) begin
    if (outputReady == 0) begin
        if (scratch[39] == 1) begin
            $display ("before: %b", scratch);
            $display ("bitmap: %b", bitmap);
            scratch[39:7] = scratch[39:7] ^ bitmap;
            $display ("after:  %b", scratch);
        end
        scratch = scratch << 1;
        bitCounter = bitCounter + 1;
    end
    outputReady = bitCounter[3];
end

endmodule
