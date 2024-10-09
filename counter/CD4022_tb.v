`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nemal Perera
// 
// Create Date: 10/09/2024 01:04:36 PM
// Design Name: 
// Module Name: CD4022_tb
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


module CD4022_tb(
    );
    
    reg RESET, CLOCK, CLOCK_INHIBIT;
    wire [7:0] OUT;
    wire CARRY_OUT;

    wire OUT0, OUT1, OUT2, OUT3, OUT4, OUT5, OUT6, OUT7;

    CD4022 DUT(
        .RESET(RESET), 
        .CLOCK(CLOCK), 
        .CLOCK_INHIBIT(CLOCK_INHIBIT), 
        .OUT(OUT), 
        .CARRY_OUT(CARRY_OUT)
        );

    initial begin
        CLOCK = 0;
        forever #1 CLOCK = ~CLOCK;
    end

    initial begin
        RESET = 0;
        CLOCK_INHIBIT = 1;

        #2 RESET = 1;
        #2 RESET = 0;

        #2 CLOCK_INHIBIT = 0;
        
        #20 RESET = 1;
        #2 RESET = 0;
        
        #10 CLOCK_INHIBIT = 1;
        #2 CLOCK_INHIBIT = 1;
        
        #25 $finish;
               
    end
endmodule
