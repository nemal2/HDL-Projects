`timescale 1ns / 1ps

module push(
	input CLK, RST, PRESS,
	output reg M_CW, M_ACW

);

	//defining states
	//state values are constatnts
	localparam D_Lock = 1'b0,
			   D_Unlock = 1'b1;
			   
	reg STATE;
	
	always @(posedge CLK)
		begin
		
			if(RST==1)
				STATE <= D_Lock;
				
			else
				begin
					case(STATE)
						D_Unlock:begin
							M_ACW <= 0;
							
							if(PRESS == 1)
								begin
									STATE <= D_Lock;
									M_CW <= 1;
								end
								
							else
								begin
									STATE <= D_Unlock;
									M_CW <= 0;
								end
						end
						
						D_Lock: begin
							M_CW <= 0;
							
							if (PRESS == 1)
								begin
									STATE <= D_Unlock;
									M_ACW <= 1;
								end
							else
								begin
									STATE <= D_Lock;
									M_ACW <= 0;
								end
						end
						
						default:
							STATE <= D_Lock;
						
				endcase
			end
		end
endmodule
	