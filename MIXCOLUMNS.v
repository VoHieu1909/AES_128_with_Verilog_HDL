module MIXCOLUMNS(ST_I,ST_O);
input [0:127] ST_I; // complaint text
output [0:127] ST_O;

function [7:0] mul2; //multiply by 2
	input [7:0] x;
	begin 
			if(x[7] == 1) mul2 = ((x << 1) ^ 8'h1b);
			else mul2 = x << 1; 
	end 	
endfunction
function [7:0] mul3; //multiply by 3
	input [7:0] x;
	begin 
			
			mul3 = mul2(x) ^ x;
	end 
endfunction
// cot 1
assign ST_O[0+:8] = mul2(ST_I[0+:8])^mul3(ST_I[8+:8])^ST_I[16+:8]^ST_I[24+:8];
assign ST_O[8+:8] = ST_I[0+:8]^mul2(ST_I[8+:8])^mul3(ST_I[16+:8])^ST_I[24+:8];
assign ST_O[16+:8] = ST_I[0+:8]^ST_I[8+:8]^mul2(ST_I[16+:8])^mul3(ST_I[24+:8]);
assign ST_O[24+:8] = mul3(ST_I[0+:8]) ^ST_I[8+:8]^ST_I[16+:8]^mul2(ST_I[24+:8]);

assign ST_O[32+:8] = mul2(ST_I[32+:8])^mul3(ST_I[40+:8])^ST_I[48+:8]^ST_I[56+:8];
assign ST_O[40+:8] = ST_I[32+:8] ^mul2(ST_I[40+:8])^mul3(ST_I[48+:8])^ST_I[56+:8];
assign ST_O[48+:8] = ST_I[32+:8]^ST_I[40+:8]^mul2(ST_I[48+:8])^mul3(ST_I[56+:8]);
assign ST_O[56+:8] = mul3(ST_I[32+:8]) ^ST_I[40+:8]^ST_I[48+:8]^mul2(ST_I[56+:8]);

assign ST_O[64+:8] = mul2(ST_I[64+:8])^mul3(ST_I[72+:8])^ST_I[80+:8]^ST_I[88+:8];
assign ST_O[72+:8] = ST_I[64+:8] ^mul2(ST_I[72+:8])^mul3(ST_I[80+:8])^ST_I[88+:8];
assign ST_O[80+:8] = ST_I[64+:8]^ST_I[72+:8]^mul2(ST_I[80+:8])^mul3(ST_I[88+:8]);
assign ST_O[88+:8] = mul3(ST_I[64+:8]) ^ST_I[72+:8]^ST_I[80+:8]^mul2(ST_I[88+:8]);

assign ST_O[96+:8] = mul2(ST_I[96+:8])^mul3(ST_I[104+:8])^ST_I[112+:8]^ST_I[120+:8];
assign ST_O[104+:8] = ST_I[96+:8] ^mul2(ST_I[104+:8])^mul3(ST_I[112+:8])^ST_I[120+:8];
assign ST_O[112+:8] = ST_I[96+:8]^ST_I[104+:8]^mul2(ST_I[112+:8])^mul3(ST_I[120+:8]);
assign ST_O[120+:8] = mul3(ST_I[96+:8]) ^ST_I[104+:8]^ST_I[112+:8]^mul2(ST_I[120+:8]);

endmodule