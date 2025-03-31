module STATE_BLOCK(
	input EN_BIT,
	input CLK,
	output reg [3:0]STATE,
	output reg [31:0]RCON
);
	parameter S0 = 4'b0000, S1 = 4'b0001, S2 = 4'b0010, S3 = 4'b0011, 
             S4 = 4'b0100, S5 = 4'b0101, S6 = 4'b0110, S7 = 4'b0111,
             S8 = 4'b1000, S9 = 4'b1001, S10 = 4'b1010, S11 = 4'b1011,
             S12 = 4'b1100, S13 = 4'b1101, S14 = 4'b1110, S15 = 4'b1111;
	parameter RCON_1 = 32'h01000000, RCON_2 = 32'h02000000,
				 RCON_3 = 32'h04000000, RCON_4 = 32'h08000000,
				 RCON_5 = 32'h10000000, RCON_6 = 32'h20000000,
				 RCON_7 = 32'h40000000, RCON_8 = 32'h80000000,
				 RCON_9 = 32'h1b000000, RCON_10 = 32'h36000000;
	//Declare State	
	always@(posedge CLK & EN_BIT)begin
		case(STATE)
			S0:begin
				RCON = RCON_1;
				STATE = S1;			//Khi S0 -> S1
			end
			S1:begin					//Xu li S1: RCON_1
				RCON = RCON_2;
				STATE = S2;
			end
			S2:begin
				RCON = RCON_3;
				STATE = S3;
			end
			S3:begin
				RCON = RCON_4;
				STATE = S4;
			end
			S4:begin
				RCON = RCON_5;
				STATE = S5;
			end
			S5:begin
				RCON = RCON_6;
				STATE = S6;
			end
			S6:begin
				RCON = RCON_7;
				STATE = S7;
			end
			S7:begin
				RCON = RCON_8;
				STATE = S8;
			end
			S8:begin
				RCON = RCON_9;
				STATE = S9;
			end
			S9:begin
				RCON = RCON_10;
				STATE = S10;
			end
			S10:begin			//State 10
				RCON = 32'b0;
				STATE = S0;
			end
			default:begin
				RCON = 32'b0;
				STATE = S0;		//RESET
			end
		endcase
	end	
endmodule