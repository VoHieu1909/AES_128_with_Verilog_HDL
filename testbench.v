module testbench(input EN, input CLK, input [127:0]K_I, input [127:0]D_I, output reg[127:0]D_O, output [3:0]TEST_STATE);

	parameter S0 = 4'b0000, S1 = 4'b0001, S2 = 4'b0010, S3 = 4'b0011, 
             S4 = 4'b0100, S5 = 4'b0101, S6 = 4'b0110, S7 = 4'b0111,
             S8 = 4'b1000, S9 = 4'b1001, S10 = 4'b1010, S11 = 4'b1011,
             S12 = 4'b1100, S13 = 4'b1101, S14 = 4'b1110, S15 = 4'b1111;
	//STATE
	wire [3:0] STATE;
	//RCON
	wire [31:0]RCON;
	//Data 0
	wire [127:0]DATA_0;
	ARK FIRST_RK(K_I, D_I, DATA_0);
	//Giai doan qua 9 lan ma hoa
	wire EN_BIT = 1'b1;				//Bit enable
	wire [127:0]KEY_MIX;
	wire [127:0]DATA_MIX;
	wire [127:0]SUB;
	wire [127:0]SHIFT;
	wire [127:0]MIXC;
	//Co cac module Subbyte, ShiftRows, Mixcolumn
	SUBBYTE SB(D_OUT_BUFF, SUB);			//SUBBYTE
	SHIFTROWS SR(SUB, SHIFT);			//SHIFTROWS
	MIXCOLUMNS MC(DEMUX_A, MIXC);		//MIXCOLUMNS
	//Set RCON
	STATE_BLOCK ST_BLOCK(EN, CLK, STATE, RCON);		//CLK, STATE_OUT, RCON
	//Gan MUX
	wire [127:0]DEMUX_A;
	wire [127:0]DEMUX_B;
	DEMUX_128 DEMUX_MC(STATE == S10, SHIFT, DEMUX_A, DEMUX_B);		//DEMUX_A cho qua Mixcolumn, DEMUX_B khong qua Mixcolumn
	//MUX_MIXCOLUMN
	wire [127:0]SSM_DATA;
	MUX_128 MUX_DATA(STATE == S10, MIXC ,DEMUX_B, SSM_DATA);			//STATE = 10 cho du lieu tu DEMUX_B qua, STATE # 10 cho du lieu tu MIXC
	//MUX_DATA_IN
	wire [127:0]SL_DATA;		//Select Data
	MUX_128 MUX_D_IN(STATE == S0, DATA_MIX, DATA_0, SL_DATA);
	//MUX_KEY_IN
	wire [127:0]SL_KEY;		//Select Key
	MUX_128 MUX_K_IN(STATE == S0, KEY_MIX ,K_I, SL_KEY);
	//Key Buffer --> Khong co bi loi
	wire [127:0]K_OUT_BUFF;
	BUFFER KEY_BUFF(CLK, SL_KEY, K_OUT_BUFF);
	wire [127:0]D_OUT_BUFF;
	BUFFER DATA_BUFF(CLK, SL_DATA, D_OUT_BUFF);
	//Generate KEY
	KEY_EX GEN_KEY(CLK, K_OUT_BUFF, RCON, KEY_MIX);			//Gen key theo xung clock: KEY_MIX
	//Mixed Data with Generated Key
	ARK GEN_DATA(KEY_MIX, SSM_DATA, DATA_MIX);			//Data sau khi ra se quay ve tiep tuc chu ki nap du lieu
	//Test ngo ra
	always@(*)begin
		if(STATE == S10)begin
			D_O = DATA_MIX;
		end
		else begin
			D_O = 128'd0;
		end
	end
	assign TEST_STATE = STATE;
endmodule