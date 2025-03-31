module ARK(
	input [127:0]KEY,
	input [127:0]DATA,
	output [127:0]MIXED_DATA
);
	assign MIXED_DATA = KEY ^ DATA;
endmodule