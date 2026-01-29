module test;

integer fd;
integer status;
wire[39:0] scratch;
wire outputReady;
byte data;
reg clk = 0;
always #1 clk = !clk;
reg[2:0] divider = 0;
reg inputReady = 0;
reg[3:0] finishing = 0;
//parameter bitmap = 33'b10000010_01100000_10001110_110110111;
parameter bitmap = 33'h104c11db7;
//parameter bitmap = 32'h04c11db7;
//parameter bitmap = 32'hedb88320;
wire[31:0] crc32;
genvar ix;
generate
    for (ix = 0; ix < 32; ix++) begin
        assign crc32[ix] = scratch[39 - ix];
    end
endgenerate

    initial begin
        fd = $fopen("data.txt", "r");
        if (fd == 0) begin
            $display ("Error opening file");
            $finish;
        end
        $monitor ("Clock: %d, ir: %b, input: %h, or: %b, f: %b, scratch: %b (%h)", clk, inputReady, data, inputReady, finishing, scratch, scratch);
    end;
    
    always @(posedge clk) begin
        if (finishing == 0) begin
            status = $fscanf(fd, "%c", data);
            if (status == 1) begin
                $display ("Got %c (%h - %b)", data, data, data);
                inputReady = 1;
            end else begin
                $display ("Got status %d", status);
                if ($feof(fd)) begin
                    finishing = 1;
                end
            end
        end else if (outputReady == 1) begin
            $display ("Output is ready");
            if (finishing == 5) begin
                $display ("crc = %b (%h)", crc32 ^ 32'hffffffff, crc32 ^ 32'hffffffff);
                $fclose(fd);
                $finish;
            end
            // add four zero bytes
            data = 0;
            finishing = finishing + 1;
            inputReady = 1;
        end
    end
    always @(negedge clk) begin
        inputReady = 0;
    end

    crc32 calc (clk, inputReady, data, outputReady, scratch);
    
endmodule
