`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nemal Perera
// 
// Create Date: 10/16/2024 10:29:32 PM
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
    input RESET,CLOCK,CLOCK_INHIBIT,
    output reg [7:0] OUT,
    output reg CARRY_OUT
    );
    
    reg [2:0] count;
    
    initial begin
        CARRY_OUT <= 1'b1;
        OUT <= 8'b00000001;
        count <= 3'b000;
    end
    
    always @ (posedge CLOCK or RESET) begin
        if (RESET) begin
            CARRY_OUT <= 1'b1;
            OUT <= 8'b00000001;
            count <= 3'b000;
        end
        else if (!CLOCK_INHIBIT) begin
            count <= count +1;
            OUT <= 8'b00000001 << count;
            if(count <= 3'b011)
                CARRY_OUT <= 1'b1;
            else
                CARRY_OUT <= 1'b0;
            
        end
    
    end
    
    
endmodule
