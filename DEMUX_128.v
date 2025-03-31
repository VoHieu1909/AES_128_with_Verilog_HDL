module DEMUX_128(
	input SELECT,
	input [127:0]I,
	output reg[127:0]O_A,
	output reg[127:0]O_B
);
	always@(*)begin
		if(SELECT)begin
			O_B = I;
			O_A = 128'b0;
		end
		else begin
			O_B = 128'b0;
			O_A = I;
		end
	end

endmodule