module tlc_tb();
	
	reg clock,reset;
	wire r,g,y;
	
	parameter red=2'b00,
			yellow=2'b01,
			green=2'b10;
		
	tlc DUT(.clock(clock),.reset(reset),.r(r),.y(y),.g(g));

	initial 
		clock=0;
		
	always #5 clock=~clock;
	
	initial 
	begin
		reset=1;
		#10;
		reset=0;
		#600;
		$finish;
	end
	
	initial
		$monitor("r=%b,y=%b,g=%b",r,y,g);
	
endmodule
