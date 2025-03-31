module KEY_EX(
	 input ST_AW,			//Co the dung lam enable
    input [127:0] K_I,
    input [31:0] RCON,
    output reg [127:0] R_K // Chỉ cho phép một khóa vòng ra ngoài
);
	//Tinh g(W3)
	wire [31:0]AF_RW;
	ROTWORD M1(K_I[31:0], AF_RW);
	wire [31:0]AF_SW;
	SUBWORD M2(AF_RW, AF_SW);
	wire [31:0]AF_RC;
	ADDRCON M3(RCON, AF_SW, AF_RC);

	always@(*)begin //Blocking Sequential		- Nua sua lai them tich cuc MUC: ST_AW
	//W4 = W0 xor g(W3)
		R_K[127:96] = AF_RC ^ K_I[127:96];	
	//W5 = W4 xor W1
		R_K[95:64] = R_K[127:96] ^ K_I[95:64];
	//W6 = W5 xor W2
		R_K[63:32] = R_K[95:64] ^ K_I[63:32];
	//W7 = W6 xor W3
		R_K[31:0] = R_K[63:32] ^ K_I[31:0];
	//Gan lai output
	end
	

endmodule