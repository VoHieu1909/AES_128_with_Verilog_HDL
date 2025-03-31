module SHIFTROWS(
	input [127:0]AFT,
	output reg [127:0]AFT_SR		//Them cai REG khong thoi no khong chay
);

	always@(*)begin
		//H0
		AFT_SR[127:120]=AFT[127:120];
		AFT_SR[119:112]=AFT[87:80];
		AFT_SR[111:104]=AFT[47:40];
		AFT_SR[103:96]=AFT[7:0];
		//H1
		AFT_SR[95:88]=AFT[95:88];
		AFT_SR[87:80]=AFT[55:48];
		AFT_SR[79:72]=AFT[15:8];
		AFT_SR[71:64]=AFT[103:96];
		//H2
		AFT_SR[63:56]=AFT[63:56];
		AFT_SR[55:48]=AFT[23:16];
		AFT_SR[47:40]=AFT[111:104];
		AFT_SR[39:32]=AFT[71:64];
		//H3
		AFT_SR[31:24]=AFT[31:24];
		AFT_SR[23:16]=AFT[119:112];
		AFT_SR[15:8]=AFT[79:72];
		AFT_SR[7:0]=AFT[39:32];
	
	end
	
	
	
endmodule