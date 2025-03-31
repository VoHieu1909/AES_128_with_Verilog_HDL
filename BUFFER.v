module BUFFER(
	input EN,
	input [127:0]D_IN,
	output reg [127:0]D_OUT
);

	always@(posedge EN)begin
		D_OUT = D_IN;
	end

endmodule