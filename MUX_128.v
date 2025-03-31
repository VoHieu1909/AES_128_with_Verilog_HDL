module MUX_128 (
    input wire sel,                // Tín hiệu chọn
    input wire [127:0] data0,     // Đầu vào 0
    input wire [127:0] data1,     // Đầu vào 1
    output reg [127:0] out         // Đầu ra
);

    always @(*) begin
        case (sel)
            1'b0: out = data0;    // Nếu sel = 0, chọn data0
            1'b1: out = data1;    // Nếu sel = 1, chọn data1
            default: out = 128'b0; // Giá trị mặc định
        endcase
    end

endmodule