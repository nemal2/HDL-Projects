`timescale 1ns/1ps

module coffee(
	input RST, CLK, C_IN, B_IN,
	output reg BAL, COFF
);

//posible states
	localparam  COUNTER = 2'b00,
			C_25 = 2'b01,
			C_50 = 2'b10;
			
// 2 bit regioster for store the states
	reg [1:0] STATE;
	
	always @(posedge CLK)
		begin
			if(RST==1)
				STATE <= COUNTER;
				
			else
				begin
					case(STATE)
					//first case
					COUNTER:begin
						COFF <= 0;
						BAL <= 0;
						
						if(C_IN ==1)
							STATE <= C_25;
						
						else if (B_IN == 1) 
							begin
								STATE <= COUNTER;
								BAL <= 1;
								COFF <= 1;
							end
						
						else
							STATE <= COUNTER;
					end
					
					// second case
					C_25 : begin
						COFF <= 0;
						BAL <= 0;
						
						if(C_IN ==1)
							STATE <= C_50; 
							
						else
							STATE <= C_25;
						
					end
					
					//third case
					C_50 : begin
						COFF <= 0;
						BAL <= 0;
						
						if(C_IN ==1)
						begin
							STATE <= COUNTER;
							COFF <= 1;
						end
							
						else
							STATE <= C_50;
						
					end
					
					default:
						STATE <= COUNTER;
						
				endcase
			end
		end
endmodule		