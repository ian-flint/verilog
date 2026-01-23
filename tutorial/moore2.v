module moore2 #(parameter width = 7, pattern=7'b1011010) (
    input wire clk,
    input wire rst,
    input wire in,
    output reg q = 0
    );

    reg[2:0] cs = 0;
    reg[2:0] ns = 0;

    always @(posedge clk) begin
        case (cs)
            0: ns <= (in == 1)?1:0;
            1: ns <= (in == 0)?2:0;
            2: ns <= (in == 1)?3:0;
            3: ns <= (in == 1)?4:0;
            4: ns <= (in == 0)?5:0;
            5: ns <= (in == 1)?6:0;
            6: begin
                ns <= (in == 0)?7:4;
                //q <= (in == 0)?1:0;
               end
            7: ns <= (in == 1)?3:0;
        endcase
    end
    always @(negedge clk) begin
        cs <= ns;
        q <= (ns == 7)?1:0;
    end
endmodule
            
