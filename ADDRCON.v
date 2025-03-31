module ADDRCON(input [31:0]RCON, input [31:0]D_IN, output [31:0]D_OUT);

	assign D_OUT = RCON ^ D_IN;			//D_OUT = RCON XOR D_IN
	
endmodule