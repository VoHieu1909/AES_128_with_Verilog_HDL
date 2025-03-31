module SUBBYTE(
	input [127:0] ARK, 
	output reg [127:0] AFT_SB
);
	wire [127:0] sb_out;		//Khong co cai nay no bi loi
	S_BOX MD0(ARK, sb_out);
	
	always@(*)begin
		AFT_SB = sb_out;
	end
endmodule