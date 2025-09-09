module n_mod_counter #(parameter N=16)(input clock,reset,mode,
					output reg [$clog2(N)-1:0] count);
					
	
	always@(posedge clock)
	begin
		if(reset)
			count<=0;
		else if(mode)
		begin
			if(count==N-1)
				count<=0;
			else
				count<=count+1;
		end
	
		else
		begin
			if(count==0)
				count<=N-1;
			else
				count<=count-1;
		end
	end
	
endmodule
