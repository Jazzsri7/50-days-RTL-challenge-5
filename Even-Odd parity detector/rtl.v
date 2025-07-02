module pty_detector(input [3:0] in,
					output even_parity,
					output odd_parity);
					
	assign odd_parity=^in;
	assign even_parity=~odd_parity;
	
endmodule
