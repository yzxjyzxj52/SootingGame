module project (
	input l, //left
	input r, //right
	input CLK,
	input shoot,
	input pause,
	input [1:0] background,
	input start,
	output  reg [2:0] c, //control row
	output  [7:0] cr,
	output  [7:0] cg,
	output  [7:0] cb,
	output	EN,
	output  [6:0] clock
);
integer alreadyshoot=0;
integer i;
integer k;
integer col=0;
integer whenshoot = 0;
integer timestart;
integer timecontrol = 0;
integer check = 0;
reg [7:0] stateB [7:0];
reg [7:0] stateG [7:0];
reg [7:0] stateR [7:0];
initial
	begin
		c = 4'b1000;
		cr = 8'b11111111;
		cg = 8'b11111111;
		cb = 8'b11111111;
		clock = 7'b1111111;
		stateB[0] = 8'b11111111;
		stateB[1] = 8'b11111111;
		stateB[2] = 8'b11111111;
		stateB[3] = 8'b11111111;
		stateB[4] = 8'b11111111;
		stateB[5] = 8'b11111111;
		stateB[6] = 8'b11111111;
		stateB[7] = 8'b11111111;
		
		stateG[0] = 8'b11111111;
		stateG[1] = 8'b11111111;
		stateG[2] = 8'b11111111;
		stateG[3] = 8'b11111111;
		stateG[4] = 8'b11111111;
		stateG[5] = 8'b11111111;
		stateG[6] = 8'b11111111;
		stateG[7] = 8'b11111111;
		
		stateR[0] = 8'b11111111;
		stateR[1] = 8'b11111111;
		stateR[2] = 8'b11111111;
		stateR[3] = 8'b11111111;
		stateR[4] = 8'b11111111;
		stateR[5] = 8'b11111111;
		stateR[6] = 8'b11111111;
		stateR[7] = 8'b11111111;
	end

	bit [2:0] bullet; 
	


divfreq_4 F1(CLK, CLK_dis);
divfreq F0(CLK, pause, CLK_div);
 

always @(posedge CLK_div)
	begin
		if (start)
			begin		//reset background
						stateB[0] = 8'b11111111;
						stateB[1] = 8'b11111111;
						stateB[2] = 8'b11111111;
						stateB[3] = 8'b11111111;
						stateB[4] = 8'b11111111;
						stateB[5] = 8'b11111111;
						stateB[6] = 8'b11111111;
						stateB[7] = 8'b11111111;
						
						stateG[0] = 8'b11111111;
						stateG[1] = 8'b11111111;
						stateG[2] = 8'b11111111;
						stateG[3] = 8'b11111111;
						stateG[4] = 8'b11111111;
						stateG[5] = 8'b11111111;
						stateG[6] = 8'b11111111;
						stateG[7] = 8'b11111111;
						
						stateR[0] = 8'b11111111;
						stateR[1] = 8'b11111111;
						stateR[2] = 8'b11111111;
						stateR[3] = 8'b11111111;
						stateR[4] = 8'b11111111;
						stateR[5] = 8'b11111111;
						stateR[6] = 8'b11111111;
						stateR[7] = 8'b11111111;
						col = 0;
						timestart = 1;
						timecontrol = 0;
						clock = 7'b0100000;
				
				case ({background})
					2'b00 : //background 1
						begin
							for (integer j = 3; j < 8; j++)
								begin
									stateB[0][j] = 1'b0;
									stateG[0][j] = 1'b0;
									stateR[0][j] = 1'b0;
								end
							for (integer j = 1; j < 7; j++)
								begin
									stateB[j][5] = 1'b0;
									stateG[j][5] = 1'b0;
									stateR[j][5] = 1'b0;
								end
							for (integer j = 3; j < 8; j++)
								begin
									stateB[7][j] = 1'b0;
									stateG[7][j] = 1'b0;
									stateR[7][j] = 1'b0;
								end
							stateB[0][0] = 1'b0;
							stateR[0][0] = 1'b0;
							stateG[0][0] = 1'b0;
						end
					2'b01 : 		//background 2
						begin
						k=7;
							for(integer j=1;j<7;j++)
								begin 
									stateB[j][k] = 1'b0;
									stateG[j][k] = 1'b0;
									stateR[j][k] = 1'b0;
									k-=1;
									stateB[j][j+1] = 1'b0;
									stateG[j][j+1] = 1'b0;
									stateR[j][j+1] = 1'b0;
									
								
								end
							stateB[0][0] = 1'b0;
							stateR[0][0] = 1'b0;
							stateG[0][0] = 1'b0;
						end
					2'b10 :	//background 3
						begin
						stateB[0] = 8'b01001010;
						stateB[1] = 8'b10110111;
						stateB[2] = 8'b01001011;
						stateB[3] = 8'b11111111;
						stateB[4] = 8'b11111111;
						stateB[5] = 8'b01001011;
						stateB[6] = 8'b10110111;
						stateB[7] = 8'b01001011;
						
						stateG[0] = 8'b01001010;
						stateG[1] = 8'b10110111;
						stateG[2] = 8'b01001011;
						stateG[3] = 8'b11111111;
						stateG[4] = 8'b11111111;
						stateG[5] = 8'b01001011;
						stateG[6] = 8'b10110111;
						stateG[7] = 8'b01001011;
						
						stateR[0] = 8'b01001010;
						stateR[1] = 8'b10110111;
						stateR[2] = 8'b01001011;
						stateR[3] = 8'b11111111;
						stateR[4] = 8'b11111111;
						stateR[5] = 8'b01001011;
						stateR[6] = 8'b10110111;
						stateR[7] = 8'b01001011;
						
						end
					2'b11 :	//*background 4
						begin
							stateB[0] = 8'b00110010;
							stateB[1] = 8'b00110011;
							stateB[2] = 8'b11001111;
							stateB[3] = 8'b11001111;
							stateB[4] = 8'b11001111;
							stateB[5] = 8'b11001111;
							stateB[6] = 8'b00110011;
							stateB[7] = 8'b00110011;
							
							stateR[0] = 8'b00110010;
							stateR[1] = 8'b00110011;
							stateR[2] = 8'b11001111;
							stateR[3] = 8'b11001111;
							stateR[4] = 8'b11001111;
							stateR[5] = 8'b11001111;
							stateR[6] = 8'b00110011;
							stateR[7] = 8'b00110011;
							
							stateG[0] = 8'b00110010;
							stateG[1] = 8'b00110011;
							stateG[2] = 8'b11001111;
							stateG[3] = 8'b11001111;
							stateG[4] = 8'b11001111;
							stateG[5] = 8'b11001111;
							stateG[6] = 8'b00110011;
							stateG[7] = 8'b00110011;
						end
				endcase
			end	
		if (timestart)	
			begin
				case ({timecontrol}) 
					125:clock = 7'b0000001;
					105:clock = 7'b1001111;
					85:clock = 7'b0010010;
					65:clock = 7'b0000110;
					45:clock = 7'b1001100;
					25:clock = 7'b0100100;
					0:clock = 7'b0100000;
				endcase
				timecontrol +=1;
				if (timecontrol > 126)
					begin
						timestart = 0;
						timecontrol = 0;
						check = 1;
					end
			end
		
		if(l)	//move
			if(col!=0)
				begin
					stateR[col][0] =1;
					stateG[col][0] =1;
					stateB[col][0] =1;
					col -=1;
				   stateR[col][0] =0;
					stateG[col][0] =0;
					stateB[col][0] =0;
				end
		if(r)
			if(col!=7)
				begin
					stateR[col][0] =1;
					stateG[col][0] =1;
					stateB[col][0] =1;
					col +=1;
				   stateR[col][0] =0;
					stateG[col][0] =0;
					stateB[col][0] =0;
				end
		if(shoot)	//shoot
			begin
				if (alreadyshoot)
					begin
						stateR[bullet][i] = 1'b1;
					end
				else
					begin
						bullet = col;
						alreadyshoot = 1;
						i=1;
					end
			end
			
		if (alreadyshoot)
			begin
				
				if (i > 8)
					begin
						alreadyshoot = 0;
						i = 1;
					end
				else
					begin
						if (stateR[bullet][i] == 0 & stateG[bullet][i]==0 & stateB[bullet][i]==0)
							begin
								whenshoot=1;
							end
						if(whenshoot)
							begin
								stateR[bullet][i] = 1'b1;
								stateG[bullet][i] = 1'b1;
								stateB[bullet][i] = 1'b1;
								stateR[bullet][i - 1] = 1'b1;
								stateG[bullet][i - 1] = 1'b1;
								stateB[bullet][i - 1] = 1'b1;
								whenshoot = 0;
								alreadyshoot = 0;
							end
						else
							begin
							if(i>1)
								begin
									stateR[bullet][i - 1] = 1;
									stateG[bullet][i - 1] = 1;
									stateB[bullet][i - 1] = 1;
								end
								stateR[bullet][i] = 0;
								i += 1;
								
							end
					end
			end
		if (check)
			begin
				integer empty = 0;
				for (integer j = 0; j < 8; j++)
					for (integer z = 1; z < 8; z++)
						begin
							if (stateB[j][z] == 0)
								empty = 1;
						end
						stateB[0] = 8'b11111111;
						stateB[1] = 8'b11111111;
						stateB[2] = 8'b11111111;
						stateB[3] = 8'b11111111;
						stateB[4] = 8'b11111111;
						stateB[5] = 8'b11111111;
						stateB[6] = 8'b11111111;
						stateB[7] = 8'b11111111;
						
						stateG[0] = 8'b11111111;
						stateG[1] = 8'b11111111;
						stateG[2] = 8'b11111111;
						stateG[3] = 8'b11111111;
						stateG[4] = 8'b11111111;
						stateG[5] = 8'b11111111;
						stateG[6] = 8'b11111111;
						stateG[7] = 8'b11111111;
						
						stateR[0] = 8'b11111111;
						stateR[1] = 8'b11111111;
						stateR[2] = 8'b11111111;
						stateR[3] = 8'b11111111;
						stateR[4] = 8'b11111111;
						stateR[5] = 8'b11111111;
						stateR[6] = 8'b11111111;
						stateR[7] = 8'b11111111;
				if (empty)
					begin
						stateB[0] = 8'b01011111;
						stateB[1] = 8'b10111101;
						stateB[2] = 8'b01011011;
						stateB[3] = 8'b11110111;
						stateB[4] = 8'b11110111;
						stateB[5] = 8'b01011011;
						stateB[6] = 8'b10111101;
						stateB[7] = 8'b01011111;
						stateR[0] = 8'b01011111;
						stateR[1] = 8'b10111101;
						stateR[2] = 8'b01011011;
						stateR[3] = 8'b11110111;
						stateR[4] = 8'b11110111;
						stateR[5] = 8'b01011011;
						stateR[6] = 8'b10111101;
						stateR[7] = 8'b01011111;
						empty = 0;
					end
				else
					begin
						stateB[0] = 8'b10011001;
						stateB[1] = 8'b01110110;
						stateB[2] = 8'b01110110;
						stateB[3] = 8'b10011110;
						stateB[4] = 8'b10011110;
						stateB[5] = 8'b01110110;
						stateB[6] = 8'b01110110;
						stateB[7] = 8'b10011001;
						empty = 0;
					end
				check = 0;
			end
	end

always @(posedge CLK_dis)
	begin
		c = c + 1;
	end
assign EN = 1;
assign cr = stateR[c];
assign cb = stateB[c];
assign cg = stateG[c];

endmodule








module divfreq(input CLK,input pause, output reg CLK_div);
reg [24:0] Count;
always @(posedge CLK)
begin
if(Count > 5000000)
begin
Count <= 25'b0;
CLK_div <= ~CLK_div;
end
else
begin
if (pause)
Count <= Count;
else
Count <= Count + 1'b1;
end
end
endmodule

module divfreq_4(input CLK, output reg CLK_div);
reg [24:0] Count;
always @(posedge CLK)
begin
if(Count > 12500)
begin
Count <= 25'b0;
CLK_div <= ~CLK_div;
end
else
Count <= Count + 1'b1;
end
endmodule


