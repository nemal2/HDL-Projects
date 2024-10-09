`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nemal Perera
// 
// Create Date: 10/06/2024 09:35:28 PM
// Design Name: Counter Using DFF
// Module Name: d_flip_flop
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


module d_flip_flop(
    input D,R,C,
    output reg Q,Qbar
    );
    
    initial begin
        Q = 1'b0;
        Qbar = 1'b1;
    end
    
    always @(posedge C or R)
        begin
            if (R == 1'b1)
                begin
                    Q <= 1'b0;
                    Qbar <= 1'b1;
                end
            else
                begin
                    Q <= D;
                    Qbar <= ~D;
                end
        
        end
    
endmodule
