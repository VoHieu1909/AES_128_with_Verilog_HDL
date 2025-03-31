module ROTWORD(
    input wire [31:0] word_in,   // Từ đầu vào 32 bit
    output reg [31:0] word_out   // Từ đầu ra 32 bit sau khi quay
);

    always @(*) begin
        // Quay từ theo chiều kim đồng hồ
        word_out = {word_in[23:0], word_in[31:24]};
    end
endmodule