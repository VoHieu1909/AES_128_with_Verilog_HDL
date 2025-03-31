module TEST_2(
    input CLK,
    input SL,
    input [127:0] KEY,
    output [127:0] KEY_GEN
);
    wire [3:0] STATE;        // Duy trì trạng thái
    wire [31:0] RCON;        // Duy trì RCON
    STATE_BLOCK ST_BL(CLK, STATE, RCON);
    // MUX Lựa chọn KEY
    wire [127:0] WIRE_MUX;   // Đầu ra của MUX
    MUX_128 K_MUX(SL, KEY_GEN, KEY, WIRE_MUX);
    
    // Tạo khóa từ MUX và RCON
    KEY_EX K_GEN(CLK, WIRE_MUX, RCON, KEY_GEN);

endmodule