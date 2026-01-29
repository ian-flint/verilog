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
wire[31:0] crc32;
string filename;
genvar ix;
generate
    for (ix = 0; ix < 32; ix++) begin
        assign crc32[ix] = scratch[39 - ix];
    end
endgenerate

    initial begin
        if (!($value$plusargs("FILE=%s", filename))) begin
            filename = "data.txt";
        end
        $display ("Opening %s", filename);
        fd = $fopen(filename, "r");
        if (fd == 0) begin
            $display ("Error opening file");
            $finish;
        end
        //$monitor ("Clock: %d, ir: %b, input: %h, or: %b, scratch: %b (%h)", clk, inputReady, data, outputReady, scratch, scratch);
        //$monitor ("input: %h, scratch: %b (%h)", data, scratch, scratch);
    end;
    
    always @(posedge clk) begin
        if ((finishing == 0) && (outputReady == 1)) begin
            status = $fscanf(fd, "%c", data);
            if (status == 1) begin
                //$display ("Got %c (%h - %b)", data, data, data);
                inputReady = 1;
            end else begin
//                $display ("Got status %d", status);
                if ($feof(fd)) begin
                    finishing = 1;
                end
            end
        end else if (outputReady == 1) begin
            if (finishing == 5) begin
                $display ("crc = %h", crc32 ^ 32'hffffffff);
                $fclose(fd);
                $finish;
            end
            // add four zero bytes
            //$display ("Feeding zero character");
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
