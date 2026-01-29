module crc32 (
    input wire clk,
    input wire inputReady,
    input wire[7:0] data,
    output reg outputReady,
    output reg[39:0] scratch
);

byte byteCounter = 0;
reg [7:0] bitCounter = 8;
assign outputReady = bitCounter[3];

parameter bitmap = 32'h04c11db7; // forward bitmap
//parameter bitmap = 32'hedb88320; // reverse bitmap

wire[7:0] rdata;
genvar ix;
generate
    for (ix = 0; ix < 8; ix++) begin
        assign rdata[ix] = data[7 - ix];
    end
endgenerate

always @(posedge inputReady) begin
    //$display ("byteCounter = %d", byteCounter);
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
    //$display ("bitCounter = %d", bitCounter);
end


always @(negedge clk) begin
    if (outputReady == 0) begin
        if (scratch[39] == 1) begin
            //$display ("before: %b", scratch);
            //$display ("bitmap: %b", bitmap);
            scratch = scratch << 1;
            scratch[39:8] = scratch[39:8] ^ bitmap;
            //$display ("after:  %b", scratch);
        end else begin
            scratch = scratch << 1;
        end
        //$display ("shifting left");
        bitCounter = bitCounter + 1;
    end
end

endmodule
