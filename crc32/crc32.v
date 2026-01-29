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

//parameter bitmap = 32'h04c11db7; // forward bitmap
parameter bitmap = 32'hedb88320; // reverse bitmap

always @(posedge inputReady) begin
    //$display ("byteCounter = %d", byteCounter);
    if (byteCounter < 5) begin
        scratch = scratch >> 8;
        byteCounter = byteCounter + 1;
    end
    if (byteCounter == 5) begin
        bitCounter = 0;
        //outputReady = bitCounter[3];
    end
    scratch[39:32] = scratch[39:32] | data;
    if (byteCounter < 5) begin
        scratch[39:32] = scratch[39:32] ^ 8'hFF;
    end
    //$display ("bitCounter = %d", bitCounter);
end


always @(negedge clk) begin
    if (outputReady == 0) begin
        if (scratch[0] == 1) begin
            scratch = scratch >> 1;
            //$display ("before: %b", scratch);
            //$display ("bitmap: %b", bitmap);
            scratch = scratch ^ bitmap;
            //$display ("after:  %b", scratch);
        end else begin
            scratch = scratch >> 1;
        end
        //$display ("shifting left");
        bitCounter = bitCounter + 1;
    end
    //outputReady = bitCounter[3];
end

endmodule
