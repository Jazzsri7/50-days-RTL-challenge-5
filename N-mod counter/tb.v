module n_mod_counter_tb #(parameter N=16)();

	reg clock,reset,mode;
	wire [$clog2(N)-1:0] count;
	
	n_mod_counter DUT(.clock(clock),.reset(reset),.mode(mode),.count(count));
	
	initial
	begin
		clock=1'b0;
		forever #5 clock=~clock;
	end
	
	initial 
	begin
		reset=1;
		#10;
		reset=0;
		mode=1;
		#100;
		mode=0;
		#200
		$finish;
	end
	
endmodule
