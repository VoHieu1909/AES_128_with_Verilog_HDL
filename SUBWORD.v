module SUBWORD(
    input [31:0] W_I,
    output [31:0] W_O
);
    wire [127:0] EX_DI; // Để lưu trữ dữ liệu đầu vào cho S_BOX
    wire [127:0] EX_DO; // Để lưu trữ dữ liệu đầu ra từ S_BOX

    // Gán giá trị cho EX_DI
    assign EX_DI = {96'b0, W_I}; // Nạp 32 bit vào 128 bit

    // Gọi module S_BOX
    S_BOX M1 (EX_DI, EX_DO); // Giả sử S_BOX có cổng output_dat

    // Gán giá trị đầu ra
    assign W_O = EX_DO[31:0];    
endmodule