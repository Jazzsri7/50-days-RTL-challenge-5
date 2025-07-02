module pty_detector_tb();

	reg [3:0] in;
	wire even_parity;
	wire odd_parity;
	
	pty_detector DUT(.in(in),.even_parity(even_parity),.odd_parity(odd_parity));
	
	task inputs(input [3:0] i);
	begin
		in=i;
	end
	endtask
	
	initial 
	begin
		inputs(4'd8);
		#10;
		inputs(4'd12);
		#10;
		inputs(4'd11);
		#10;
		inputs(4'd15);
		#10;
		inputs(4'd4);
		#10;
		$finish;
	end
	
	initial 
		$monitor("value of even_parity=%b, odd_parity=%b",even_parity,odd_parity);
		
endmodule
