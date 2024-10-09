// push button door control test bench

`timescale 1ns/ 1ps

module push_tb;
	reg clk,rst,press;
	wire m_cw,m_acw;
	
	push ut(.CLK(clk), .RST(rst), .PRESS(press), .M_CW(m_cw), .M_ACW(m_acw));
	
	always #5 clk =! clk;
	
	initial begin
	$dumpfile("push.vcd");
    $dumpvars();
	
	clk=0; rst=0; press=0;
	
	#10 rst = 0;
	#10 press = 1;
	#10 press = 0;
	#10 press = 0;
	#10 press = 1;
	#10 press = 0;
	#10 press = 1;
	#10 press = 1;
	#10 press = 0;
	#20 $finish;
	
	end
endmodule