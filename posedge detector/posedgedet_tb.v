module posedgedet_tb();

	reg clk,rst,in;
	wire posed;
	
	posedgedet DUT(clk,rst,in,posed);
	
	initial 
	begin 
		clk=1;
		forever #2.5 clk=~clk;
	end
	
	initial
	begin
		in=0;
		forever #5 in=~in;
	
	end
	
	task reset();
	begin
		@(negedge clk)
			rst=1;
		@(negedge clk)
			rst=0;
	end
	endtask
		
	initial
		$monitor("rst=%b,clk=%b,in=%b,posed=%b",rst,clk,in,posed);
	
	
	initial 
	begin 
		reset();
		#100;
		reset;
		#200
		$finish;
	end
	
endmodule
