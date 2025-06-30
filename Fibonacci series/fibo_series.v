module fibo_series(clk,rst,out);
	input clk,rst;
	output reg [15:0] out;
	
	reg [15:0] a,b;
	reg [15:0] temp;
	
	always@(posedge clk)
	begin
		if(rst)
		begin
			a<=0;
			b<=1;
			out<=0;
			temp<=0;
		end
		
		else
		begin
			temp=a+b;
			
			out<=temp;
			a<=b;
			b<=temp;
		end
	end
endmodule
