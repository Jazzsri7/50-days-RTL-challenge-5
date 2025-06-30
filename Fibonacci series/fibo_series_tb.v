module fibo_series_tb();

	reg clk,rst;
	wire [15:0] out;
	
	fibo_series DUT(.clk(clk),.rst(rst),.out(out));
	
	initial 
	begin
		clk=1'b0;
		forever #5 clk=~clk;
	end

	initial 
	begin
		rst=1;
		#10;
		rst=0;
		#300;
		$finish;
	end

	initial
	begin 
		$monitor("value of out=%d",out);
	end
endmodule
