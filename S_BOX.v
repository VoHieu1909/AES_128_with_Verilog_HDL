module S_BOX (
    input wire [127:0] data_in,           // Dữ liệu đầu vào 8 bit
    output reg [127:0] data_out           // Dữ liệu đầu ra 8 bit
);
    // Khai báo mảng S-Box 256 phần tử
    reg [7:0] S_BOX [0:255];

    always@(*) begin
			//0
			S_BOX[0]=8'h63; S_BOX[1]=8'h7c; S_BOX[2]=8'h77; S_BOX[3]=8'h7b; S_BOX[4]=8'hf2; S_BOX[5]=8'h6b; S_BOX[6]=8'h6f; S_BOX[7]=8'hc5;
			S_BOX[8]=8'h30; S_BOX[9]=8'h01; S_BOX[10]=8'h67; S_BOX[11]=8'h2b; S_BOX[12]=8'hfe; S_BOX[13]=8'hd7; S_BOX[14]=8'hab; S_BOX[15]=8'h76;
			//1
			S_BOX[16]=8'hca; S_BOX[17]=8'h82; S_BOX[18]=8'hc9; S_BOX[19]=8'h7d; S_BOX[20]=8'hfa; S_BOX[21]=8'h59; S_BOX[22]=8'h47; S_BOX[23]=8'hf0;
			S_BOX[24]=8'had; S_BOX[25]=8'hd4; S_BOX[26]=8'ha2; S_BOX[27]=8'haf; S_BOX[28]=8'h9c; S_BOX[29]=8'ha4; S_BOX[30]=8'h72; S_BOX[31]=8'hc0;
			//2
			S_BOX[32]=8'hb7; S_BOX[33]=8'hfd; S_BOX[34]=8'h93; S_BOX[35]=8'h26; S_BOX[36]=8'h36; S_BOX[37]=8'h3f; S_BOX[38]=8'hf7; S_BOX[39]=8'hcc;
			S_BOX[40]=8'h34; S_BOX[41]=8'ha5; S_BOX[42]=8'he5; S_BOX[43]=8'hf1; S_BOX[44]=8'h71; S_BOX[45]=8'hd8; S_BOX[46]=8'h31; S_BOX[47]=8'h15;
			//3
			S_BOX[48]=8'h04; S_BOX[49]=8'hc7; S_BOX[50]=8'h23; S_BOX[51]=8'hc3; S_BOX[52]=8'h18; S_BOX[53]=8'h96; S_BOX[54]=8'h05; S_BOX[55]=8'h9a;
			S_BOX[56]=8'h07; S_BOX[57]=8'h12; S_BOX[58]=8'h80; S_BOX[59]=8'he2; S_BOX[60]=8'heb; S_BOX[61]=8'h27; S_BOX[62]=8'hb2; S_BOX[63]=8'h75;
			//4
			S_BOX[64]=8'h09; S_BOX[65]=8'h83; S_BOX[66]=8'h2c; S_BOX[67]=8'h1a; S_BOX[68]=8'h1b; S_BOX[69]=8'h6e; S_BOX[70]=8'h5a; S_BOX[71]=8'ha0;
			S_BOX[72]=8'h52; S_BOX[73]=8'h3b; S_BOX[74]=8'hd6; S_BOX[75]=8'hb3; S_BOX[76]=8'h29; S_BOX[77]=8'he3; S_BOX[78]=8'h2f; S_BOX[79]=8'h84;
			//5
			S_BOX[80]=8'h53; S_BOX[81]=8'hd1; S_BOX[82]=8'h00; S_BOX[83]=8'hed; S_BOX[84]=8'h20; S_BOX[85]=8'hfc; S_BOX[86]=8'hb1; S_BOX[87]=8'h5b;
			S_BOX[88]=8'h6a; S_BOX[89]=8'hcb; S_BOX[90]=8'hbe; S_BOX[91]=8'h39; S_BOX[92]=8'h4a; S_BOX[93]=8'h4c; S_BOX[94]=8'h58; S_BOX[95]=8'hcf;
			//6
			S_BOX[96]=8'hd0; S_BOX[97]=8'hef; S_BOX[98]=8'haa; S_BOX[99]=8'hfb; S_BOX[100]=8'h43; S_BOX[101]=8'h4d; S_BOX[102]=8'h33; S_BOX[103]=8'h85;
			S_BOX[104]=8'h45; S_BOX[105]=8'hf9; S_BOX[106]=8'h02; S_BOX[107]=8'h7f; S_BOX[108]=8'h50; S_BOX[109]=8'h3c; S_BOX[110]=8'h9f; S_BOX[111]=8'ha8;
			//7
			S_BOX[112]=8'h51; S_BOX[113]=8'ha3; S_BOX[114]=8'h40; S_BOX[115]=8'h8f; S_BOX[116]=8'h92; S_BOX[117]=8'h9d; S_BOX[118]=8'h38; S_BOX[119]=8'hf5;
			S_BOX[120]=8'hbc; S_BOX[121]=8'hb6; S_BOX[122]=8'hda; S_BOX[123]=8'h21; S_BOX[124]=8'h10; S_BOX[125]=8'hff; S_BOX[126]=8'hf3; S_BOX[127]=8'hd2;
			//8
			S_BOX[128]=8'hcd; S_BOX[129]=8'h0c; S_BOX[130]=8'h13; S_BOX[131]=8'hec; S_BOX[132]=8'h5f; S_BOX[133]=8'h97; S_BOX[134]=8'h44; S_BOX[135]=8'h17;
			S_BOX[136]=8'hc4; S_BOX[137]=8'ha7; S_BOX[138]=8'h7e; S_BOX[139]=8'h3d; S_BOX[140]=8'h64; S_BOX[141]=8'h5d; S_BOX[142]=8'h19; S_BOX[143]=8'h73;
			//9
			S_BOX[144]=8'h60; S_BOX[145]=8'h81; S_BOX[146]=8'h4f; S_BOX[147]=8'hdc; S_BOX[148]=8'h22; S_BOX[149]=8'h2a; S_BOX[150]=8'h90; S_BOX[151]=8'h88;
			S_BOX[152]=8'h46; S_BOX[153]=8'hee; S_BOX[154]=8'hb8; S_BOX[155]=8'h14; S_BOX[156]=8'hde; S_BOX[157]=8'h5e; S_BOX[158]=8'h0b; S_BOX[159]=8'hdb;
			//a
			S_BOX[160]=8'he0; S_BOX[161]=8'h32; S_BOX[162]=8'h3a; S_BOX[163]=8'h0a; S_BOX[164]=8'h49; S_BOX[165]=8'h06; S_BOX[166]=8'h24; S_BOX[167]=8'h5c;
			S_BOX[168]=8'hc2; S_BOX[169]=8'hd3; S_BOX[170]=8'hac; S_BOX[171]=8'h62; S_BOX[172]=8'h91; S_BOX[173]=8'h95; S_BOX[174]=8'he4; S_BOX[175]=8'h79;
			//b
			S_BOX[176]=8'he7; S_BOX[177]=8'hc8; S_BOX[178]=8'h37; S_BOX[179]=8'h6d; S_BOX[180]=8'h8d; S_BOX[181]=8'hd5; S_BOX[182]=8'h4e; S_BOX[183]=8'ha9;
			S_BOX[184]=8'h6c; S_BOX[185]=8'h56; S_BOX[186]=8'hf4; S_BOX[187]=8'hea; S_BOX[188]=8'h65; S_BOX[189]=8'h7a; S_BOX[190]=8'hae; S_BOX[191]=8'h08;
			//c
			S_BOX[192]=8'hba; S_BOX[193]=8'h78; S_BOX[194]=8'h25; S_BOX[195]=8'h2e; S_BOX[196]=8'h1c; S_BOX[197]=8'ha6; S_BOX[198]=8'hb4; S_BOX[199]=8'hc6;
			S_BOX[200]=8'he8; S_BOX[201]=8'hdd; S_BOX[202]=8'h74; S_BOX[203]=8'h1f; S_BOX[204]=8'h4b; S_BOX[205]=8'hbd; S_BOX[206]=8'h8b; S_BOX[207]=8'h8a;
			//d
			S_BOX[208]=8'h70; S_BOX[209]=8'h3e; S_BOX[210]=8'hb5; S_BOX[211]=8'h66; S_BOX[212]=8'h48; S_BOX[213]=8'h03; S_BOX[214]=8'hf6; S_BOX[215]=8'h0e;
			S_BOX[216]=8'h61; S_BOX[217]=8'h35; S_BOX[218]=8'h57; S_BOX[219]=8'hb9; S_BOX[220]=8'h86; S_BOX[221]=8'hc1; S_BOX[222]=8'h1d; S_BOX[223]=8'h9e;
			//e
			S_BOX[224]=8'he1; S_BOX[225]=8'hf8; S_BOX[226]=8'h98; S_BOX[227]=8'h11; S_BOX[228]=8'h69; S_BOX[229]=8'hd9; S_BOX[230]=8'h8e; S_BOX[231]=8'h94;
			S_BOX[232]=8'h9b; S_BOX[233]=8'h1e; S_BOX[234]=8'h87; S_BOX[235]=8'he9; S_BOX[236]=8'hce; S_BOX[237]=8'h55; S_BOX[238]=8'h28; S_BOX[239]=8'hdf;
			//f
			S_BOX[240]=8'h8c; S_BOX[241]=8'ha1; S_BOX[242]=8'h89; S_BOX[243]=8'h0d; S_BOX[244]=8'hbf; S_BOX[245]=8'he6; S_BOX[246]=8'h42; S_BOX[247]=8'h68;
			S_BOX[248]=8'h41; S_BOX[249]=8'h99; S_BOX[250]=8'h2d; S_BOX[251]=8'h0f; S_BOX[252]=8'hb0; S_BOX[253]=8'h54; S_BOX[254]=8'hbb; S_BOX[255]=8'h16;
	 end
	 
    // Định nghĩa đầu ra dựa vào đầu vào
    always @(*) begin
         data_out[7:0]   = S_BOX[data_in[7:0]];         
        data_out[15:8]  = S_BOX[data_in[15:8]];        
        data_out[23:16] = S_BOX[data_in[23:16]];       
        data_out[31:24] = S_BOX[data_in[31:24]];       
        data_out[39:32] = S_BOX[data_in[39:32]];       
        data_out[47:40] = S_BOX[data_in[47:40]];       
        data_out[55:48] = S_BOX[data_in[55:48]];       
        data_out[63:56] = S_BOX[data_in[63:56]];       
        data_out[71:64] = S_BOX[data_in[71:64]];       
        data_out[79:72] = S_BOX[data_in[79:72]];       
        data_out[87:80] = S_BOX[data_in[87:80]];       
        data_out[95:88] = S_BOX[data_in[95:88]];       
        data_out[103:96] = S_BOX[data_in[103:96]];     
        data_out[111:104] = S_BOX[data_in[111:104]];   
        data_out[119:112] = S_BOX[data_in[119:112]];   
        data_out[127:120] = S_BOX[data_in[127:120]];  
    end
endmodule