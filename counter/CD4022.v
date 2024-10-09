`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nemal Perera
// 
// Create Date: 10/06/2024 11:20:45 PM
// Design Name: 
// Module Name: CD4022
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CD4022(
    input RESET,
    input CLOCK,
    input CLOCK_INHIBIT,
    output [7:0] OUT,
    output CARRY_OUT
    );
    
    wire clock_inhibit_n;
    wire clock_gated;
    wire Nor0_out, Nor1_out;
    
    wire D0_Q, D1_Q, D2_Q, D3_Q;
    wire D0_Qbar, D1_Qbar, D2_Qbar, D3_Qbar;
    
    not Not0 (clock_inhibit_n, CLOCK_INHIBIT);
    and A0 (clock_gated, clock_inhibit_n, CLOCK);
    
    nor Nor0 (Nor0_out, DO_Q, D1_Qbar, D2_Q);
    nor Nor1 (Nor1_out, Nor0_out, D1_Qbar);
    
    d_flip_flop D0 (D3_Qbar, RESET, clock_gated, D0_Q, D0_Qbar);
	d_flip_flop D1 (D0_Qbar, RESET, clock_gated, D1_Q, D1_Qbar);
	d_flip_flop D2 (Nor1_out, RESET, clock_gated, D2_Q, D2_Qbar);
	d_flip_flop D3 (D2_Q, RESET, clock_gated, D3_Q, D3_Qbar);
    
    and N0(OUT[0], D0_Q, D3_Q);
	and N1(OUT[1],D0_Qbar, D1_Q);
	and N2(OUT[2],D1_Qbar, D2_Q);
	and N3(OUT[3],D2_Qbar, D3_Q);
	and N4(OUT[4],D0_Qbar, D3_Qbar);
	and N5(OUT[5],D0_Q, D1_Qbar);
	and N6(OUT[6],D1_Q, D2_Qbar);
	and N7(OUT[7],D2_Q, D3_Qbar);

	assign CARRY_OUT = D3_Q;
    
endmodule
