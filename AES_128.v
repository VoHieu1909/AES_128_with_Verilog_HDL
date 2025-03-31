module AES_128(
    input wire iClk,
    input wire iReset_n,
    input wire iChipselect_n,
    input wire iWrite_n,
    input wire iRead_n,
    input wire [3:0] iAddress,
    input wire [31:0] iData,
    output reg [31:0] oData     // Giữ kích thước đầu ra là 32 bit
);	 
    // Tín hiệu bên trong
	 wire [3:0]STATE;
    reg EN_AES, Last_Word;
	 reg [127:0] Key, Data, Buffer;
    wire [127:0] Encrypted_Data; // Chuyển đổi thành wire
    // Gọi module AES (giả sử module này đã được định nghĩa và có D_O là output)
    testbench AES_MODULE(
		  .EN(EN_AES),
        .CLK(iClk), 
        .K_I(Key), 
        .D_I(Data), 
        .D_O(Encrypted_Data),  // Kết nối với D_O
		  .TEST_STATE(STATE)
    ); 
	 
    always @(posedge iClk or negedge iReset_n) begin
	     //Reset
        if (~iReset_n) begin
            oData <= 32'd0;         // Đặt đầu ra về 0 khi reset
            Key <= 128'd0;				
            Data <= 128'd0;
        end
        else begin
            // Ghi dữ liệu vào 
            if (~iChipselect_n & ~iWrite_n) begin
                case(iAddress)
                    // Nạp Key
                    4'd0:begin 
									Key[127:96] <= iData;  // Ghi 32 bit đầu tiên vào Key
									Last_Word <= 1'b0;
									EN_AES <= 1'b0;
								 end
                    4'd1:begin
									Key[95:64] <= iData;   // Ghi 32 bit thứ hai vào Key
									Last_Word <= 1'b0;
									EN_AES <= 1'b0;
								 end
                    4'd2:begin
									Key[63:32] <= iData;   // Ghi 32 bit thứ ba vào Key
									Last_Word <= 1'b0;
									EN_AES <= 1'b0;
								 end
                    4'd3:begin
									Key[31:0] <= iData;    // Ghi 32 bit cuối vào Key
									Last_Word <= 1'b0;
									EN_AES <= 1'b0;
								 end
                    // Nạp Data
                    4'd4:begin
									Data[127:96] <= iData; // Ghi 32 bit vào Data
									Last_Word <= 1'b0;
									EN_AES <= 1'b0;
								 end
                    4'd5:begin
									Data[95:64] <= iData;  // Ghi 32 bit thứ hai vào Data
									Last_Word <= 1'b0;
									EN_AES <= 1'b0;
								 end
                    4'd6:begin
									Data[63:32] <= iData;  // Ghi 32 bit thứ ba vào Data
									Last_Word <= 1'b0;
									EN_AES <= 1'b0;
								 end
						  4'd7:begin
									Data[31:0] <= iData;   // Ghi 32 bit cuối vào Data
									Last_Word <= 1'b1;
									EN_AES <= 1'b0;
								 end
					 endcase
            end
				//Truoc khi doc du lieu ra neu STATE = 10 luu vao Buffer
				if(STATE == 4'b1010)begin
					Buffer = Encrypted_Data;
				end
            // Đọc dữ liệu ra
            if (~iChipselect_n & ~iRead_n) begin
                case(iAddress)
                    // Key out
                    4'd0: oData <= Key[127:96];
                    4'd1: oData <= Key[95:64];
                    4'd2: oData <= Key[63:32];
                    4'd3: oData <= Key[31:0];
                    // Data out
                    4'd4: oData <= Data[127:96];
                    4'd5: oData <= Data[95:64];
                    4'd6: oData <= Data[63:32];
                    4'd7: oData <= Data[31:0];
                    // Encrypted_Data
                    4'd8: oData <= Buffer[127:96];
                    4'd9: oData <= Buffer[95:64];
                    4'd10: oData <= Buffer[63:32];
                    4'd11: oData <= Buffer[31:0];
                endcase
            end
				//Bat STATE
			   if(Last_Word)begin
					EN_AES <= 1'b1;
					Last_Word <= 1'b0;
			   end
        end
    end
endmodule