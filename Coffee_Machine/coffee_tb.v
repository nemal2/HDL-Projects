// test bench for coffee vendor

`timescale 1ns / 1ps

module coffee_tb();

	reg clk , rst, c_in, b_in;
	wire coff, bal;
	
	//initiate module to test
	coffee ut(.CLK(clk), .RST(rst), .C_IN(c_in), .B_IN(b_in), .COFF(coff), .BAL(bal));
	
	always #5 clk = !clk;
	
	initial begin
	$dumpfile("coffee.vcd");
    $dumpvars();
	
	clk=0; rst=0; c_in=0; b_in=0;
	
	#5 rst = 0;
	#10 c_in = 1;
	#10 c_in = 0;
	#10 c_in = 1;
	#10 c_in = 1;
	#10 c_in = 0;
	#10 c_in = 1;
	#10 c_in = 1;
	#10 c_in = 1;
	#10 c_in = 0;
	
	#10 b_in = 1;
	#10 b_in = 0;
	#10 b_in = 1;
	#10 b_in = 1;
	#10 b_in = 0;
	
	#10 $finish;
	
	end
endmodule